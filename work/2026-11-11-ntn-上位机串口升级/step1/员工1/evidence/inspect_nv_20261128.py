"""Bounded static MCDT NV analysis; never executes MCDT or accesses a serial port."""
from pathlib import Path
import hashlib
import json
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
EXE = ROOT/'ms150-升级工具/MCDT_5.4_Deploy_20260702_150214/MCDTV5.exe'
assert hashlib.sha256(EXE.read_bytes()).hexdigest() == '91ce79dbe330a024e317e915230cf146db6724b9eb8e56918094f9a820d4df64'
p = pefile.PE(str(EXE))
base = p.OPTIONAL_HEADER.ImageBase
md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
imports = {x.address:(lib.dll.decode()+':'+(x.name.decode() if x.name else str(x.ordinal)))
           for lib in p.DIRECTORY_ENTRY_IMPORT for x in lib.imports}
functions = [(x.struct.BeginAddress,x.struct.EndAddress) for x in p.DIRECTORY_ENTRY_EXCEPTION]
requested = [0x147bf0,0x148ac0,0x14aab0,0x147820,0x15f180,0x13ca90,
             0x14a2e0,0x149330,0x148a30,0x14ad60,0x14afc0]
index = []
for target in requested:
    matches = [(a,b) for a,b in functions if a <= target < b]
    assert matches, hex(target)
    start,end = matches[0]
    lines = [f'FUNCTION {base+start:#x} .. {base+end:#x}']
    callees = set()
    for ins in md.disasm(p.get_data(start,end-start),base+start):
        notes = []
        if ins.mnemonic == 'call' and ins.operands[0].type == X86_OP_IMM:
            callees.add(ins.operands[0].imm-base)
        for operand in ins.operands:
            if operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                addr = ins.address+ins.size+operand.mem.disp
                if addr in imports:
                    notes.append(imports[addr])
                else:
                    raw = p.get_data(addr-base,120).split(b'\0')[0]
                    if len(raw)>=2 and all(32<=b<127 for b in raw):
                        notes.append(repr(raw.decode()))
        lines.append(f'{ins.address:#x}: {ins.bytes.hex():24} {ins.mnemonic:8} {ins.op_str}'+(' ; '+' '.join(notes) if notes else ''))
    filename = f'nv_{start:x}_20261128.asm'
    (OUT/filename).write_bytes(('\n'.join(line.rstrip() for line in lines)+'\n').encode('utf-8'))
    index.append({'rva':hex(start),'end_rva':hex(end),'file':filename,'direct_callees':[hex(x) for x in sorted(callees)]})
(OUT/'nv_functions_20261128.json').write_bytes((json.dumps(index,indent=2)+'\n').encode('utf-8'))
print(json.dumps(index,indent=2))
