# -*- coding: utf-8 -*-
"""
shark_ntn_config_nv_v1.9.xml 离线二进制编译与 PageCRC 计算脚本
复现 MCDTV5.exe 内部 0x147bf0 处的 NV 打包逻辑
版权归属: youyoutech
"""

import os
import struct
import xml.etree.ElementTree as ET

def compile_nv_xml(xml_path: str) -> bytes:
    tree = ET.parse(xml_path)
    root = tree.getroot()

    # MCDTV5 内部缓冲区: 小端序填充各个字段
    buf = bytearray()

    # 1. Magic
    magic_sec = root.find("Magic")
    if magic_sec is not None:
        magic_item = magic_sec.find("Magic")
        if magic_item is not None:
            val = int(magic_item.attrib.get("value", "0"))
            buf.extend(struct.pack("<I", val))

    # 2. Version
    # MCDTV5 将 CurrentVersion 字符串写入元数据或头
    version_sec = root.find("Version")
    current_ver = "1.6"
    if version_sec is not None:
        ver_item = version_sec.find("CurrentVersion")
        if ver_item is not None:
            current_ver = ver_item.attrib.get("value", "1.6")

    # 3. Common 字段
    common_sec = root.find("Common")
    crc_info = None

    if common_sec is not None:
        for item in common_sec:
            tag = item.tag
            t_type = item.attrib.get("type", "").upper()
            val_str = item.attrib.get("value", "0")

            if tag in ("PageCRC", "nv_CRC"):
                # 记录 CRC 所在偏移与类型，先占位
                crc_offset = len(buf)
                crc_info = (crc_offset, t_type)
                # U8 占 4 字节对齐槽或 1 字节（根据 0x148901，MCDTV5 在末尾分配 4 字节保留）
                buf.extend(b"\x00\x00\x00\x00")
                continue

            if t_type == "U8":
                val = int(val_str, 0)
                buf.extend(struct.pack("<B", val & 0xFF))
            elif t_type == "S8":
                val = int(val_str, 0)
                buf.extend(struct.pack("<b", val))
            elif t_type == "U16":
                val = int(val_str, 0)
                buf.extend(struct.pack("<H", val & 0xFFFF))
            elif t_type == "S16":
                val = int(val_str, 0)
                buf.extend(struct.pack("<h", val))
            elif t_type == "U32":
                val = int(val_str, 0)
                buf.extend(struct.pack("<I", val & 0xFFFFFFFF))
            elif t_type == "S32":
                val = int(val_str, 0)
                buf.extend(struct.pack("<i", val))
            elif t_type == "STRING":
                length = int(item.attrib.get("length", len(val_str)))
                s_bytes = val_str.encode("utf-8")
                s_bytes = s_bytes[:length].ljust(length, b"\x00")
                buf.extend(s_bytes)
            elif t_type in ("ARR_U8", "ARR_U16", "ARR_U32"):
                # 数组解析 (逗号分隔)
                parts = [p.strip() for p in val_str.split(",") if p.strip()]
                for p in parts:
                    pval = int(p, 0)
                    if t_type == "ARR_U8":
                        buf.extend(struct.pack("<B", pval & 0xFF))
                    elif t_type == "ARR_U16":
                        buf.extend(struct.pack("<H", pval & 0xFFFF))
                    elif t_type == "ARR_U32":
                        buf.extend(struct.pack("<I", pval & 0xFFFFFFFF))

    # 4. 计算 PageCRC (从偏移 4 开始逐字节 XOR，初值 0xFF，反汇编 0x148930 处逻辑)
    if crc_info is not None:
        crc_offset, crc_type = crc_info
        # 计算除 CRC 字段之外的数据校验
        chk = 0xFF
        # 0x14893e: xor dl, byte ptr [r13]
        for b in buf[4:crc_offset]:
            chk ^= b
        
        # 写入 CRC 字段 (根据反汇编 0x148970: byte ptr [r8 + rsi + 3] = dl)
        if crc_type == "U8":
            buf[crc_offset + 3] = chk
        elif crc_type == "U16":
            buf[crc_offset + 2] = chk
        elif crc_type == "U32":
            buf[crc_offset] = chk

        print(f"PageCRC 计算完成: 类型={crc_type}, 偏移=0x{crc_offset:X}, 校验值=0x{chk:02X}")

    return bytes(buf)

def main():
    xml_path = r"F:\work-2026\2026-9-9-智联安铱星NTN物联网智能终端\ms150-升级工具\升级固件\ST1000_V00_R005_CA034(1)\ST1000_V00_R005_CA034\shark_ntn_config_nv_v1.9.xml"
    if not os.path.exists(xml_path):
        print(f"文件不存在: {xml_path}")
        return

    bin_data = compile_nv_xml(xml_path)
    print(f"NV 编译成功，生成二进制大小: {len(bin_data)} 字节 (0x{len(bin_data):X})")
    print(f"前 32 字节 Hex: {bin_data[:32].hex(' ').upper()}")
    print(f"末尾 16 字节 Hex: {bin_data[-16:].hex(' ').upper()}")

if __name__ == "__main__":
    main()
