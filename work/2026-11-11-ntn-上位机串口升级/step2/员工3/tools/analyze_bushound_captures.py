# -*- coding: utf-8 -*-
"""
MS150 (SharkNTN / ST1000) Step 2 Bus Hound 实测抓包全量解析与一致性审计脚本
============================================================================
完成单位: youyoutech
责任员工: 员工3
基线日期: 2026-11-28

功能:
  1. 解析 step2 目录下的全部 4 份 Bus Hound 6.00 抓包文本:
     - e31下载.txt
     - dsp下载.txt
     - nv下载.txt
     - 二级boot下载.txt
  2. 逐帧校验所有命令的 XOR(初值 0xFF) 校验和与模组应答字节。
  3. 重组 Flash 写入镜像并与 step2/下载固件/ST1000_V00_R005_CA034/ 下的目标文件
     进行 100% 字节级与 SHA-256 比对 (包含 NV XML 通过 compile_nv_xml_v2 的黄金比对)。
  4. 解析每次 0xEB 读表与 0x32 写表前后的 256B T_Header_5gNew, 输出完整演变链。
  5. 写出结构化证据文件 audit_result_20261128.json。
"""

import datetime
import hashlib
import json
import re
import struct
import sys
from pathlib import Path

from compile_nv_xml_v2 import compile_nv_xml, xor_chk

STEP2_DIR = Path(__file__).resolve().parents[2]
FW_DIR = STEP2_DIR / "下载固件" / "ST1000_V00_R005_CA034"
OUT_JSON = Path(__file__).resolve().parent / "audit_result_20261128.json"

HEX_PAIR_RE = re.compile(r"^[0-9a-fA-F]{2}$")
CMD_POS_RE = re.compile(r"(\d+)\.(\d+)\.(\d+)(?:\((\d+)\))?")

TARGETS = [
    ("e31", STEP2_DIR / "e31下载.txt", FW_DIR / "E31" / "SHARK-NTN_E31_CHIP_ST1000_V00-R005-CA034_20261104111216" / "SHARK-NTN_E31_CHIP_ST1000_V00-R005-CA034_20261104111216.bin"),
    ("dsp", STEP2_DIR / "dsp下载.txt", FW_DIR / "DSP" / "SHARK-NTN_DSP_CHIP_ST1000_V00-R005-CA034_20261104111608.bin"),
    ("nv", STEP2_DIR / "nv下载.txt", FW_DIR / "shark_ntn_config_nv_v1.9.xml"),
    ("sec_boot", STEP2_DIR / "二级boot下载.txt", FW_DIR / "shark_ntn_second_boot_v1.3.bin"),
]


def sha256_bytes(b: bytes) -> str:
    return hashlib.sha256(b).hexdigest()


def parse_bushound(path: Path) -> dict:
    raw_bytes = path.read_bytes()
    raw_lines = raw_bytes.splitlines()
    sep_idx = None
    data_start = data_end = pos_start = 0

    for i, raw in enumerate(raw_lines[:40]):
        line = raw.decode("latin1")
        if line.startswith("------"):
            sep_idx = i
            spans = [m.span() for m in re.finditer(r"-+", line)]
            data_start, data_end = spans[2]
            pos_start = spans[4][0]
            break

    if sep_idx is None:
        raise RuntimeError(f"Bus Hound table separator not found in {path}")

    events = []
    cur = None
    rep_events = []
    warnings = []

    for idx in range(sep_idx + 1, len(raw_lines)):
        line = raw_lines[idx].decode("latin1")
        if not line.strip():
            continue
        dev_str = line[:6].strip()
        phase_str = line[6:15].strip()
        data_field = line[data_start:data_end]
        pos_field = line[pos_start:].strip() if len(line) > pos_start else ""

        row_bytes = bytearray()
        for tok in data_field.strip().split():
            if len(tok) == 2 and HEX_PAIR_RE.match(tok):
                row_bytes.append(int(tok, 16))
            else:
                warnings.append({"line": idx + 1, "token": tok})

        m = CMD_POS_RE.search(pos_field)
        cmd_id = int(m.group(1)) if m else -1
        rep = int(m.group(4)) if (m and m.group(4)) else 1

        if dev_str:
            if cur is not None:
                events.append(cur)
            cur = {
                "dev": dev_str,
                "phase": phase_str,
                "cmd_id": cmd_id,
                "rep": rep,
                "data": bytearray(row_bytes),
                "line_start": idx + 1,
                "line_end": idx + 1,
            }
            if rep > 1:
                rep_events.append({"cmd_id": cmd_id, "phase": phase_str, "rep": rep, "line": idx + 1, "hex": bytes(row_bytes).hex(" ")})
        else:
            if cur is not None:
                cur["data"].extend(row_bytes)
                cur["line_end"] = idx + 1

    if cur is not None:
        events.append(cur)

    return {
        "file": path.name,
        "size": len(raw_bytes),
        "sha256": sha256_bytes(raw_bytes),
        "lines": len(raw_lines),
        "events": events,
        "rep_events": rep_events,
        "warnings": warnings,
    }


