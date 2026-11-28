# -*- coding: utf-8 -*-
"""
MS150 (SharkNTN / ST1000) NV XML 黄金格式编译器 V2.0
=======================================================================
完成单位: youyoutech
责任员工: 员工3
基线日期: 2026-11-28
验证依据:
  1. 实测 Bus Hound 抓包: step2/nv下载.txt (512B 主备双区 0x4C4000 / 0x4C6000)
  2. MCDTV5.exe (SHA-256: 91ce79db...d4df64) VA 0x140147BF0 反汇编确认:
     - U32 字段在 Windows x64 (LLP64) 下调用 strtol(), 超出 INT32_MAX (0x7FFFFFFF)
       的值(如 Pageflag="4294967055"=0xFFFFFF0F)会被饱和截断为 0x7FFFFFFF。
     - 数据区起点为 对象+4 (含 4B Magic、4B CurrentVersion、Common 全量叶节点、
       末尾 1B PageCRC), 总有效长度 423 B (0x1A7)。
     - PageCRC 算法: 将末尾 U8 清零后, 以初值 0xFF 对前 423 B 逐字节 XOR。
     - 0x02 分页写入按 256 B/页, 末页剩余 89 B 严格零填充 (0x00), 形成 512 B。

输出比对实测结果 (CA034 shark_ntn_config_nv_v1.9.xml):
  - 423 B 有效区 SHA-256: 587fb357119d9618c2bc68175a0e79c7472ae172fa1dfa6dccd5093fa7f5d245
  - 512 B 双页区 SHA-256: bd2b65dccaf6ac773709932442a5a3e369225b09e718b95c63205143f6c7eab5
  - PageCRC (偏移 0x1A6): 0x32
  - 0x02 帧校验 (主 0x4C4000/0x4C4100, 备 0x4C6000/0x4C6100): 0xCD, 0x33, 0xED, 0x13
  - 与 nv下载.txt 线上实测字节 512/512 字节 0 差异完全一致。
"""

import argparse
import hashlib
import json
import struct
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

INT32_MAX = 0x7FFFFFFF
INT32_MIN = -0x80000000


def xor_chk(data: bytes, init: int = 0xFF) -> int:
    val = init
    for b in data:
        val ^= b
    return val


def _parse_int_mcdt_strtol(val_str: str) -> int:
    """复现 Windows MSVC x64 下 32 位有符号 long strtol(s, &end, 0) 的饱和行为。"""
    v = int(val_str.strip(), 0)
    if v > INT32_MAX:
        return INT32_MAX
    if v < INT32_MIN:
        return INT32_MIN
    return v


