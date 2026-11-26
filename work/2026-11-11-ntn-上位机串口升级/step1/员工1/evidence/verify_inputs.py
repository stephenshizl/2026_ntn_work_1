"""Read-only firmware/protocol checks. Never opens a serial port or writes flash."""
from pathlib import Path
import hashlib, json, tarfile, configparser

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent

def frame(hex_without_checksum):
    data = bytes.fromhex(hex_without_checksum)
    check = 0xff
    for byte in data:
        check ^= byte
    return (data + bytes([check])).hex(' ').upper()

def main():
    vectors = {x:frame(x) for x in ['C0','46','55','5009','5004','B0',
                '575680001806000001','575680002400000200','EB00000000',
                '2000000000','20004C4000','20004C5000','20004C6000']}
    assert vectors['EB00000000'] == 'EB 00 00 00 00 14'
    assert vectors['5009'] == '50 09 A6'
    assert vectors['20004C6000'] == '20 00 4C 60 00 F3'
    tool = ROOT/'ms150-升级工具/MCDT_5.4_Deploy_20260702_150214'
    cfg=configparser.ConfigParser()
    cfg.read_string((tool/'mlink/config/sharkNTN/flashPartition.ini').read_text(encoding='gb18030'))
    parts={name:{k:int(cfg[name][k],0) for k in ['offset','size']} for name in ['firmware_part','dsp0_code_part','cfg_nv_part']}
    packages=[]
    for version in ['033','034']:
        directory=ROOT/f'ms150-升级工具/升级固件/ST1000_V00_R005_CA{version}(1)/ST1000_V00_R005_CA{version}'
        images={}
        for label,pattern,part in [('e31','E31/**/*.bin','firmware_part'),('dsp','DSP/*.bin','dsp0_code_part')]:
            paths=list(directory.glob(pattern))
            assert len(paths)==1, paths
            path=paths[0]; data=path.read_bytes(); n=len(data); start=parts[part]['offset'];size=parts[part]['size']
            erased=((n+4095)//4096)*4096
            assert n<=size and erased<=size and start%4096==0
            images[label]={'path':str(path.relative_to(ROOT)),'size':n,'size_hex':hex(n),'sha256':hashlib.sha256(data).hexdigest(),
                           'offset':hex(start),'partition_size':hex(size),'data_end_exclusive':hex(start+n),
                           'erase_end_exclusive':hex(start+erased),'sectors_4k':erased//4096,
                           'chunks_4k':(n+4095)//4096,'last_chunk_size':n%4096 or 4096}
        tarpath=next(directory.glob('E31/*.tar.gz'))
        with tarfile.open(tarpath) as tar:
            bins=[m for m in tar.getmembers() if m.name.endswith('.bin')]
            assert len(bins)==1
            embedded=tar.extractfile(bins[0]).read()
            assert hashlib.sha256(embedded).hexdigest()==images['e31']['sha256']
        total=sum(v['size'] for v in images.values())
        packages.append({'version':'CA'+version,'images':images,'e31_dsp_total':total,
                         'serial_8n1_payload_min_seconds':{str(rate):round(total*10/rate,3) for rate in [115200,1500000]}})
    for name in ['shark_ntn_config_nv_v1.9.xml','shark_ntn_second_boot_v1.3.bin']:
        assert (ROOT/f'ms150-升级工具/升级固件/ST1000_V00_R005_CA033(1)/ST1000_V00_R005_CA033/{name}').read_bytes()==(ROOT/f'ms150-升级工具/升级固件/ST1000_V00_R005_CA034(1)/ST1000_V00_R005_CA034/{name}').read_bytes()
    result={'status':'PASS_OFFLINE_ONLY','hardware_tested':False,'vectors':vectors,'packages':packages,
            'checks':['XOR golden vectors','image/partition and erase bounds','archive BIN matches extracted BIN','CA033/034 boot and NV equality'],
            'limitations':['No serial/board test','No target flash table read','No NV binary conversion','No proof of boot rollback']}
    (OUT/'verification.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2))

if __name__=='__main__':
    main()