def decode_session(events: list) -> dict:
    turns = []
    for ev in events:
        if turns and turns[-1]["phase"] == ev["phase"] and turns[-1]["dev"] == ev["dev"]:
            turns[-1]["chunks"].append(len(ev["data"]))
            turns[-1]["data"].extend(ev["data"])
        else:
            turns.append({
                "dev": ev["dev"],
                "phase": ev["phase"],
                "data": bytearray(ev["data"]),
                "chunks": [len(ev["data"])],
            })

    cmd_counts = {}
    chk_errors = 0
    rx_errors = 0
    erases_4k = []
    erases_64k = []
    flash_writes = {}
    reg_writes = []
    baud_changes = []
    eb_read_0 = None
    wr32_0 = None
    c0_rx = None
    unsol_in = None
    w79_blocks = 0
    w7a_blocks = []

    i = 0
    while i < len(turns):
        t = turns[i]
        d = bytes(t["data"])
        if t["phase"] == "IN":
            unsol_in = {
                "len": len(d),
                "chunks": len(t["chunks"]),
                "head_hex": d[:16].hex(" "),
                "banner_present": d.startswith(b"\nVER:B5.0\n"),
                "u_count_after_banner": d[10:].count(0x55) if d.startswith(b"\nVER:B5.0\n") else d.count(0x55),
            }
            i += 1
            continue

        rbytes = b""
        if i + 1 < len(turns) and turns[i + 1]["phase"] == "IN":
            rbytes = bytes(turns[i + 1]["data"])
            i += 2
        else:
            i += 1

        op = d[0]
        if len(d) >= 2 and xor_chk(d[:-1], 0xFF) != d[-1]:
            chk_errors += 1

        if op == 0xC0 and len(d) == 2:
            cname = "C0_STOP_U"
            c0_rx = rbytes.hex(" ")
        elif op == 0x46 and len(d) == 2:
            cname = "46_QSPI_INIT"
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0x57 and len(d) == 10:
            cname = "57_REG_WRITE"
            reg_writes.append({
                "tx_hex": d.hex(" "),
                "rx_len": len(rbytes),
                "rx_hex": rbytes.hex(" "),
                "rx_ascii_23": rbytes[:23].decode("latin1"),
                "rx_trailer": f"0x{rbytes[-1]:02X}" if rbytes else None,
            })
        elif op == 0x55 and len(d) == 2:
            cname = "55_CLK_CFG"
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0x50 and len(d) == 3:
            cname = "50_SET_BAUD"
            baud_changes.append({"tx_hex": d.hex(" "), "baud_idx": f"0x{d[1]:02X}", "rx_hex": rbytes.hex(" ")})
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0x20 and len(d) == 6:
            cname = "20_ERASE_4K"
            erases_4k.append(struct.unpack(">I", d[1:5])[0])
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0xD8 and len(d) == 6:
            cname = "D8_ERASE_64K"
            erases_64k.append(struct.unpack(">I", d[1:5])[0])
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0x79 and len(d) == 65542:
            cname = "79_WRITE_64K"
            addr = struct.unpack(">I", d[1:5])[0]
            flash_writes[addr] = d[5:-1]
            w79_blocks += 1
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0x7A and len(d) >= 10:
            cname = "7A_WRITE_VAR"
            addr = struct.unpack(">I", d[1:5])[0]
            plen = struct.unpack(">I", d[5:9])[0]
            payload = d[9:-1]
            flash_writes[addr] = payload
            w7a_blocks.append({
                "addr": f"0x{addr:08X}",
                "hdr_len_be32": plen,
                "payload_len": len(payload),
                "first_chunk_size": t["chunks"][0],
                "rx_hex": rbytes.hex(" "),
            })
            if plen != len(payload) or rbytes != b"\x06":
                rx_errors += 1
        elif op == 0x02 and len(d) == 262:
            cname = "02_PAGE_WRITE"
            addr = struct.unpack(">I", d[1:5])[0]
            flash_writes[addr] = d[5:-1]
            if rbytes != b"\x06":
                rx_errors += 1
        elif op == 0xEB and len(d) == 6:
            cname = "EB_READ_PAGE"
            addr = struct.unpack(">I", d[1:5])[0]
            if addr == 0:
                eb_read_0 = rbytes
            if len(rbytes) != 256:
                rx_errors += 1
        elif op == 0x32 and len(d) == 262:
            cname = "32_WRITE_TABLE"
            addr = struct.unpack(">I", d[1:5])[0]
            if addr == 0:
                wr32_0 = d[5:-1]
            if rbytes != b"\x06":
                rx_errors += 1
        else:
            cname = f"OTHER_0x{op:02X}"

        cmd_counts[cname] = cmd_counts.get(cname, 0) + 1

    # Merge erased ranges
    ranges = sorted([(a, a + 0x1000) for a in erases_4k] + [(a, a + 0x10000) for a in erases_64k])
    merged = []
    for s, e in ranges:
        if merged and merged[-1][1] == s:
            merged[-1] = (merged[-1][0], e)
        else:
            merged.append((s, e))

    # Partition table diff
    pt_audit = {}
    if eb_read_0 and wr32_0 and len(eb_read_0) == 256 and len(wr32_0) == 256:
        diffs = []
        for off in range(0, 256, 4):
            ov = struct.unpack("<I", eb_read_0[off:off + 4])[0]
            nv = struct.unpack("<I", wr32_0[off:off + 4])[0]
            if ov != nv:
                diffs.append({"offset": f"0x{off:02X}", "before": f"0x{ov:08X}", "after": f"0x{nv:08X}"})
        stamp_before = struct.unpack("<I", eb_read_0[0xE8:0xEC])[0]
        stamp_after = struct.unpack("<I", wr32_0[0xE8:0xEC])[0]
        cst = datetime.timezone(datetime.timedelta(hours=8))
        pt_audit = {
            "eb_read_sha256": sha256_bytes(eb_read_0),
            "wr32_sha256": sha256_bytes(wr32_0),
            "diffs": diffs,
            "stamp_before_hex": f"0x{stamp_before:08X}",
            "stamp_before_cst": datetime.datetime.fromtimestamp(stamp_before, cst).strftime("%Y-%m-%d %H:%M:%S +08:00"),
            "stamp_after_hex": f"0x{stamp_after:08X}",
            "stamp_after_cst": datetime.datetime.fromtimestamp(stamp_after, cst).strftime("%Y-%m-%d %H:%M:%S +08:00"),
            "firmware_mv_length_after": f"0x{struct.unpack('<I', wr32_0[0x78:0x7C])[0]:08X}",
            "dsp0_mv_length_after": f"0x{struct.unpack('<I', wr32_0[0x84:0x88])[0]:08X}",
            "sec_mv_length_after": f"0x{struct.unpack('<I', wr32_0[0x10:0x14])[0]:08X}",
        }

    return {
        "unsol_in": unsol_in,
        "c0_rx_hex": c0_rx,
        "cmd_counts": cmd_counts,
        "chk_errors": chk_errors,
        "rx_errors": rx_errors,
        "reg_writes_count": len(reg_writes),
        "reg_writes_sample": reg_writes[:2],
        "baud_changes": baud_changes,
        "erased_ranges": [{"start": f"0x{s:08X}", "end": f"0x{e:08X}", "size": e - s} for s, e in merged],
        "write_79_count": w79_blocks,
        "write_7a_blocks": w7a_blocks,
        "flash_writes": flash_writes,
        "partition_table": pt_audit,
    }


