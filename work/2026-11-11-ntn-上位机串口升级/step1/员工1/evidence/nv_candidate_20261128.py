"""Offline candidate from bounded static analysis. Not a validated NV flasher."""
from pathlib import Path
import hashlib
import json
import struct
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent


def xor_ff(data):
    result = 0xff
    for byte in data:
        result ^= byte
    return result


def main():
    results = []
    for release in ['033','034']:
        xml = next((ROOT/'ms150-升级工具/升级固件').glob(f'ST1000_V00_R005_CA{release}(1)/*/shark_ntn_config_nv_v1.9.xml'))
        raw = xml.read_bytes()
        root = ET.fromstring(raw)
        buf = bytearray()
        fields = []
        crc_field = None
        fmts = {'U8':'<B','S8':'<b','U16':'<H','S16':'<h','U32':'<I','S32':'<i'}
        # This fixture supports only the primitive types present in the supplied XML.
        # It is not a general replacement for MCDT's XML compiler.
        for node in root.iter():
            if 'value' not in node.attrib:
                continue
            kind = node.attrib['type']
            offset = len(buf)
            if kind == 'STRING':
                size = int(node.attrib['length'])
                encoded = node.attrib['value'].encode('ascii')
                assert len(encoded) <= size
                encoded = encoded.ljust(size,b'\0')
            else:
                assert kind in fmts, f'Unsupported field type {kind}'
                encoded = struct.pack(fmts[kind],int(node.attrib['value'],0))
            buf.extend(encoded)
            fields.append({'name':node.tag,'type':kind,'offset':offset,'size':len(encoded)})
            if node.tag == 'PageCRC':
                assert kind == 'U8' and crc_field is None
                crc_field = offset
        assert len(buf) <= 512 and crc_field == len(buf)-1
        assert buf[:8] == bytes.fromhex('00000101312e3600')
        buf[crc_field] = 0
        checksum = xor_ff(buf)
        buf[crc_field] = checksum
        assert xor_ff(buf) == 0
        pages = []
        for offset in range(0,len(buf),256):
            payload = bytes(buf[offset:offset+256])
            valid = len(payload)
            payload = payload.ljust(256,b'\0')
            for base in [0x4c4000,0x4c6000]:
                body = b'\x02'+(base+offset).to_bytes(4,'big')+payload
                pages.append({'target_address_reference_only':hex(base+offset),'valid_bytes':valid,
                              'zero_padding':256-valid,'tx_frame_length':len(body)+1,
                              'tx_header_hex':body[:5].hex(' '),'frame_xor':hex(xor_ff(body)),
                              'page_sha256':hashlib.sha256(payload).hexdigest()})
        results.append({'release':'CA'+release,'xml_size':len(raw),'xml_sha256':hashlib.sha256(raw).hexdigest(),
                        'xml_crlf_restored_sha256':hashlib.sha256(raw.replace(b'\r\n',b'\n').replace(b'\n',b'\r\n')).hexdigest(),
                        'candidate_length':len(buf),'candidate_sha256':hashlib.sha256(buf).hexdigest(),
                        'crc_offset':crc_field,'crc':hex(checksum),'prefix_hex':buf[:16].hex(' '),
                        'tail_hex':buf[-16:].hex(' '),'fields':fields,'page_plan':pages})
    assert results[0]['candidate_sha256'] == results[1]['candidate_sha256']
    result = {'status':'STATIC_CANDIDATE_NOT_FOR_FLASHING','hardware_tested':False,
              'mcdt_wire_bytes_compared':False,'binary_output_written':False,'results':results}
    (OUT/'nv_candidate_20261128.json').write_bytes((json.dumps(result,ensure_ascii=False,indent=2)+'\n').encode('utf-8'))
    print(json.dumps({'status':result['status'],'length':len(buf),'crc':hex(checksum),'pages_per_copy':(len(buf)+255)//256,
                      'candidate_sha256':results[0]['candidate_sha256']},indent=2))


if __name__ == '__main__':
    main()
