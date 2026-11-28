FUNCTION 0x140147bf0 .. 0x140148a2e
0x140147bf0: 48895c2410               mov      qword ptr [rsp + 0x10], rbx
0x140147bf5: 4889742418               mov      qword ptr [rsp + 0x18], rsi
0x140147bfa: 48897c2420               mov      qword ptr [rsp + 0x20], rdi
0x140147bff: 55                       push     rbp
0x140147c00: 4154                     push     r12
0x140147c02: 4155                     push     r13
0x140147c04: 4156                     push     r14
0x140147c06: 4157                     push     r15
0x140147c08: 488d6c24c0               lea      rbp, [rsp - 0x40]
0x140147c0d: 4881ec40010000           sub      rsp, 0x140
0x140147c14: 488b05cdda3900           mov      rax, qword ptr [rip + 0x39dacd]
0x140147c1b: 4833c4                   xor      rax, rsp
0x140147c1e: 48894530                 mov      qword ptr [rbp + 0x30], rax
0x140147c22: 488bf1                   mov      rsi, rcx
0x140147c25: 4533e4                   xor      r12d, r12d
0x140147c28: 4489a110020000           mov      dword ptr [rcx + 0x210], r12d
0x140147c2f: 4c8d6904                 lea      r13, [rcx + 4]
0x140147c33: 33d2                     xor      edx, edx
0x140147c35: 41b800020000             mov      r8d, 0x200
0x140147c3b: 498bcd                   mov      rcx, r13
0x140147c3e: e8cf301b00               call     0x1402fad12
0x140147c43: 488b9e38020000           mov      rbx, qword ptr [rsi + 0x238]
0x140147c4a: 483b9e40020000           cmp      rbx, qword ptr [rsi + 0x240]
0x140147c51: 0f84440c0000             je       0x14014889b
0x140147c57: 4c8d351e372000           lea      r14, [rip + 0x20371e] ; 'ARR_U8'
0x140147c5e: 488d3d2b372000           lea      rdi, [rip + 0x20372b] ; 'ARR_U32'
0x140147c65: 4c8d3d1c372000           lea      r15, [rip + 0x20371c] ; 'ARR_U16'
0x140147c6c: 488bd3                   mov      rdx, rbx
0x140147c6f: 488d4d80                 lea      rcx, [rbp - 0x80]
0x140147c73: e888b3ecff               call     0x140013000
0x140147c78: 90                       nop
0x140147c79: 488d5320                 lea      rdx, [rbx + 0x20]
0x140147c7d: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147c81: e87ab3ecff               call     0x140013000
0x140147c86: 90                       nop
0x140147c87: 488d5340                 lea      rdx, [rbx + 0x40]
0x140147c8b: 488d4dc0                 lea      rcx, [rbp - 0x40]
0x140147c8f: e86cb3ecff               call     0x140013000
0x140147c94: 90                       nop
0x140147c95: 488d5360                 lea      rdx, [rbx + 0x60]
0x140147c99: 488d4de0                 lea      rcx, [rbp - 0x20]
0x140147c9d: e85eb3ecff               call     0x140013000
0x140147ca2: 90                       nop
0x140147ca3: 488d9380000000           lea      rdx, [rbx + 0x80]
0x140147caa: 488d4d00                 lea      rcx, [rbp]
0x140147cae: e84db3ecff               call     0x140013000
0x140147cb3: 448b83a0000000           mov      r8d, dword ptr [rbx + 0xa0]
0x140147cba: 44894520                 mov      dword ptr [rbp + 0x20], r8d
0x140147cbe: 488d45c0                 lea      rax, [rbp - 0x40]
0x140147cc2: 4c8b4dc0                 mov      r9, qword ptr [rbp - 0x40]
0x140147cc6: 4c8b55d8                 mov      r10, qword ptr [rbp - 0x28]
0x140147cca: 4983fa10                 cmp      r10, 0x10
0x140147cce: 490f43c1                 cmovae   rax, r9
0x140147cd2: 803855                   cmp      byte ptr [rax], 0x55
0x140147cd5: 7565                     jne      0x140147d3c
0x140147cd7: 80780138                 cmp      byte ptr [rax + 1], 0x38
0x140147cdb: 755f                     jne      0x140147d3c
0x140147cdd: 80780200                 cmp      byte ptr [rax + 2], 0
0x140147ce1: 7559                     jne      0x140147d3c
0x140147ce3: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147ce7: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147cec: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147cf1: 4533c0                   xor      r8d, r8d
0x140147cf4: 488d542420               lea      rdx, [rsp + 0x20]
0x140147cf9: ff15c9551d00             call     qword ptr [rip + 0x1d55c9] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147cff: 3dff000000               cmp      eax, 0xff
0x140147d04: 0f8f690b0000             jg       0x140148873
0x140147d0a: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147d0e: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147d13: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147d18: 4533c0                   xor      r8d, r8d
0x140147d1b: 488d542420               lea      rdx, [rsp + 0x20]
0x140147d20: ff15a2551d00             call     qword ptr [rip + 0x1d55a2] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147d26: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147d2d: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x140147d31: ff8610020000             inc      dword ptr [rsi + 0x210]
0x140147d37: e9af090000               jmp      0x1401486eb
0x140147d3c: 488d45c0                 lea      rax, [rbp - 0x40]
0x140147d40: 4983fa10                 cmp      r10, 0x10
0x140147d44: 490f43c1                 cmovae   rax, r9
0x140147d48: 803853                   cmp      byte ptr [rax], 0x53
0x140147d4b: 7565                     jne      0x140147db2
0x140147d4d: 80780138                 cmp      byte ptr [rax + 1], 0x38
0x140147d51: 755f                     jne      0x140147db2
0x140147d53: 80780200                 cmp      byte ptr [rax + 2], 0
0x140147d57: 7559                     jne      0x140147db2
0x140147d59: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147d5d: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147d62: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147d67: 4533c0                   xor      r8d, r8d
0x140147d6a: 488d542420               lea      rdx, [rsp + 0x20]
0x140147d6f: ff1553551d00             call     qword ptr [rip + 0x1d5553] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147d75: 3dff000000               cmp      eax, 0xff
0x140147d7a: 0f8ff30a0000             jg       0x140148873
0x140147d80: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147d84: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147d89: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147d8e: 4533c0                   xor      r8d, r8d
0x140147d91: 488d542420               lea      rdx, [rsp + 0x20]
0x140147d96: ff152c551d00             call     qword ptr [rip + 0x1d552c] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147d9c: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147da3: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x140147da7: ff8610020000             inc      dword ptr [rsi + 0x210]
0x140147dad: e939090000               jmp      0x1401486eb
0x140147db2: 488d55c0                 lea      rdx, [rbp - 0x40]
0x140147db6: 4983fa10                 cmp      r10, 0x10
0x140147dba: 490f43d1                 cmovae   rdx, r9
0x140147dbe: 498bcc                   mov      rcx, r12
0x140147dc1: 4c8d1da0352000           lea      r11, [rip + 0x2035a0] ; 'U16'
0x140147dc8: 0f1f840000000000         nop      dword ptr [rax + rax]
0x140147dd0: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x140147dd4: 48ffc1                   inc      rcx
0x140147dd7: 413a440bff               cmp      al, byte ptr [r11 + rcx - 1]
0x140147ddc: 755a                     jne      0x140147e38
0x140147dde: 4883f904                 cmp      rcx, 4
0x140147de2: 75ec                     jne      0x140147dd0
0x140147de4: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147de8: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147ded: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147df2: 4533c0                   xor      r8d, r8d
0x140147df5: 488d542420               lea      rdx, [rsp + 0x20]
0x140147dfa: ff15c8541d00             call     qword ptr [rip + 0x1d54c8] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147e00: 3dffff0000               cmp      eax, 0xffff
0x140147e05: 0f8f680a0000             jg       0x140148873
0x140147e0b: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147e0f: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147e14: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147e19: 4533c0                   xor      r8d, r8d
0x140147e1c: 488d542420               lea      rdx, [rsp + 0x20]
0x140147e21: ff15a1541d00             call     qword ptr [rip + 0x1d54a1] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147e27: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147e2e: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x140147e32: 66c1e808                 shr      ax, 8
0x140147e36: eb7e                     jmp      0x140147eb6
0x140147e38: 488d55c0                 lea      rdx, [rbp - 0x40]
0x140147e3c: 4983fa10                 cmp      r10, 0x10
0x140147e40: 490f43d1                 cmovae   rdx, r9
0x140147e44: 498bcc                   mov      rcx, r12
0x140147e47: 4c8d1d1e352000           lea      r11, [rip + 0x20351e] ; 'S16'
0x140147e4e: 6690                     nop
0x140147e50: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x140147e54: 48ffc1                   inc      rcx
0x140147e57: 413a440bff               cmp      al, byte ptr [r11 + rcx - 1]
0x140147e5c: 756f                     jne      0x140147ecd
0x140147e5e: 4883f904                 cmp      rcx, 4
0x140147e62: 75ec                     jne      0x140147e50
0x140147e64: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147e68: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147e6d: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147e72: 4533c0                   xor      r8d, r8d
0x140147e75: 488d542420               lea      rdx, [rsp + 0x20]
0x140147e7a: ff1548541d00             call     qword ptr [rip + 0x1d5448] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147e80: 3dffff0000               cmp      eax, 0xffff
0x140147e85: 0f8fe8090000             jg       0x140148873
0x140147e8b: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147e8f: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147e94: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147e99: 4533c0                   xor      r8d, r8d
0x140147e9c: 488d542420               lea      rdx, [rsp + 0x20]
0x140147ea1: ff1521541d00             call     qword ptr [rip + 0x1d5421] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147ea7: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147eae: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x140147eb2: 66c1f808                 sar      ax, 8
0x140147eb6: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147ebd: 88443105                 mov      byte ptr [rcx + rsi + 5], al
0x140147ec1: 83861002000002           add      dword ptr [rsi + 0x210], 2
0x140147ec8: e91e080000               jmp      0x1401486eb
0x140147ecd: 488d55c0                 lea      rdx, [rbp - 0x40]
0x140147ed1: 4983fa10                 cmp      r10, 0x10
0x140147ed5: 490f43d1                 cmovae   rdx, r9
0x140147ed9: 498bcc                   mov      rcx, r12
0x140147edc: 4c8d1d9d2b1f00           lea      r11, [rip + 0x1f2b9d] ; 'U32'
0x140147ee3: 0f1f4000                 nop      dword ptr [rax]
0x140147ee7: 660f1f840000000000       nop      word ptr [rax + rax]
0x140147ef0: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x140147ef4: 48ffc1                   inc      rcx
0x140147ef7: 413a440bff               cmp      al, byte ptr [r11 + rcx - 1]
0x140147efc: 7563                     jne      0x140147f61
0x140147efe: 4883f904                 cmp      rcx, 4
0x140147f02: 75ec                     jne      0x140147ef0
0x140147f04: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147f08: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147f0d: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147f12: 4533c0                   xor      r8d, r8d
0x140147f15: 488d542420               lea      rdx, [rsp + 0x20]
0x140147f1a: ff15a8531d00             call     qword ptr [rip + 0x1d53a8] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147f20: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147f24: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147f29: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147f2e: 4533c0                   xor      r8d, r8d
0x140147f31: 488d542420               lea      rdx, [rsp + 0x20]
0x140147f36: ff158c531d00             call     qword ptr [rip + 0x1d538c] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147f3c: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147f43: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x140147f47: 8bd0                     mov      edx, eax
0x140147f49: c1ea08                   shr      edx, 8
0x140147f4c: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147f53: 88543105                 mov      byte ptr [rcx + rsi + 5], dl
0x140147f57: 8bd0                     mov      edx, eax
0x140147f59: c1ea10                   shr      edx, 0x10
0x140147f5c: e98f000000               jmp      0x140147ff0
0x140147f61: 488d55c0                 lea      rdx, [rbp - 0x40]
0x140147f65: 4983fa10                 cmp      r10, 0x10
0x140147f69: 490f43d1                 cmovae   rdx, r9
0x140147f6d: 498bcc                   mov      rcx, r12
0x140147f70: 4c8d1df9332000           lea      r11, [rip + 0x2033f9] ; 'S32'
0x140147f77: 660f1f840000000000       nop      word ptr [rax + rax]
0x140147f80: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x140147f84: 48ffc1                   inc      rcx
0x140147f87: 413a440bff               cmp      al, byte ptr [r11 + rcx - 1]
0x140147f8c: 0f8583000000             jne      0x140148015
0x140147f92: 4883f904                 cmp      rcx, 4
0x140147f96: 75e8                     jne      0x140147f80
0x140147f98: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147f9c: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147fa1: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147fa6: 4533c0                   xor      r8d, r8d
0x140147fa9: 488d542420               lea      rdx, [rsp + 0x20]
0x140147fae: ff1514531d00             call     qword ptr [rip + 0x1d5314] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147fb4: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140147fb8: 48837db810               cmp      qword ptr [rbp - 0x48], 0x10
0x140147fbd: 480f434da0               cmovae   rcx, qword ptr [rbp - 0x60]
0x140147fc2: 4533c0                   xor      r8d, r8d
0x140147fc5: 488d542420               lea      rdx, [rsp + 0x20]
0x140147fca: ff15f8521d00             call     qword ptr [rip + 0x1d52f8] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140147fd0: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147fd7: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x140147fdb: 8bd0                     mov      edx, eax
0x140147fdd: c1fa08                   sar      edx, 8
0x140147fe0: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147fe7: 88543105                 mov      byte ptr [rcx + rsi + 5], dl
0x140147feb: 8bd0                     mov      edx, eax
0x140147fed: c1fa10                   sar      edx, 0x10
0x140147ff0: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140147ff7: 88543106                 mov      byte ptr [rcx + rsi + 6], dl
0x140147ffb: c1e818                   shr      eax, 0x18
0x140147ffe: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140148005: 88443107                 mov      byte ptr [rcx + rsi + 7], al
0x140148009: 83861002000004           add      dword ptr [rsi + 0x210], 4
0x140148010: e9d6060000               jmp      0x1401486eb
0x140148015: 488d55c0                 lea      rdx, [rbp - 0x40]
0x140148019: 4983fa10                 cmp      r10, 0x10
0x14014801d: 490f43d1                 cmovae   rdx, r9
0x140148021: 498bcc                   mov      rcx, r12
0x140148024: 4c8d1d49332000           lea      r11, [rip + 0x203349] ; 'STRING'
0x14014802b: 0f1f440000               nop      dword ptr [rax + rax]
0x140148030: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x140148034: 48ffc1                   inc      rcx
0x140148037: 413a440bff               cmp      al, byte ptr [r11 + rcx - 1]
0x14014803c: 0f8589000000             jne      0x1401480cb
0x140148042: 4883f907                 cmp      rcx, 7
0x140148046: 75e8                     jne      0x140148030
0x140148048: 4585c0                   test     r8d, r8d
0x14014804b: 0f8e9a060000             jle      0x1401486eb
0x140148051: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140148055: 4c8b4da0                 mov      r9, qword ptr [rbp - 0x60]
0x140148059: 4c8b55b8                 mov      r10, qword ptr [rbp - 0x48]
0x14014805d: 4983fa10                 cmp      r10, 0x10
0x140148061: 490f43c9                 cmovae   rcx, r9
0x140148065: 48c7c0ffffffff           mov      rax, -1
0x14014806c: 0f1f4000                 nop      dword ptr [rax]
0x140148070: 48ffc0                   inc      rax
0x140148073: 803c0100                 cmp      byte ptr [rcx + rax], 0
0x140148077: 75f7                     jne      0x140148070
0x140148079: 443bc0                   cmp      r8d, eax
0x14014807c: 7e1d                     jle      0x14014809b
0x14014807e: 488d45a0                 lea      rax, [rbp - 0x60]
0x140148082: 4983fa10                 cmp      r10, 0x10
0x140148086: 490f43c1                 cmovae   rax, r9
0x14014808a: 49c7c0ffffffff           mov      r8, -1
0x140148091: 49ffc0                   inc      r8
0x140148094: 42803c0000               cmp      byte ptr [rax + r8], 0
0x140148099: 75f6                     jne      0x140148091
0x14014809b: 488d55a0                 lea      rdx, [rbp - 0x60]
0x14014809f: 4983fa10                 cmp      r10, 0x10
0x1401480a3: 490f43d1                 cmovae   rdx, r9
0x1401480a7: 4d63c0                   movsxd   r8, r8d
0x1401480aa: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x1401480b1: 488d4e04                 lea      rcx, [rsi + 4]
0x1401480b5: 4803c8                   add      rcx, rax
0x1401480b8: e8372c1b00               call     0x1402facf4
0x1401480bd: 8b4520                   mov      eax, dword ptr [rbp + 0x20]
0x1401480c0: 018610020000             add      dword ptr [rsi + 0x210], eax
0x1401480c6: e920060000               jmp      0x1401486eb
0x1401480cb: 488d55c0                 lea      rdx, [rbp - 0x40]
0x1401480cf: 4983fa10                 cmp      r10, 0x10
0x1401480d3: 490f43d1                 cmovae   rdx, r9
0x1401480d7: 498bcc                   mov      rcx, r12
0x1401480da: 660f1f440000             nop      word ptr [rax + rax]
0x1401480e0: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x1401480e4: 48ffc1                   inc      rcx
0x1401480e7: 413a440eff               cmp      al, byte ptr [r14 + rcx - 1]
0x1401480ec: 0f85b3010000             jne      0x1401482a5
0x1401480f2: 4883f907                 cmp      rcx, 7
0x1401480f6: 75e8                     jne      0x1401480e0
0x1401480f8: 0f57c0                   xorps    xmm0, xmm0
0x1401480fb: f30f7f442428             movdqu   xmmword ptr [rsp + 0x28], xmm0
0x140148101: 4c89642438               mov      qword ptr [rsp + 0x38], r12
0x140148106: 4c89642458               mov      qword ptr [rsp + 0x58], r12
0x14014810b: 48c74424700f000000       mov      qword ptr [rsp + 0x70], 0xf
0x140148114: 48c744246801000000       mov      qword ptr [rsp + 0x68], 1
0x14014811d: 66c74424582c00           mov      word ptr [rsp + 0x58], 0x2c
0x140148124: 4c8d442428               lea      r8, [rsp + 0x28]
0x140148129: 488d542458               lea      rdx, [rsp + 0x58]
0x14014812e: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140148132: e88945eeff               call     0x14002c6c0
0x140148137: 90                       nop
0x140148138: 488b542470               mov      rdx, qword ptr [rsp + 0x70]
0x14014813d: 4883fa10                 cmp      rdx, 0x10
0x140148141: 7232                     jb       0x140148175
0x140148143: 48ffc2                   inc      rdx
0x140148146: 488b4c2458               mov      rcx, qword ptr [rsp + 0x58]
0x14014814b: 488bc1                   mov      rax, rcx
0x14014814e: 4881fa00100000           cmp      rdx, 0x1000
0x140148155: 7219                     jb       0x140148170
0x140148157: 4883c227                 add      rdx, 0x27
0x14014815b: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14014815f: 482bc1                   sub      rax, rcx
0x140148162: 4883c0f8                 add      rax, -8
0x140148166: 4883f81f                 cmp      rax, 0x1f
0x14014816a: 0f87a0050000             ja       0x140148710
0x140148170: e8df161b00               call     0x1402f9854
0x140148175: 4d8bf4                   mov      r14, r12
0x140148178: 4c8b7c2430               mov      r15, qword ptr [rsp + 0x30]
0x14014817d: 498bc7                   mov      rax, r15
0x140148180: 488b7c2428               mov      rdi, qword ptr [rsp + 0x28]
0x140148185: 482bc7                   sub      rax, rdi
0x140148188: 48c1f805                 sar      rax, 5
0x14014818c: 4885c0                   test     rax, rax
0x14014818f: 7462                     je       0x1401481f3
0x140148191: 493bc4                   cmp      rax, r12
0x140148194: 0f8688080000             jbe      0x140148a22
0x14014819a: 4a8d0c27                 lea      rcx, [rdi + r12]
0x14014819e: 4883791810               cmp      qword ptr [rcx + 0x18], 0x10
0x1401481a3: 7203                     jb       0x1401481a8
0x1401481a5: 488b09                   mov      rcx, qword ptr [rcx]
0x1401481a8: 4533c0                   xor      r8d, r8d
0x1401481ab: 488d542420               lea      rdx, [rsp + 0x20]
0x1401481b0: ff1512511d00             call     qword ptr [rip + 0x1d5112] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x1401481b6: 3dff000000               cmp      eax, 0xff
0x1401481bb: 0f8f56050000             jg       0x140148717
0x1401481c1: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x1401481c8: 4803ce                   add      rcx, rsi
0x1401481cb: 4288443104               mov      byte ptr [rcx + r14 + 4], al
0x1401481d0: 49ffc6                   inc      r14
0x1401481d3: 4983c420                 add      r12, 0x20
0x1401481d7: 4c8b7c2430               mov      r15, qword ptr [rsp + 0x30]
0x1401481dc: 498bc7                   mov      rax, r15
0x1401481df: 488b7c2428               mov      rdi, qword ptr [rsp + 0x28]
0x1401481e4: 482bc7                   sub      rax, rdi
0x1401481e7: 48c1f805                 sar      rax, 5
0x1401481eb: 493bc6                   cmp      rax, r14
0x1401481ee: 77aa                     ja       0x14014819a
0x1401481f0: 4533e4                   xor      r12d, r12d
0x1401481f3: 8b4520                   mov      eax, dword ptr [rbp + 0x20]
0x1401481f6: 018610020000             add      dword ptr [rsi + 0x210], eax
0x1401481fc: 4885ff                   test     rdi, rdi
0x1401481ff: 0f84d8040000             je       0x1401486dd
0x140148205: 493bff                   cmp      rdi, r15
0x140148208: 745d                     je       0x140148267
0x14014820a: 660f1f440000             nop      word ptr [rax + rax]
0x140148210: 488b5718                 mov      rdx, qword ptr [rdi + 0x18]
0x140148214: 4883fa10                 cmp      rdx, 0x10
0x140148218: 7230                     jb       0x14014824a
0x14014821a: 488b0f                   mov      rcx, qword ptr [rdi]
0x14014821d: 48ffc2                   inc      rdx
0x140148220: 4881fa00100000           cmp      rdx, 0x1000
0x140148227: 721c                     jb       0x140148245
0x140148229: 4883c227                 add      rdx, 0x27
0x14014822d: 4c8b41f8                 mov      r8, qword ptr [rcx - 8]
0x140148231: 492bc8                   sub      rcx, r8
0x140148234: 488d41f8                 lea      rax, [rcx - 8]
0x140148238: 4883f81f                 cmp      rax, 0x1f
0x14014823c: 0f877a050000             ja       0x1401487bc
0x140148242: 498bc8                   mov      rcx, r8
0x140148245: e80a161b00               call     0x1402f9854
0x14014824a: 4c896710                 mov      qword ptr [rdi + 0x10], r12
0x14014824e: 48c747180f000000         mov      qword ptr [rdi + 0x18], 0xf
0x140148256: c60700                   mov      byte ptr [rdi], 0
0x140148259: 4883c720                 add      rdi, 0x20
0x14014825d: 493bff                   cmp      rdi, r15
0x140148260: 75ae                     jne      0x140148210
0x140148262: 488b7c2428               mov      rdi, qword ptr [rsp + 0x28]
0x140148267: 488b542438               mov      rdx, qword ptr [rsp + 0x38]
0x14014826c: 482bd7                   sub      rdx, rdi
0x14014826f: 4883e2e0                 and      rdx, 0xffffffffffffffe0
0x140148273: 488bc7                   mov      rax, rdi
0x140148276: 4881fa00100000           cmp      rdx, 0x1000
0x14014827d: 7219                     jb       0x140148298
0x14014827f: 4883c227                 add      rdx, 0x27
0x140148283: 488b7ff8                 mov      rdi, qword ptr [rdi - 8]
0x140148287: 482bc7                   sub      rax, rdi
0x14014828a: 4883c0f8                 add      rax, -8
0x14014828e: 4883f81f                 cmp      rax, 0x1f
0x140148292: 0f8724050000             ja       0x1401487bc
0x140148298: 488bcf                   mov      rcx, rdi
0x14014829b: e8b4151b00               call     0x1402f9854
0x1401482a0: e938040000               jmp      0x1401486dd
0x1401482a5: 488d55c0                 lea      rdx, [rbp - 0x40]
0x1401482a9: 4983fa10                 cmp      r10, 0x10
0x1401482ad: 490f43d1                 cmovae   rdx, r9
0x1401482b1: 498bcc                   mov      rcx, r12
0x1401482b4: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x1401482b8: 48ffc1                   inc      rcx
0x1401482bb: 413a440fff               cmp      al, byte ptr [r15 + rcx - 1]
0x1401482c0: 0f8505020000             jne      0x1401484cb
0x1401482c6: 4883f908                 cmp      rcx, 8
0x1401482ca: 75e8                     jne      0x1401482b4
0x1401482cc: 0f57c0                   xorps    xmm0, xmm0
0x1401482cf: f30f7f442428             movdqu   xmmword ptr [rsp + 0x28], xmm0
0x1401482d5: 4c89642438               mov      qword ptr [rsp + 0x38], r12
0x1401482da: 4c89642458               mov      qword ptr [rsp + 0x58], r12
0x1401482df: 48c74424700f000000       mov      qword ptr [rsp + 0x70], 0xf
0x1401482e8: 48c744246801000000       mov      qword ptr [rsp + 0x68], 1
0x1401482f1: 66c74424582c00           mov      word ptr [rsp + 0x58], 0x2c
0x1401482f8: 4c8d442428               lea      r8, [rsp + 0x28]
0x1401482fd: 488d542458               lea      rdx, [rsp + 0x58]
0x140148302: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140148306: e8b543eeff               call     0x14002c6c0
0x14014830b: 90                       nop
0x14014830c: 488b542470               mov      rdx, qword ptr [rsp + 0x70]
0x140148311: 4883fa10                 cmp      rdx, 0x10
0x140148315: 7232                     jb       0x140148349
0x140148317: 48ffc2                   inc      rdx
0x14014831a: 488b4c2458               mov      rcx, qword ptr [rsp + 0x58]
0x14014831f: 488bc1                   mov      rax, rcx
0x140148322: 4881fa00100000           cmp      rdx, 0x1000
0x140148329: 7219                     jb       0x140148344
0x14014832b: 4883c227                 add      rdx, 0x27
0x14014832f: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x140148333: 482bc1                   sub      rax, rcx
0x140148336: 4883c0f8                 add      rax, -8
0x14014833a: 4883f81f                 cmp      rax, 0x1f
0x14014833e: 0f877f040000             ja       0x1401487c3
0x140148344: e80b151b00               call     0x1402f9854
0x140148349: 4d8bf4                   mov      r14, r12
0x14014834c: 4c8b642430               mov      r12, qword ptr [rsp + 0x30]
0x140148351: 498bc4                   mov      rax, r12
0x140148354: 488b7c2428               mov      rdi, qword ptr [rsp + 0x28]
0x140148359: 482bc7                   sub      rax, rdi
0x14014835c: 48c1f805                 sar      rax, 5
0x140148360: 4885c0                   test     rax, rax
0x140148363: 0f84b0000000             je       0x140148419
0x140148369: 4533ff                   xor      r15d, r15d
0x14014836c: 493bc6                   cmp      rax, r14
0x14014836f: 0f86b3060000             jbe      0x140148a28
0x140148375: 4a8d0c3f                 lea      rcx, [rdi + r15]
0x140148379: 4883791810               cmp      qword ptr [rcx + 0x18], 0x10
0x14014837e: 7203                     jb       0x140148383
0x140148380: 488b09                   mov      rcx, qword ptr [rcx]
0x140148383: 4533c0                   xor      r8d, r8d
0x140148386: 488d542420               lea      rdx, [rsp + 0x20]
0x14014838b: ff15374f1d00             call     qword ptr [rip + 0x1d4f37] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x140148391: 3dffff0000               cmp      eax, 0xffff
0x140148396: 0f8f2e040000             jg       0x1401487ca
0x14014839c: 488b442430               mov      rax, qword ptr [rsp + 0x30]
0x1401483a1: 488b4c2428               mov      rcx, qword ptr [rsp + 0x28]
0x1401483a6: 482bc1                   sub      rax, rcx
0x1401483a9: 48c1f805                 sar      rax, 5
0x1401483ad: 493bc6                   cmp      rax, r14
0x1401483b0: 0f8672060000             jbe      0x140148a28
0x1401483b6: 4903cf                   add      rcx, r15
0x1401483b9: 4883791810               cmp      qword ptr [rcx + 0x18], 0x10
0x1401483be: 7203                     jb       0x1401483c3
0x1401483c0: 488b09                   mov      rcx, qword ptr [rcx]
0x1401483c3: 4533c0                   xor      r8d, r8d
0x1401483c6: 488d542420               lea      rdx, [rsp + 0x20]
0x1401483cb: ff15f74e1d00             call     qword ptr [rip + 0x1d4ef7] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x1401483d1: 4b8d1436                 lea      rdx, [r14 + r14]
0x1401483d5: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x1401483dc: 4803ca                   add      rcx, rdx
0x1401483df: 88443104                 mov      byte ptr [rcx + rsi + 4], al
0x1401483e3: 66c1e808                 shr      ax, 8
0x1401483e7: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x1401483ee: 4803ca                   add      rcx, rdx
0x1401483f1: 88443105                 mov      byte ptr [rcx + rsi + 5], al
0x1401483f5: 49ffc6                   inc      r14
0x1401483f8: 4983c720                 add      r15, 0x20
0x1401483fc: 4c8b642430               mov      r12, qword ptr [rsp + 0x30]
0x140148401: 498bc4                   mov      rax, r12
0x140148404: 488b7c2428               mov      rdi, qword ptr [rsp + 0x28]
0x140148409: 482bc7                   sub      rax, rdi
0x14014840c: 48c1f805                 sar      rax, 5
0x140148410: 493bc6                   cmp      rax, r14
0x140148413: 0f875cffffff             ja       0x140148375
0x140148419: 8b4520                   mov      eax, dword ptr [rbp + 0x20]
0x14014841c: 03c0                     add      eax, eax
0x14014841e: 018610020000             add      dword ptr [rsi + 0x210], eax
0x140148424: 4885ff                   test     rdi, rdi
0x140148427: 0f84b0020000             je       0x1401486dd
0x14014842d: 493bfc                   cmp      rdi, r12
0x140148430: 745b                     je       0x14014848d
0x140148432: 488b5718                 mov      rdx, qword ptr [rdi + 0x18]
0x140148436: 4883fa10                 cmp      rdx, 0x10
0x14014843a: 7230                     jb       0x14014846c
0x14014843c: 488b0f                   mov      rcx, qword ptr [rdi]
0x14014843f: 48ffc2                   inc      rdx
0x140148442: 4881fa00100000           cmp      rdx, 0x1000
0x140148449: 721c                     jb       0x140148467
0x14014844b: 4883c227                 add      rdx, 0x27
0x14014844f: 4c8b41f8                 mov      r8, qword ptr [rcx - 8]
0x140148453: 492bc8                   sub      rcx, r8
0x140148456: 488d41f8                 lea      rax, [rcx - 8]
0x14014845a: 4883f81f                 cmp      rax, 0x1f
0x14014845e: 0f8722040000             ja       0x140148886
0x140148464: 498bc8                   mov      rcx, r8
0x140148467: e8e8131b00               call     0x1402f9854
0x14014846c: 48c7471000000000         mov      qword ptr [rdi + 0x10], 0
0x140148474: 48c747180f000000         mov      qword ptr [rdi + 0x18], 0xf
0x14014847c: c60700                   mov      byte ptr [rdi], 0
0x14014847f: 4883c720                 add      rdi, 0x20
0x140148483: 493bfc                   cmp      rdi, r12
0x140148486: 75aa                     jne      0x140148432
0x140148488: 488b7c2428               mov      rdi, qword ptr [rsp + 0x28]
0x14014848d: 488b542438               mov      rdx, qword ptr [rsp + 0x38]
0x140148492: 482bd7                   sub      rdx, rdi
0x140148495: 4883e2e0                 and      rdx, 0xffffffffffffffe0
0x140148499: 488bc7                   mov      rax, rdi
0x14014849c: 4881fa00100000           cmp      rdx, 0x1000
0x1401484a3: 7219                     jb       0x1401484be
0x1401484a5: 4883c227                 add      rdx, 0x27
0x1401484a9: 488b7ff8                 mov      rdi, qword ptr [rdi - 8]
0x1401484ad: 482bc7                   sub      rax, rdi
0x1401484b0: 4883c0f8                 add      rax, -8
0x1401484b4: 4883f81f                 cmp      rax, 0x1f
0x1401484b8: 0f87c8030000             ja       0x140148886
0x1401484be: 488bcf                   mov      rcx, rdi
0x1401484c1: e88e131b00               call     0x1402f9854
0x1401484c6: e912020000               jmp      0x1401486dd
0x1401484cb: 488d55c0                 lea      rdx, [rbp - 0x40]
0x1401484cf: 4983fa10                 cmp      r10, 0x10
0x1401484d3: 490f43d1                 cmovae   rdx, r9
0x1401484d7: 498bcc                   mov      rcx, r12
0x1401484da: 660f1f440000             nop      word ptr [rax + rax]
0x1401484e0: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x1401484e4: 48ffc1                   inc      rcx
0x1401484e7: 3a440fff                 cmp      al, byte ptr [rdi + rcx - 1]
0x1401484eb: 0f85fa010000             jne      0x1401486eb
0x1401484f1: 4883f908                 cmp      rcx, 8
0x1401484f5: 75e9                     jne      0x1401484e0
0x1401484f7: 0f57c0                   xorps    xmm0, xmm0
0x1401484fa: f30f7f442440             movdqu   xmmword ptr [rsp + 0x40], xmm0
0x140148500: 4c89642450               mov      qword ptr [rsp + 0x50], r12
0x140148505: 4c89642458               mov      qword ptr [rsp + 0x58], r12
0x14014850a: 48c74424700f000000       mov      qword ptr [rsp + 0x70], 0xf
0x140148513: 48c744246801000000       mov      qword ptr [rsp + 0x68], 1
0x14014851c: 66c74424582c00           mov      word ptr [rsp + 0x58], 0x2c
0x140148523: 4c8d442440               lea      r8, [rsp + 0x40]
0x140148528: 488d542458               lea      rdx, [rsp + 0x58]
0x14014852d: 488d4da0                 lea      rcx, [rbp - 0x60]
0x140148531: e88a41eeff               call     0x14002c6c0
0x140148536: 90                       nop
0x140148537: 488b542470               mov      rdx, qword ptr [rsp + 0x70]
0x14014853c: 4883fa10                 cmp      rdx, 0x10
0x140148540: 7232                     jb       0x140148574
0x140148542: 48ffc2                   inc      rdx
0x140148545: 488b4c2458               mov      rcx, qword ptr [rsp + 0x58]
0x14014854a: 488bc1                   mov      rax, rcx
0x14014854d: 4881fa00100000           cmp      rdx, 0x1000
0x140148554: 7219                     jb       0x14014856f
0x140148556: 4883c227                 add      rdx, 0x27
0x14014855a: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14014855e: 482bc1                   sub      rax, rcx
0x140148561: 4883c0f8                 add      rax, -8
0x140148565: 4883f81f                 cmp      rax, 0x1f
0x140148569: 0f871e030000             ja       0x14014888d
0x14014856f: e8e0121b00               call     0x1402f9854
0x140148574: 4d8bf4                   mov      r14, r12
0x140148577: 4c8b7c2448               mov      r15, qword ptr [rsp + 0x48]
0x14014857c: 498bc7                   mov      rax, r15
0x14014857f: 488b7c2440               mov      rdi, qword ptr [rsp + 0x40]
0x140148584: 482bc7                   sub      rax, rdi
0x140148587: 48c1f805                 sar      rax, 5
0x14014858b: 4885c0                   test     rax, rax
0x14014858e: 0f84ce000000             je       0x140148662
0x140148594: 493bc4                   cmp      rax, r12
0x140148597: 0f867f040000             jbe      0x140148a1c
0x14014859d: 4a8d0c27                 lea      rcx, [rdi + r12]
0x1401485a1: 4883791810               cmp      qword ptr [rcx + 0x18], 0x10
0x1401485a6: 7203                     jb       0x1401485ab
0x1401485a8: 488b09                   mov      rcx, qword ptr [rcx]
0x1401485ab: 4533c0                   xor      r8d, r8d
0x1401485ae: 488d542420               lea      rdx, [rsp + 0x20]
0x1401485b3: ff150f4d1d00             call     qword ptr [rip + 0x1d4d0f] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x1401485b9: 488b442448               mov      rax, qword ptr [rsp + 0x48]
0x1401485be: 488b4c2440               mov      rcx, qword ptr [rsp + 0x40]
0x1401485c3: 482bc1                   sub      rax, rcx
0x1401485c6: 48c1f805                 sar      rax, 5
0x1401485ca: 493bc6                   cmp      rax, r14
0x1401485cd: 0f8649040000             jbe      0x140148a1c
0x1401485d3: 4903cc                   add      rcx, r12
0x1401485d6: 4883791810               cmp      qword ptr [rcx + 0x18], 0x10
0x1401485db: 7203                     jb       0x1401485e0
0x1401485dd: 488b09                   mov      rcx, qword ptr [rcx]
0x1401485e0: 4533c0                   xor      r8d, r8d
0x1401485e3: 488d542420               lea      rdx, [rsp + 0x20]
0x1401485e8: ff15da4c1d00             call     qword ptr [rip + 0x1d4cda] ; api-ms-win-crt-convert-l1-1-0.dll:strtol
0x1401485ee: 448bc0                   mov      r8d, eax
0x1401485f1: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x1401485f8: 4803ce                   add      rcx, rsi
0x1401485fb: 468844b104               mov      byte ptr [rcx + r14*4 + 4], r8b
0x140148600: 8bd0                     mov      edx, eax
0x140148602: c1ea08                   shr      edx, 8
0x140148605: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x14014860c: 4803ce                   add      rcx, rsi
0x14014860f: 428854b105               mov      byte ptr [rcx + r14*4 + 5], dl
0x140148614: 8bd0                     mov      edx, eax
0x140148616: c1ea10                   shr      edx, 0x10
0x140148619: 48638e10020000           movsxd   rcx, dword ptr [rsi + 0x210]
0x140148620: 4803ce                   add      rcx, rsi
0x140148623: 428854b106               mov      byte ptr [rcx + r14*4 + 6], dl
0x140148628: 41c1e818                 shr      r8d, 0x18
0x14014862c: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x140148633: 4803c6                   add      rax, rsi
0x140148636: 468844b007               mov      byte ptr [rax + r14*4 + 7], r8b
0x14014863b: 49ffc6                   inc      r14
0x14014863e: 4983c420                 add      r12, 0x20
0x140148642: 4c8b7c2448               mov      r15, qword ptr [rsp + 0x48]
0x140148647: 498bc7                   mov      rax, r15
0x14014864a: 488b7c2440               mov      rdi, qword ptr [rsp + 0x40]
0x14014864f: 482bc7                   sub      rax, rdi
0x140148652: 48c1f805                 sar      rax, 5
0x140148656: 493bc6                   cmp      rax, r14
0x140148659: 0f873effffff             ja       0x14014859d
0x14014865f: 4533e4                   xor      r12d, r12d
0x140148662: 8b4520                   mov      eax, dword ptr [rbp + 0x20]
0x140148665: 8d048500000000           lea      eax, [rax*4]
0x14014866c: 018610020000             add      dword ptr [rsi + 0x210], eax
0x140148672: 4885ff                   test     rdi, rdi
0x140148675: 7466                     je       0x1401486dd
0x140148677: 493bff                   cmp      rdi, r15
0x14014867a: 741a                     je       0x140148696
0x14014867c: 0f1f4000                 nop      dword ptr [rax]
0x140148680: 488bcf                   mov      rcx, rdi
0x140148683: e8d8b1ecff               call     0x140013860
0x140148688: 4883c720                 add      rdi, 0x20
0x14014868c: 493bff                   cmp      rdi, r15
0x14014868f: 75ef                     jne      0x140148680
0x140148691: 488b7c2440               mov      rdi, qword ptr [rsp + 0x40]
0x140148696: 488b542450               mov      rdx, qword ptr [rsp + 0x50]
0x14014869b: 482bd7                   sub      rdx, rdi
0x14014869e: 4883e2e0                 and      rdx, 0xffffffffffffffe0
0x1401486a2: 488bc7                   mov      rax, rdi
0x1401486a5: 4881fa00100000           cmp      rdx, 0x1000
0x1401486ac: 7219                     jb       0x1401486c7
0x1401486ae: 4883c227                 add      rdx, 0x27
0x1401486b2: 488b7ff8                 mov      rdi, qword ptr [rdi - 8]
0x1401486b6: 482bc7                   sub      rax, rdi
0x1401486b9: 4883c0f8                 add      rax, -8
0x1401486bd: 4883f81f                 cmp      rax, 0x1f
0x1401486c1: 0f87cd010000             ja       0x140148894
0x1401486c7: 488bcf                   mov      rcx, rdi
0x1401486ca: e885111b00               call     0x1402f9854
0x1401486cf: 0f57c0                   xorps    xmm0, xmm0
0x1401486d2: f30f7f442440             movdqu   xmmword ptr [rsp + 0x40], xmm0
0x1401486d8: 4c89642450               mov      qword ptr [rsp + 0x50], r12
0x1401486dd: 4c8d35982c2000           lea      r14, [rip + 0x202c98] ; 'ARR_U8'
0x1401486e4: 488d3da52c2000           lea      rdi, [rip + 0x202ca5] ; 'ARR_U32'
0x1401486eb: 488d4d80                 lea      rcx, [rbp - 0x80]
0x1401486ef: e84c0af4ff               call     0x140089140
0x1401486f4: 4881c3a8000000           add      rbx, 0xa8
0x1401486fb: 483b9e40020000           cmp      rbx, qword ptr [rsi + 0x240]
0x140148702: 0f8493010000             je       0x14014889b
0x140148708: 4533e4                   xor      r12d, r12d
0x14014870b: e955f5ffff               jmp      0x140147c65
0x140148710: ff158a4c1d00             call     qword ptr [rip + 0x1d4c8a] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x140148716: 90                       nop
0x140148717: 488b5c2428               mov      rbx, qword ptr [rsp + 0x28]
0x14014871c: 4885db                   test     rbx, rbx
0x14014871f: 0f844e010000             je       0x140148873
0x140148725: 488b7c2430               mov      rdi, qword ptr [rsp + 0x30]
0x14014872a: 483bdf                   cmp      rbx, rdi
0x14014872d: 7458                     je       0x140148787
0x14014872f: 90                       nop
0x140148730: 488b5318                 mov      rdx, qword ptr [rbx + 0x18]
0x140148734: 4883fa10                 cmp      rdx, 0x10
0x140148738: 722c                     jb       0x140148766
0x14014873a: 488b0b                   mov      rcx, qword ptr [rbx]
0x14014873d: 48ffc2                   inc      rdx
0x140148740: 4881fa00100000           cmp      rdx, 0x1000
0x140148747: 7218                     jb       0x140148761
0x140148749: 4883c227                 add      rdx, 0x27
0x14014874d: 4c8b41f8                 mov      r8, qword ptr [rcx - 8]
0x140148751: 492bc8                   sub      rcx, r8
0x140148754: 488d41f8                 lea      rax, [rcx - 8]
0x140148758: 4883f81f                 cmp      rax, 0x1f
0x14014875c: 775e                     ja       0x1401487bc
0x14014875e: 498bc8                   mov      rcx, r8
0x140148761: e8ee101b00               call     0x1402f9854
0x140148766: 48c7431000000000         mov      qword ptr [rbx + 0x10], 0
0x14014876e: 48c743180f000000         mov      qword ptr [rbx + 0x18], 0xf
0x140148776: c60300                   mov      byte ptr [rbx], 0
0x140148779: 4883c320                 add      rbx, 0x20
0x14014877d: 483bdf                   cmp      rbx, rdi
0x140148780: 75ae                     jne      0x140148730
0x140148782: 488b5c2428               mov      rbx, qword ptr [rsp + 0x28]
0x140148787: 488b542438               mov      rdx, qword ptr [rsp + 0x38]
0x14014878c: 482bd3                   sub      rdx, rbx
0x14014878f: 4883e2e0                 and      rdx, 0xffffffffffffffe0
0x140148793: 488bc3                   mov      rax, rbx
0x140148796: 4881fa00100000           cmp      rdx, 0x1000
0x14014879d: 0f82c7000000             jb       0x14014886a
0x1401487a3: 4883c227                 add      rdx, 0x27
0x1401487a7: 488b5bf8                 mov      rbx, qword ptr [rbx - 8]
0x1401487ab: 482bc3                   sub      rax, rbx
0x1401487ae: 4883c0f8                 add      rax, -8
0x1401487b2: 4883f81f                 cmp      rax, 0x1f
0x1401487b6: 0f86ae000000             jbe      0x14014886a
0x1401487bc: ff15de4b1d00             call     qword ptr [rip + 0x1d4bde] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x1401487c2: 90                       nop
0x1401487c3: ff15d74b1d00             call     qword ptr [rip + 0x1d4bd7] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x1401487c9: 90                       nop
0x1401487ca: 488b5c2428               mov      rbx, qword ptr [rsp + 0x28]
0x1401487cf: 4885db                   test     rbx, rbx
0x1401487d2: 0f849b000000             je       0x140148873
0x1401487d8: 488b7c2430               mov      rdi, qword ptr [rsp + 0x30]
0x1401487dd: 483bdf                   cmp      rbx, rdi
0x1401487e0: 745b                     je       0x14014883d
0x1401487e2: 488b5318                 mov      rdx, qword ptr [rbx + 0x18]
0x1401487e6: 4883fa10                 cmp      rdx, 0x10
0x1401487ea: 7230                     jb       0x14014881c
0x1401487ec: 488b0b                   mov      rcx, qword ptr [rbx]
0x1401487ef: 48ffc2                   inc      rdx
0x1401487f2: 4881fa00100000           cmp      rdx, 0x1000
0x1401487f9: 721c                     jb       0x140148817
0x1401487fb: 4883c227                 add      rdx, 0x27
0x1401487ff: 4c8b41f8                 mov      r8, qword ptr [rcx - 8]
0x140148803: 492bc8                   sub      rcx, r8
0x140148806: 488d41f8                 lea      rax, [rcx - 8]
0x14014880a: 4883f81f                 cmp      rax, 0x1f
0x14014880e: 0f8772000000             ja       0x140148886
0x140148814: 498bc8                   mov      rcx, r8
0x140148817: e838101b00               call     0x1402f9854
0x14014881c: 48c7431000000000         mov      qword ptr [rbx + 0x10], 0
0x140148824: 48c743180f000000         mov      qword ptr [rbx + 0x18], 0xf
0x14014882c: c60300                   mov      byte ptr [rbx], 0
0x14014882f: 4883c320                 add      rbx, 0x20
0x140148833: 483bdf                   cmp      rbx, rdi
0x140148836: 75aa                     jne      0x1401487e2
0x140148838: 488b5c2428               mov      rbx, qword ptr [rsp + 0x28]
0x14014883d: 488b542438               mov      rdx, qword ptr [rsp + 0x38]
0x140148842: 482bd3                   sub      rdx, rbx
0x140148845: 4883e2e0                 and      rdx, 0xffffffffffffffe0
0x140148849: 4c8bc3                   mov      r8, rbx
0x14014884c: 4881fa00100000           cmp      rdx, 0x1000
0x140148853: 7215                     jb       0x14014886a
0x140148855: 4883c227                 add      rdx, 0x27
0x140148859: 488b5bf8                 mov      rbx, qword ptr [rbx - 8]
0x14014885d: 4c2bc3                   sub      r8, rbx
0x140148860: 4983c0f8                 add      r8, -8
0x140148864: 4983f81f                 cmp      r8, 0x1f
0x140148868: 771c                     ja       0x140148886
0x14014886a: 488bcb                   mov      rcx, rbx
0x14014886d: e8e20f1b00               call     0x1402f9854
0x140148872: 90                       nop
0x140148873: 488d4d80                 lea      rcx, [rbp - 0x80]
0x140148877: e8c408f4ff               call     0x140089140
0x14014887c: b8ffffffff               mov      eax, 0xffffffff
0x140148881: e969010000               jmp      0x1401489ef
0x140148886: ff15144b1d00             call     qword ptr [rip + 0x1d4b14] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14014888c: 90                       nop
0x14014888d: ff150d4b1d00             call     qword ptr [rip + 0x1d4b0d] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x140148893: 90                       nop
0x140148894: ff15064b1d00             call     qword ptr [rip + 0x1d4b06] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14014889a: 90                       nop
0x14014889b: 488d8e98020000           lea      rcx, [rsi + 0x298]
0x1401488a2: 488b5110                 mov      rdx, qword ptr [rcx + 0x10]
0x1401488a6: 488bc1                   mov      rax, rcx
0x1401488a9: 4c8b4118                 mov      r8, qword ptr [rcx + 0x18]
0x1401488ad: 4983f810                 cmp      r8, 0x10
0x1401488b1: 7203                     jb       0x1401488b6
0x1401488b3: 488b01                   mov      rax, qword ptr [rcx]
0x1401488b6: 4883fa02                 cmp      rdx, 2
0x1401488ba: 7507                     jne      0x1401488c3
0x1401488bc: 6681385538               cmp      word ptr [rax], 0x3855
0x1401488c1: 7461                     je       0x140148924
0x1401488c3: 488bc1                   mov      rax, rcx
0x1401488c6: 4983f810                 cmp      r8, 0x10
0x1401488ca: 7203                     jb       0x1401488cf
0x1401488cc: 488b01                   mov      rax, qword ptr [rcx]
0x1401488cf: 4883fa03                 cmp      rdx, 3
0x1401488d3: 750d                     jne      0x1401488e2
0x1401488d5: 6681385531               cmp      word ptr [rax], 0x3155
0x1401488da: 7506                     jne      0x1401488e2
0x1401488dc: 80780236                 cmp      byte ptr [rax + 2], 0x36
0x1401488e0: 7436                     je       0x140148918
0x1401488e2: 488bc1                   mov      rax, rcx
0x1401488e5: 4983f810                 cmp      r8, 0x10
0x1401488e9: 7203                     jb       0x1401488ee
0x1401488eb: 488b01                   mov      rax, qword ptr [rcx]
0x1401488ee: 4883fa03                 cmp      rdx, 3
0x1401488f2: 753c                     jne      0x140148930
0x1401488f4: 6681385533               cmp      word ptr [rax], 0x3355
0x1401488f9: 7535                     jne      0x140148930
0x1401488fb: 80780232                 cmp      byte ptr [rax + 2], 0x32
0x1401488ff: 752f                     jne      0x140148930
0x140148901: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x140148908: c6043000                 mov      byte ptr [rax + rsi], 0
0x14014890c: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x140148913: c644300100               mov      byte ptr [rax + rsi + 1], 0
0x140148918: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x14014891f: c644300200               mov      byte ptr [rax + rsi + 2], 0
0x140148924: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x14014892b: c644300300               mov      byte ptr [rax + rsi + 3], 0
0x140148930: b2ff                     mov      dl, 0xff
0x140148932: 4c638610020000           movsxd   r8, dword ptr [rsi + 0x210]
0x140148939: 4585c0                   test     r8d, r8d
0x14014893c: 7e11                     jle      0x14014894f
0x14014893e: 418bc0                   mov      eax, r8d
0x140148941: 41325500                 xor      dl, byte ptr [r13]
0x140148945: 4d8d6d01                 lea      r13, [r13 + 1]
0x140148949: 4883e801                 sub      rax, 1
0x14014894d: 75f2                     jne      0x140148941
0x14014894f: 4c8b4910                 mov      r9, qword ptr [rcx + 0x10]
0x140148953: 488bc1                   mov      rax, rcx
0x140148956: 4c8b5118                 mov      r10, qword ptr [rcx + 0x18]
0x14014895a: 4983fa10                 cmp      r10, 0x10
0x14014895e: 7203                     jb       0x140148963
0x140148960: 488b01                   mov      rax, qword ptr [rcx]
0x140148963: 4983f902                 cmp      r9, 2
0x140148967: 7511                     jne      0x14014897a
0x140148969: 6681385538               cmp      word ptr [rax], 0x3855
0x14014896e: 750a                     jne      0x14014897a
0x140148970: 4188543003               mov      byte ptr [r8 + rsi + 3], dl
0x140148975: e96a000000               jmp      0x1401489e4
0x14014897a: 488bc1                   mov      rax, rcx
0x14014897d: 4983fa10                 cmp      r10, 0x10
0x140148981: 7203                     jb       0x140148986
0x140148983: 488b01                   mov      rax, qword ptr [rcx]
0x140148986: 4983f903                 cmp      r9, 3
0x14014898a: 7514                     jne      0x1401489a0
0x14014898c: 6681385531               cmp      word ptr [rax], 0x3155
0x140148991: 750d                     jne      0x1401489a0
0x140148993: 80780236                 cmp      byte ptr [rax + 2], 0x36
0x140148997: 7507                     jne      0x1401489a0
0x140148999: 4188543002               mov      byte ptr [r8 + rsi + 2], dl
0x14014899e: eb38                     jmp      0x1401489d8
0x1401489a0: 4983fa10                 cmp      r10, 0x10
0x1401489a4: 7203                     jb       0x1401489a9
0x1401489a6: 488b09                   mov      rcx, qword ptr [rcx]
0x1401489a9: 4983f903                 cmp      r9, 3
0x1401489ad: 7535                     jne      0x1401489e4
0x1401489af: 6681395533               cmp      word ptr [rcx], 0x3355
0x1401489b4: 752e                     jne      0x1401489e4
0x1401489b6: 80790232                 cmp      byte ptr [rcx + 2], 0x32
0x1401489ba: 7528                     jne      0x1401489e4
0x1401489bc: 41881430                 mov      byte ptr [r8 + rsi], dl
0x1401489c0: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x1401489c7: c644300100               mov      byte ptr [rax + rsi + 1], 0
0x1401489cc: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x1401489d3: c644300200               mov      byte ptr [rax + rsi + 2], 0
0x1401489d8: 48638610020000           movsxd   rax, dword ptr [rsi + 0x210]
0x1401489df: c644300300               mov      byte ptr [rax + rsi + 3], 0
0x1401489e4: 0fb6c2                   movzx    eax, dl
0x1401489e7: 898690020000             mov      dword ptr [rsi + 0x290], eax
0x1401489ed: 33c0                     xor      eax, eax
0x1401489ef: 488b4d30                 mov      rcx, qword ptr [rbp + 0x30]
0x1401489f3: 4833cc                   xor      rcx, rsp
0x1401489f6: e855141b00               call     0x1402f9e50
0x1401489fb: 4c8d9c2440010000         lea      r11, [rsp + 0x140]
0x140148a03: 498b5b38                 mov      rbx, qword ptr [r11 + 0x38]
0x140148a07: 498b7340                 mov      rsi, qword ptr [r11 + 0x40]
0x140148a0b: 498b7b48                 mov      rdi, qword ptr [r11 + 0x48]
0x140148a0f: 498be3                   mov      rsp, r11
0x140148a12: 415f                     pop      r15
0x140148a14: 415e                     pop      r14
0x140148a16: 415d                     pop      r13
0x140148a18: 415c                     pop      r12
0x140148a1a: 5d                       pop      rbp
0x140148a1b: c3                       ret
0x140148a1c: e89f250000               call     0x14014afc0
0x140148a21: 90                       nop
0x140148a22: e899250000               call     0x14014afc0
0x140148a27: 90                       nop
0x140148a28: e893250000               call     0x14014afc0
0x140148a2d: cc                       int3