def main():
    report = {
        "audit_date": "2026-11-28",
        "author": "员工3 (youyoutech)",
        "captures": {},
        "chain_continuity_verified": False,
        "all_passed": False,
    }

    all_ok = True
    prev_wr_sha = None
    chain_ok = True

    for key, cap_path, fw_path in TARGETS:
        parsed = parse_bushound(cap_path)
        sess = decode_session(parsed["events"])

        fw_bytes = fw_path.read_bytes()
        fw_sha = sha256_bytes(fw_bytes)

        if key != "nv":
            addrs = sorted(sess["flash_writes"].keys())
            assembled = bytearray()
            cur = addrs[0]
            contiguous = True
            for a in addrs:
                if a != cur:
                    contiguous = False
                chunk = sess["flash_writes"][a]
                assembled.extend(chunk)
                cur = a + len(chunk)
            assembled = bytes(assembled)
            payload_verify = {
                "start_addr": f"0x{addrs[0]:08X}",
                "end_addr": f"0x{cur:08X}",
                "wire_len": len(assembled),
                "target_len": len(fw_bytes),
                "contiguous": contiguous,
                "exact_byte_match": (assembled == fw_bytes),
                "wire_sha256": sha256_bytes(assembled),
                "target_sha256": fw_sha,
            }
            if not (contiguous and assembled == fw_bytes):
                all_ok = False
        else:
            nv_compiled = compile_nv_xml(fw_path, mode="mcdt_compat")
            nv_main = sess["flash_writes"][0x004C4000] + sess["flash_writes"][0x004C4100]
            nv_bak = sess["flash_writes"][0x004C6000] + sess["flash_writes"][0x004C6100]
            exact_match = (nv_main == nv_bak == nv_compiled["padded_bytes"])
            payload_verify = {
                "primary_addrs": ["0x004C4000", "0x004C4100"],
                "backup_addrs": ["0x004C6000", "0x004C6100"],
                "primary_equals_backup": (nv_main == nv_bak),
                "wire_512_sha256": sha256_bytes(nv_main),
                "wire_423_sha256": sha256_bytes(nv_main[:423]),
                "compiled_512_sha256": nv_compiled["padded_sha256"],
                "compiled_423_sha256": nv_compiled["valid_sha256"],
                "page_crc_wire": f"0x{nv_main[422]:02X}",
                "pageflag_wire_le32": f"0x{struct.unpack('<I', nv_main[8:12])[0]:08X}",
                "tail_89_all_zero": all(b == 0 for b in nv_main[423:]),
                "exact_512_match_with_v2_compiler": exact_match,
                "xml_sha256": fw_sha,
            }
            if not exact_match:
                all_ok = False

        if sess["chk_errors"] != 0 or sess["rx_errors"] != 0 or parsed["warnings"]:
            all_ok = False

        pt = sess["partition_table"]
        if prev_wr_sha is not None and pt.get("eb_read_sha256") != prev_wr_sha:
            chain_ok = False
        prev_wr_sha = pt.get("wr32_sha256")

        entry = {
            "capture_file": parsed["file"],
            "capture_size": parsed["size"],
            "capture_sha256": parsed["sha256"],
            "capture_lines": parsed["lines"],
            "capture_events": len(parsed["events"]),
            "rep_events": parsed["rep_events"],
            "target_file": fw_path.name,
            "unsol_in": sess["unsol_in"],
            "c0_rx_hex": sess["c0_rx_hex"],
            "cmd_counts": sess["cmd_counts"],
            "chk_errors": sess["chk_errors"],
            "rx_errors": sess["rx_errors"],
            "reg_writes_count": sess["reg_writes_count"],
            "reg_writes_sample": sess["reg_writes_sample"],
            "baud_changes": sess["baud_changes"],
            "erased_ranges": sess["erased_ranges"],
            "write_79_count": sess["write_79_count"],
            "write_7a_blocks": sess["write_7a_blocks"],
            "payload_verify": payload_verify,
            "partition_table": pt,
        }
        report["captures"][key] = entry

    report["chain_continuity_verified"] = chain_ok
    report["all_passed"] = all_ok and chain_ok

    OUT_JSON.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote audit report: {OUT_JSON}")
    print(f"Chain continuity (e31 -> dsp -> nv -> sec_boot): {chain_ok}")
    print(f"Overall audit PASS: {report['all_passed']}")
    sys.exit(0 if report["all_passed"] else 1)


if __name__ == "__main__":
    main()