def compile_nv_xml(xml_path: Path, mode: str = "mcdt_compat") -> dict:
    """
    将 shark_ntn_config_nv XML 编译为 MS150 二进制映像与 256B 页序列。

    mode:
      - "mcdt_compat" (默认, 实测黄金口径): 复现 MCDTV5.exe 的 strtol 饱和截断行为
      - "strict_u32"  (仅用于对照核查): 按标准无符号 32 位编码 U32
    """
    if mode not in ("mcdt_compat", "strict_u32"):
        raise ValueError(f"Unsupported mode: {mode}")

    raw_xml = xml_path.read_bytes()
    root = ET.fromstring(raw_xml)

    buf = bytearray()
    fields = []
    warnings = []
    crc_offset = None
    crc_type = None

    fmt_map = {
        "U8": "<B",
        "S8": "<b",
        "U16": "<H",
        "S16": "<h",
        "U32": "<I",
        "S32": "<i",
    }

    for node in root.iter():
        if "value" not in node.attrib:
            continue
        ftype = node.attrib.get("type", "").upper()
        val_str = node.attrib["value"]
        off = len(buf)

        if ftype == "STRING":
            length = int(node.attrib["length"])
            encoded = val_str.encode("ascii")
            if len(encoded) > length:
                raise ValueError(f"STRING field {node.tag} length {len(encoded)} > {length}")
            encoded = encoded.ljust(length, b"\x00")
        elif ftype in fmt_map:
            raw_int = int(val_str.strip(), 0)
            if ftype == "U32" and mode == "mcdt_compat":
                clamped = _parse_int_mcdt_strtol(val_str)
                if clamped != raw_int:
                    warnings.append(
                        f"Field {node.tag} (offset 0x{off:03X}, type=U32): "
                        f"XML value {raw_int} (0x{raw_int:08X}) clamped to 0x{clamped:08X} "
                        f"to match MCDTV5.exe strtol() wire behavior"
                    )
                encoded = struct.pack("<I", clamped & 0xFFFFFFFF)
            else:
                encoded = struct.pack(fmt_map[ftype], raw_int)
        elif ftype in ("ARR_U8", "ARR_U16", "ARR_U32"):
            sub_fmt = fmt_map[ftype[4:]]
            parts = [p.strip() for p in val_str.split(",") if p.strip()]
            encoded = bytearray()
            for p in parts:
                v = _parse_int_mcdt_strtol(p) if (ftype == "ARR_U32" and mode == "mcdt_compat") else int(p, 0)
                encoded.extend(struct.pack(sub_fmt, v & 0xFFFFFFFF if ftype == "ARR_U32" else v))
            encoded = bytes(encoded)
        else:
            raise ValueError(f"Unsupported XML type {ftype!r} on tag {node.tag!r}")

        buf.extend(encoded)
        fields.append({
            "name": node.tag,
            "type": ftype,
            "offset": off,
            "size": len(encoded),
            "xml_value": val_str,
            "hex": encoded.hex(" "),
        })

        if node.tag in ("PageCRC", "nv_CRC"):
            if crc_offset is not None:
                raise ValueError("Multiple PageCRC fields found")
            crc_offset = off
            crc_type = ftype

    if crc_offset is None:
        raise ValueError("PageCRC field not found in XML")
    if crc_type != "U8" or crc_offset != len(buf) - 1:
        raise ValueError(f"Unexpected PageCRC layout: type={crc_type}, offset={crc_offset}, total={len(buf)}")
    if len(buf) > 512:
        raise ValueError(f"NV payload {len(buf)} B exceeds MCDTV5 512 B static buffer")

    # 1. 清零 PageCRC 槽并重算 XOR(初值 0xFF)
    buf[crc_offset] = 0x00
    page_crc = xor_chk(bytes(buf), 0xFF)
    buf[crc_offset] = page_crc
    assert xor_chk(bytes(buf), 0xFF) == 0x00

    # 2. 按 256 B 页零填充对齐
    valid_bytes = bytes(buf)
    page_count = (len(valid_bytes) + 255) // 256
    padded_bytes = valid_bytes.ljust(page_count * 256, b"\x00")

    pages = []
    for base_name, base_addr in (("primary", 0x004C4000), ("backup", 0x004C6000)):
        for p_idx in range(page_count):
            addr = base_addr + p_idx * 256
            page_data = padded_bytes[p_idx * 256 : (p_idx + 1) * 256]
            frame_body = b"\x02" + struct.pack(">I", addr) + page_data
            chk = xor_chk(frame_body, 0xFF)
            pages.append({
                "copy": base_name,
                "page_index": p_idx,
                "flash_addr": f"0x{addr:08X}",
                "frame_len": len(frame_body) + 1,
                "frame_chk": f"0x{chk:02X}",
                "page_sha256": hashlib.sha256(page_data).hexdigest(),
            })

    return {
        "mode": mode,
        "xml_file": xml_path.name,
        "xml_size": len(raw_xml),
        "xml_sha256": hashlib.sha256(raw_xml).hexdigest(),
        "valid_len": len(valid_bytes),
        "padded_len": len(padded_bytes),
        "page_count": page_count,
        "page_crc_offset": crc_offset,
        "page_crc": f"0x{page_crc:02X}",
        "valid_sha256": hashlib.sha256(valid_bytes).hexdigest(),
        "padded_sha256": hashlib.sha256(padded_bytes).hexdigest(),
        "warnings": warnings,
        "pages": pages,
        "valid_bytes": valid_bytes,
        "padded_bytes": padded_bytes,
    }


def main():
    default_xml = Path(__file__).resolve().parents[2] / "下载固件" / "ST1000_V00_R005_CA034" / "shark_ntn_config_nv_v1.9.xml"
    parser = argparse.ArgumentParser(description="MS150 NV XML 黄金格式编译器 V2.0 (youyoutech)")
    parser.add_argument("--xml", type=Path, default=default_xml, help="输入 NV XML 文件路径")
    parser.add_argument("--mode", choices=("mcdt_compat", "strict_u32"), default="mcdt_compat", help="U32 编码模式")
    parser.add_argument("--out-bin", type=Path, default=None, help="可选：输出 512B 零填充二进制文件")
    parser.add_argument("--verify-golden", action="store_true", help="与 CA034 nv下载.txt 实测黄金 SHA-256 强制校验")
    args = parser.parse_args()

    res = compile_nv_xml(args.xml, mode=args.mode)
    if args.out_bin is not None:
        args.out_bin.write_bytes(res["padded_bytes"])

    printable = {k: v for k, v in res.items() if k not in ("valid_bytes", "padded_bytes")}
    print(json.dumps(printable, ensure_ascii=False, indent=2))

    if args.verify_golden:
        golden_423 = "587fb357119d9618c2bc68175a0e79c7472ae172fa1dfa6dccd5093fa7f5d245"
        golden_512 = "bd2b65dccaf6ac773709932442a5a3e369225b09e718b95c63205143f6c7eab5"
        ok = (res["valid_sha256"] == golden_423) and (res["padded_sha256"] == golden_512)
        print(f"\n[GOLDEN VERIFY] 423B+512B vs step2/nv下载.txt: {'PASS (0 BYTE DIFF)' if ok else 'FAIL'}")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
