"""Reproduce employee1's November 28 static review; no serial I/O or flash writes."""
import argparse
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import re
import struct
import subprocess
import sys
import xml.etree.ElementTree as ET

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
EXPECTED_EXE = '91ce79dbe330a024e317e915230cf146db6724b9eb8e56918094f9a820d4df64'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--mcu-root', type=Path, help='Optional existing RT-Thread checkout; never modified')
    args = parser.parse_args()
    exe = ROOT / 'ms150-升级工具/MCDT_5.4_Deploy_20260702_150214/MCDTV5.exe'
    data = exe.read_bytes()
    assert sha(data) == EXPECTED_EXE, 'EXE version differs; fixed addresses are invalid'
    pe = struct.unpack_from('<I', data, 0x3c)[0]
    assert data[pe:pe+4] == b'PE\0\0'
    machine, nsec = struct.unpack_from('<HH', data, pe+4)
    optsize = struct.unpack_from('<H', data, pe+20)[0]
    opt = pe+24
    assert machine == 0x8664 and struct.unpack_from('<H', data, opt)[0] == 0x20b
    base = struct.unpack_from('<Q', data, opt+24)[0]
    sections = []
    for i in range(nsec):
        off = opt+optsize+40*i
        virtual_size, rva, raw_size, raw = struct.unpack_from('<4I', data, off+8)
        sections.append((rva, raw_size, raw))

    def va(addr, length):
        rva = addr-base
        for start, size, off in sections:
            if start <= rva and rva+length <= start+size:
                return data[off+rva-start:off+rva-start+length]
        raise ValueError(hex(addr))

    rates = list(struct.unpack('<12I', va(0x14034a630, 48)))
    assert va(0x14013cb04, 7) == bytes.fromhex('c745c800093d00')
    rates.append(4000000)
    assert rates == [9600,19200,38400,57600,115200,230400,460800,921600,1000000,1500000,2000000,3000000,4000000]
    instructions = {
        'unprotect1_mode7': (0x14013e0d1, 'c745ef07000000'),
        'unprotect2_mode7': (0x14013e1b3, 'c745ef07000000'),
        'mode7_at_least_two': (0x14013dd40, '83fb02'),
        'mode6_exact_256': (0x14013dd68, '81fb00010000'),
        'baud_skip_clock_if_57600': (0x14013cbab, '4181f800e10000'),
        'baud_receive_mode8': (0x14013cc7d, 'c744242008000000'),
        'baud_wait_500ms': (0x14013cd40, 'b9f4010000'),
        'baud_local_attempt_limit5': (0x14013cd7a, '83fb05'),
        'nv_crc_seed_ff': (0x140148930, 'b2ff'),
        'nv_crc_count_from_object': (0x140148932, '4c638610020000'),
    }
    checked = {}
    for label, (address, expected) in instructions.items():
        actual = va(address, len(bytes.fromhex(expected))).hex()
        assert actual == expected, (label, actual)
        checked[label] = {'va':hex(address), 'bytes':actual}
    mode_targets = {}
    for mode in [6,7,8,9]:
        index = va(0x14013df64+mode-6, 1)[0]
        mode_targets[str(mode)] = hex(base+struct.unpack('<I', va(0x14013df3c+index*4, 4))[0])
    assert mode_targets['6'] == '0x14013dd68' and mode_targets['7'] == '0x14013dd40'

    peer = ROOT/'work/2026-11-11-ntn-上位机串口升级/step1/员工3/tools/compile_nv_xml.py'
    spec = importlib.util.spec_from_file_location('review_peer_nv', peer)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    nv = next((ROOT/'ms150-升级工具/升级固件').glob('ST1000_V00_R005_CA034(1)/*/shark_ntn_config_nv_v1.9.xml'))
    xml = ET.parse(nv).getroot()
    version = xml.find('Version/CurrentVersion')
    expected_version = version.attrib['value'].encode('ascii').ljust(int(version.attrib['length']), b'\0')
    with contextlib.redirect_stdout(io.StringIO()):
        compiled = module.compile_nv_xml(str(nv))
    nv_check = {'peer_script_sha256':sha(peer.read_bytes()), 'output_len':len(compiled),
                'prefix_hex':compiled[:12].hex(' '), 'expected_version_at_offset4':expected_version.hex(' '),
                'version_present_at_offset4':compiled[4:8] == expected_version,
                'vendor_golden_verified':False}
    assert not nv_check['version_present_at_offset4'], 'Peer script changed; re-review rather than reuse old finding'
    stage = {'status':'DESIGN_ONLY_NOT_ALLOCATED', 'user_file_list_release':'CA033','user_screenshot_release':'CA034',
             'meta_a':[hex(0x212000),hex(0x213000)], 'meta_b':[hex(0x213000),hex(0x214000)],
             'data':[hex(0x214000),hex(0x514000)],
             'nv_binary_reserve':[hex(0x513000),hex(0x514000)],'packages':[]}
    for version in ['033','034']:
        directory = ROOT/f'ms150-升级工具/升级固件/ST1000_V00_R005_CA{version}(1)/ST1000_V00_R005_CA{version}'
        cursor = 0x214000
        components = []
        total = 0
        for kind, pattern, install in [('E31','E31/**/*.bin','paired_component'),('DSP','DSP/*.bin','paired_component'),
                                        ('SECOND_BOOT','shark_ntn_second_boot_v1.3.bin','full_profile_component_pending_validation'),
                                        ('NV_XML','shark_ntn_config_nv_v1.9.xml','compile_then_validate_NV_BIN_for_full_profile')]:
            items = list(directory.glob(pattern)); assert len(items)==1, items
            source = items[0]; raw = source.read_bytes(); size = len(raw)
            end = cursor+size; erase_end = (end+0xfff)&~0xfff
            assert cursor % 4096 == 0 and erase_end <= 0x513000
            components.append({'kind':kind,'filename':source.name,'size':size,'sha256':sha(raw),
                               'cache_offset':hex(cursor),'data_end_exclusive':hex(end),
                               'erase_end_exclusive':hex(erase_end),'install_policy':install})
            total += size; cursor = erase_end
        logmap = list(directory.glob('E31/**/*_logmap.json')); assert len(logmap)==1
        logdata = logmap[0].read_bytes()
        assert total+len(logdata) > 0x300000  # Raw five-file package does not fit the proposed 3 MiB cache.
        stage['packages'].append({'version':'CA'+version,'components':components,'four_file_bytes':total,
                                  'cache_used_aligned':cursor-0x214000,'cache_margin':0x514000-cursor,
                                  'logmap':{'filename':logmap[0].name,'size':len(logdata),'sha256':sha(logdata),'storage':'PC_ONLY'},
                                  'five_file_raw_total':total+len(logdata)})
    code = None
    if args.mcu_root:
        checkout = args.mcu_root.resolve()
        def git(*parts):
            return subprocess.check_output(['git','-C',str(checkout),*parts]).decode().strip()
        source_paths = [
            'bsp/hc32/ev_hc32f460_lqfp100_v2/boot/ota_layout.h',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/boot/ota_icg.h',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/board/ports/fal_cfg.h',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/applications/app_flash.c',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/applications/hw_power.c',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/applications/mcu_local_cmd.c',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/applications/task_wdt.c',
            'bsp/hc32/ev_hc32f460_lqfp100_v2/.config',
            'bsp/hc32/libraries/hc32_drivers/drv_usart.c',
        ]
        code = {'head':git('rev-parse','HEAD'), 'branch':git('branch','--show-current'), 'sources':[]}
        for rel in source_paths:
            raw = (checkout/rel).read_bytes()
            committed = subprocess.check_output(['git','-C',str(checkout),'show',f'HEAD:{rel}'])
            same = raw.replace(b'\r\n',b'\n') == committed.replace(b'\r\n',b'\n')
            assert same, f'Reviewed source has uncommitted changes: {rel}'
            code['sources'].append({'path':rel, 'sha256_lf':sha(raw.replace(b'\r\n',b'\n')), 'matches_head':same})
        layout = (checkout/source_paths[0]).read_text()
        definitions = {k:int(v,0) for k,v in re.findall(r'^#define\s+(NTN_OTA_\w+)\s+(0x[0-9A-Fa-f]+|[0-9]+)\s*$',layout,re.M)}
        assert definitions['NTN_OTA_NOR_RESERVED'] == 0x212000
        assert definitions['NTN_OTA_SCRATCH'] == 0x200000
        code['ota_reserved'] = {'start':hex(definitions['NTN_OTA_NOR_RESERVED']), 'end_exclusive':hex(definitions['NTN_OTA_NOR_SIZE']),
                                'size':definitions['NTN_OTA_NOR_SIZE']-definitions['NTN_OTA_NOR_RESERVED']}
    result = {'review_date':'2026-11-28','status':'PASS_STATIC_REVIEW_WITH_NV_DEFECT_CONFIRMED',
              'hardware_tested':False,'exe_sha256':EXPECTED_EXE,'receive_modes':mode_targets,
              'baud_table':[{'index':i,'baud':rate,'tx_hex':bytes([0x50,i,0xff^0x50^i]).hex(' ')} for i,rate in enumerate(rates)],
              'checked_instructions':checked,'peer_nv':nv_check,'external_flash_plan':stage,'mcu':code}
    (OUT/'review_20261128.json').write_bytes((json.dumps(result,ensure_ascii=False,indent=2)+'\n').encode('utf-8'))
    print(json.dumps({k:result[k] for k in ['status','hardware_tested','exe_sha256','peer_nv']},ensure_ascii=False,indent=2))


if __name__ == '__main__':
    main()
