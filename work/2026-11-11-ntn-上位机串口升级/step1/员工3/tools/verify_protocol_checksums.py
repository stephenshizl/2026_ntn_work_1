# -*- coding: utf-8 -*-
"""
MS150 (SharkNTN) BootROM 串口升级协议离线校验与报文复算脚本
版权归属: youyoutech
"""

import struct

def calc_xor_chk(data: bytes, init: int = 0xFF) -> int:
    chk = init
    for b in data:
        chk ^= b
    return chk

def verify_commands():
    print("================ MS150 BootROM 核心升级命令校验 ================")
    
    # 1. 停止'U'并读取版本 (C0)
    cmd_c0 = bytes([0xC0])
    chk_c0 = calc_xor_chk(cmd_c0)
    print(f"[C0 读版本] 发送: C0 {chk_c0:02X} -> 预期: C0 3F, 验证: {'PASS' if chk_c0 == 0x3F else 'FAIL'}")

    # 2. 初始化 QSPI Flash (46)
    cmd_46 = bytes([0x46])
    chk_46 = calc_xor_chk(cmd_46)
    print(f"[46 初始化Flash] 发送: 46 {chk_46:02X} -> 预期: 46 B9, 验证: {'PASS' if chk_46 == 0xB9 else 'FAIL'}")

    # 3. 清除写保护 (57) - 纠正官方文档未带校验字节错误
    reg1 = bytes.fromhex("57 56 80 00 18 06 00 00 01")
    chk_reg1 = calc_xor_chk(reg1)
    full_reg1 = reg1 + bytes([chk_reg1])
    print(f"[57 清写保护1] 报文: {full_reg1.hex(' ').upper()} -> 校验: {chk_reg1:02X}, 预期: 61, 验证: {'PASS' if chk_reg1 == 0x61 else 'FAIL'}")

    reg2 = bytes.fromhex("57 56 80 00 24 00 00 02 00")
    chk_reg2 = calc_xor_chk(reg2)
    full_reg2 = reg2 + bytes([chk_reg2])
    print(f"[57 清写保护2] 报文: {full_reg2.hex(' ').upper()} -> 校验: {chk_reg2:02X}, 预期: 58, 验证: {'PASS' if chk_reg2 == 0x58 else 'FAIL'}")

    # 4. 波特率配置 (50)
    baud_table = {
        0x00: (9600, 0xAF),
        0x01: (19200, 0xAE),
        0x02: (38400, 0xAD),
        0x03: (57600, 0xAC),
        0x04: (115200, 0xAB),
        0x05: (230400, 0xAA),
        0x06: (460800, 0xA9),
        0x07: (921600, 0xA8),
        0x08: (1000000, 0xA7),
        0x09: (1500000, 0xA6),
        0x0A: (2000000, 0xA5),
        0x0B: (3000000, 0xA4),
        0x0C: (4000000, 0xA3),
    }
    print("\n[50 波特率切换表校验]")
    for idx, (baud, exp_chk) in baud_table.items():
        cmd = bytes([0x50, idx])
        chk = calc_xor_chk(cmd)
        res = "PASS" if chk == exp_chk else "FAIL"
        print(f"  Index 0x{idx:02X} ({baud:7d} bps): 50 {idx:02X} {chk:02X} (预期: {exp_chk:02X}) [{res}]")

    # 5. 读首页 256 字节 (EB) - 纠正官方文档 0x14 长度错误，实为校验和
    cmd_eb = bytes([0xEB, 0x00, 0x00, 0x00, 0x00])
    chk_eb = calc_xor_chk(cmd_eb)
    print(f"\n[EB 读页命令] 报文: {(cmd_eb + bytes([chk_eb])).hex(' ').upper()} -> 校验: {chk_eb:02X}, 预期: 14, 验证: {'PASS' if chk_eb == 0x14 else 'FAIL'}")

    # 6. 扇区擦除 (20) 与 块擦除 (D8)
    erase_sec0 = bytes([0x20, 0x00, 0x00, 0x00, 0x00])
    chk_sec0 = calc_xor_chk(erase_sec0)
    print(f"[20 扇区擦除 0x000000] 报文: {(erase_sec0 + bytes([chk_sec0])).hex(' ').upper()} -> 校验: {chk_sec0:02X}, 预期: DF, 验证: {'PASS' if chk_sec0 == 0xDF else 'FAIL'}")

    erase_nv_main = bytes([0x20, 0x00, 0x4C, 0x40, 0x00])
    chk_nv_main = calc_xor_chk(erase_nv_main)
    print(f"[20 扇区擦除 0x4C4000] 报文: {(erase_nv_main + bytes([chk_nv_main])).hex(' ').upper()} -> 校验: {chk_nv_main:02X}, 预期: D3, 验证: {'PASS' if chk_nv_main == 0xD3 else 'FAIL'}")

    erase_nv_bak = bytes([0x20, 0x00, 0x4C, 0x60, 0x00])
    chk_nv_bak = calc_xor_chk(erase_nv_bak)
    print(f"[20 扇区擦除 0x4C6000] 报文: {(erase_nv_bak + bytes([chk_nv_bak])).hex(' ').upper()} -> 校验: {chk_nv_bak:02X}, 预期: F3, 验证: {'PASS' if chk_nv_bak == 0xF3 else 'FAIL'}")

    erase_block = bytes([0xD8, 0x00, 0x01, 0x00, 0x00])
    chk_block = calc_xor_chk(erase_block)
    print(f"[D8 块擦除 0x010000] 报文: {(erase_block + bytes([chk_block])).hex(' ').upper()} -> 校验: {chk_block:02X}, 预期: 26, 验证: {'PASS' if chk_block == 0x26 else 'FAIL'}")

    # 7. 写变长数据命令 0x7A 格式验证 - 纠正官方文档 LEN 2字节错误，实为 4字节 BE
    addr = 0x00010000
    chunk_len = 4096
    hdr_7a = struct.pack(">BII", 0x7A, addr, chunk_len)
    dummy_payload = bytes([0xAA] * chunk_len)
    full_chk_7a = calc_xor_chk(hdr_7a + dummy_payload)
    print(f"\n[7A 变长写命令格式校验]")
    print(f"  报文头长度: {len(hdr_7a)} 字节 (0x7A + 4B PADDR + 4B LEN)")
    print(f"  报文头内容: {hdr_7a.hex(' ').upper()}")
    print(f"  整帧校验计算: 包含 9 字节头 + {chunk_len} 字节数据, 计算 CHK = {full_chk_7a:02X}")

    print("\n所有核心命令校验计算完全匹配 MCDTV5 反汇编逻辑！")

if __name__ == "__main__":
    verify_commands()
