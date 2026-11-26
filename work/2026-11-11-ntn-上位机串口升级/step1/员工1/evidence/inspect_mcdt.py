from pathlib import Path
import json, re, hashlib, bisect
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86 import X86_OP_MEM, X86_REG_RIP

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
EXE = ROOT / 'ms150-升级工具/MCDT_5.4_Deploy_20260702_150214/MCDTV5.exe'
p = pefile.PE(str(EXE))
base = p.OPTIONAL_HEADER.ImageBase
md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
funcs = [(x.struct.BeginAddress, x.struct.EndAddress) for x in p.DIRECTORY_ENTRY_EXCEPTION]
starts = [x[0] for x in funcs]
targets = {}
for off, label in [(0x348fc8,'unprotect1'),(0x348fe0,'unprotect2'),(0x34b118,'Download.cpp'),(0x34b6e0,'Download5G_newflash.cpp'),(0x339b20,'PageCRC')]:
    targets[base + p.get_rva_from_offset(off)] = label
hits = []
for sec in p.sections:
    if not sec.Characteristics & 0x20000000:
        continue
    # skipdata handles embedded padding/data without aborting at invalid bytes.
    md.skipdata = True
    for ins in md.disasm(sec.get_data(), base + sec.VirtualAddress):
        if ins.id == 0:
            continue
        for op in ins.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                target = ins.address + ins.size + op.mem.disp
                if target in targets:
                    rva = ins.address - base
                    idx = bisect.bisect_right(starts, rva) - 1
                    bounds = funcs[idx] if idx >= 0 and rva < funcs[idx][1] else (rva,rva+100)
                    hits.append({'string':targets[target],'instruction':hex(ins.address),'function':[hex(base+x) for x in bounds]})
(OUT/'mcdt_xrefs.json').write_text(json.dumps({'sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'image_base':hex(base),'hits':hits},indent=2),encoding='utf-8')
selected = sorted(set(tuple(int(v,16)-base for v in h['function']) for h in hits))
lines = []
for start,end in selected:
    lines.append(f'\nFUNCTION {base+start:#x} .. {base+end:#x}')
    for ins in md.disasm(p.get_data(start,end-start),base+start):
        lines.append(f'{ins.address:#x}: {ins.mnemonic:10} {ins.op_str}')
(OUT/'mcdt_disassembly.txt').write_text('\n'.join(lines),encoding='utf-8')
# Capture the bounded routines used in this review, without running the EXE.
groups = {
    'mcdt_flash_functions.txt': [0x1457c0,0x15d590,0x15f970,0x166d40,0x166f00,0x16c860,0x16e3f0],
    'mcdt_io_helpers.txt': [0x13d6d0,0x13d990],
    'mcdt_receive.txt': [0x13da70],
}
for filename, addresses in groups.items():
    lines = []
    for start,end in funcs:
        if start not in addresses:
            continue
        lines.append(f'\nFUNCTION {base+start:#x} .. {base+end:#x}')
        for ins in md.disasm(p.get_data(start,end-start),base+start):
            lines.append(f'{ins.address:#x}: {ins.mnemonic:10} {ins.op_str}')
    (OUT/filename).write_text('\n'.join(lines),encoding='utf-8')
lines = []
for start,end in [(0x136850,0x136880),(0x136b20,0x136b45),(0x13ce00,0x13ce70),(0x13da50,0x13da70)]:
    lines.append(f'\nFUNCTION {base+start:#x}')
    for ins in md.disasm(p.get_data(start,end-start),base+start):
        lines.append(f'{ins.address:#x}: {ins.mnemonic:10} {ins.op_str}')
        if ins.mnemonic == 'ret':
            break
for mode in [6,7,8,9,100]:
    index = p.get_data(0x13df64+mode-6,1)[0]
    target = int.from_bytes(p.get_data(0x13df3c+index*4,4),'little')
    lines.append(f'receive mode {mode}: switch target {base+target:#x}')
(OUT/'mcdt_endian_crc.txt').write_text('\n'.join(lines),encoding='utf-8')
print(json.dumps(hits,indent=2))
