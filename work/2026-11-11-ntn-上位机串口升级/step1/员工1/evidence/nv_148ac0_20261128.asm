FUNCTION 0x140148ac0 .. 0x140149045
0x140148ac0: 4885d2                   test     rdx, rdx
0x140148ac3: 0f8474050000             je       0x14014903d
0x140148ac9: 48895c2418               mov      qword ptr [rsp + 0x18], rbx
0x140148ace: 55                       push     rbp
0x140148acf: 56                       push     rsi
0x140148ad0: 57                       push     rdi
0x140148ad1: 4154                     push     r12
0x140148ad3: 4155                     push     r13
0x140148ad5: 4156                     push     r14
0x140148ad7: 4157                     push     r15
0x140148ad9: 488d6c24d9               lea      rbp, [rsp - 0x27]
0x140148ade: 4881ece0000000           sub      rsp, 0xe0
0x140148ae5: 488b05fccb3900           mov      rax, qword ptr [rip + 0x39cbfc]
0x140148aec: 4833c4                   xor      rax, rsp
0x140148aef: 48894517                 mov      qword ptr [rbp + 0x17], rax
0x140148af3: 4c8be2                   mov      r12, rdx
0x140148af6: 4c8be9                   mov      r13, rcx
0x140148af9: 488d35e4282000           lea      rsi, [rip + 0x2028e4] ; 'value'
0x140148b00: 4c8d35fde71d00           lea      r14, [rip + 0x1de7fd] ; 'type'
0x140148b07: 488d3d0a292000           lea      rdi, [rip + 0x20290a] ; 'note'
0x140148b0e: 6690                     nop
0x140148b10: 498bcc                   mov      rcx, r12
0x140148b13: e828c1ffff               call     0x140144c40
0x140148b18: 4885c0                   test     rax, rax
0x140148b1b: 0f84f6040000             je       0x140149017
0x140148b21: 48c744242000000000       mov      qword ptr [rsp + 0x20], 0
0x140148b2a: 48c744243000000000       mov      qword ptr [rsp + 0x30], 0
0x140148b33: 48c74424380f000000       mov      qword ptr [rsp + 0x38], 0xf
0x140148b3c: c644242000               mov      byte ptr [rsp + 0x20], 0
0x140148b41: 48c7458700000000         mov      qword ptr [rbp - 0x79], 0
0x140148b49: 48c7459700000000         mov      qword ptr [rbp - 0x69], 0
0x140148b51: 48c7459f0f000000         mov      qword ptr [rbp - 0x61], 0xf
0x140148b59: c6458700                 mov      byte ptr [rbp - 0x79], 0
0x140148b5d: 48c745a700000000         mov      qword ptr [rbp - 0x59], 0
0x140148b65: 48c745b700000000         mov      qword ptr [rbp - 0x49], 0
0x140148b6d: 48c745bf0f000000         mov      qword ptr [rbp - 0x41], 0xf
0x140148b75: c645a700                 mov      byte ptr [rbp - 0x59], 0
0x140148b79: 48c745c700000000         mov      qword ptr [rbp - 0x39], 0
0x140148b81: 48c745d700000000         mov      qword ptr [rbp - 0x29], 0
0x140148b89: 48c745df0f000000         mov      qword ptr [rbp - 0x21], 0xf
0x140148b91: c645c700                 mov      byte ptr [rbp - 0x39], 0
0x140148b95: 48c745e700000000         mov      qword ptr [rbp - 0x19], 0
0x140148b9d: 48c745f700000000         mov      qword ptr [rbp - 9], 0
0x140148ba5: 48c745ff0f000000         mov      qword ptr [rbp - 1], 0xf
0x140148bad: c645e700                 mov      byte ptr [rbp - 0x19], 0
0x140148bb1: 49c7c0ffffffff           mov      r8, -1
0x140148bb8: 0f1f840000000000         nop      dword ptr [rax + rax]
0x140148bc0: 49ffc0                   inc      r8
0x140148bc3: 42803c0000               cmp      byte ptr [rax + r8], 0
0x140148bc8: 75f6                     jne      0x140148bc0
0x140148bca: 488bd0                   mov      rdx, rax
0x140148bcd: 488d4c2420               lea      rcx, [rsp + 0x20]
0x140148bd2: e819c2ecff               call     0x140014df0
0x140148bd7: 4d8b7c2470               mov      r15, qword ptr [r12 + 0x70]
0x140148bdc: 4d85ff                   test     r15, r15
0x140148bdf: 0f84de020000             je       0x140148ec3
0x140148be5: 498bcf                   mov      rcx, r15
0x140148be8: e82399ffff               call     0x140142510
0x140148bed: 488bd8                   mov      rbx, rax
0x140148bf0: 33d2                     xor      edx, edx
0x140148bf2: 0fb60c10                 movzx    ecx, byte ptr [rax + rdx]
0x140148bf6: 48ffc2                   inc      rdx
0x140148bf9: 3a4c16ff                 cmp      cl, byte ptr [rsi + rdx - 1]
0x140148bfd: 0f8589000000             jne      0x140148c8c
0x140148c03: 4883fa06                 cmp      rdx, 6
0x140148c07: 75e9                     jne      0x140148bf2
0x140148c09: 498bcf                   mov      rcx, r15
0x140148c0c: e81fc0ffff               call     0x140144c30
0x140148c11: 49c7c0ffffffff           mov      r8, -1
0x140148c18: 0f1f840000000000         nop      dword ptr [rax + rax]
0x140148c20: 49ffc0                   inc      r8
0x140148c23: 42803c0000               cmp      byte ptr [rax + r8], 0
0x140148c28: 75f6                     jne      0x140148c20
0x140148c2a: 488bd0                   mov      rdx, rax
0x140148c2d: 488d4d87                 lea      rcx, [rbp - 0x79]
0x140148c31: e8bac1ecff               call     0x140014df0
0x140148c36: 488d4c2420               lea      rcx, [rsp + 0x20]
0x140148c3b: 48837c243810             cmp      qword ptr [rsp + 0x38], 0x10
0x140148c41: 480f434c2420             cmovae   rcx, qword ptr [rsp + 0x20]
0x140148c47: 48837c24300e             cmp      qword ptr [rsp + 0x30], 0xe
0x140148c4d: 753d                     jne      0x140148c8c
0x140148c4f: 41b80e000000             mov      r8d, 0xe
0x140148c55: 488d159c272000           lea      rdx, [rip + 0x20279c] ; 'CurrentVersion'
0x140148c5c: e8a5201b00               call     0x1402fad06
0x140148c61: 85c0                     test     eax, eax
0x140148c63: 7527                     jne      0x140148c8c
0x140148c65: 498d8d18020000           lea      rcx, [r13 + 0x218]
0x140148c6c: 488d4587                 lea      rax, [rbp - 0x79]
0x140148c70: 483bc8                   cmp      rcx, rax
0x140148c73: 7417                     je       0x140148c8c
0x140148c75: 488d5587                 lea      rdx, [rbp - 0x79]
0x140148c79: 48837d9f10               cmp      qword ptr [rbp - 0x61], 0x10
0x140148c7e: 480f435587               cmovae   rdx, qword ptr [rbp - 0x79]
0x140148c83: 4c8b4597                 mov      r8, qword ptr [rbp - 0x69]
0x140148c87: e864c1ecff               call     0x140014df0
0x140148c8c: 33c9                     xor      ecx, ecx
0x140148c8e: 6690                     nop
0x140148c90: 0fb6040b                 movzx    eax, byte ptr [rbx + rcx]
0x140148c94: 48ffc1                   inc      rcx
0x140148c97: 413a440eff               cmp      al, byte ptr [r14 + rcx - 1]
0x140148c9c: 0f8520010000             jne      0x140148dc2
0x140148ca2: 4883f905                 cmp      rcx, 5
0x140148ca6: 75e8                     jne      0x140148c90
0x140148ca8: 498bcf                   mov      rcx, r15
0x140148cab: e880bfffff               call     0x140144c30
0x140148cb0: 49c7c0ffffffff           mov      r8, -1
0x140148cb7: 660f1f840000000000       nop      word ptr [rax + rax]
0x140148cc0: 49ffc0                   inc      r8
0x140148cc3: 42803c0000               cmp      byte ptr [rax + r8], 0
0x140148cc8: 75f6                     jne      0x140148cc0
0x140148cca: 488bd0                   mov      rdx, rax
0x140148ccd: 488d4da7                 lea      rcx, [rbp - 0x59]
0x140148cd1: e81ac1ecff               call     0x140014df0
0x140148cd6: 488d4c2420               lea      rcx, [rsp + 0x20]
0x140148cdb: 488b7c2420               mov      rdi, qword ptr [rsp + 0x20]
0x140148ce0: 488b742438               mov      rsi, qword ptr [rsp + 0x38]
0x140148ce5: 4883fe10                 cmp      rsi, 0x10
0x140148ce9: 480f43cf                 cmovae   rcx, rdi
0x140148ced: 4c8b742430               mov      r14, qword ptr [rsp + 0x30]
0x140148cf2: 4983fe07                 cmp      r14, 7
0x140148cf6: 7513                     jne      0x140148d0b
0x140148cf8: 4d8bc6                   mov      r8, r14
0x140148cfb: 488d151e241f00           lea      rdx, [rip + 0x1f241e] ; 'PageCRC'
0x140148d02: e8ff1f1b00               call     0x1402fad06
0x140148d07: 85c0                     test     eax, eax
0x140148d09: 7446                     je       0x140148d51
0x140148d0b: 488d542420               lea      rdx, [rsp + 0x20]
0x140148d10: 4883fe10                 cmp      rsi, 0x10
0x140148d14: 480f43d7                 cmovae   rdx, rdi
0x140148d18: 4983fe06                 cmp      r14, 6
0x140148d1c: 0f858b000000             jne      0x140148dad
0x140148d22: 33c9                     xor      ecx, ecx
0x140148d24: 4c8d05ed231f00           lea      r8, [rip + 0x1f23ed] ; 'nv_CRC'
0x140148d2b: 0f1f440000               nop      dword ptr [rax + rax]
0x140148d30: 0fb6040a                 movzx    eax, byte ptr [rdx + rcx]
0x140148d34: 48ffc1                   inc      rcx
0x140148d37: 413a4408ff               cmp      al, byte ptr [r8 + rcx - 1]
0x140148d3c: 750a                     jne      0x140148d48
0x140148d3e: 4883f906                 cmp      rcx, 6
0x140148d42: 75ec                     jne      0x140148d30
0x140148d44: 33c0                     xor      eax, eax
0x140148d46: eb05                     jmp      0x140148d4d
0x140148d48: 1bc0                     sbb      eax, eax
0x140148d4a: 83c801                   or       eax, 1
0x140148d4d: 85c0                     test     eax, eax
0x140148d4f: 755c                     jne      0x140148dad
0x140148d51: 498d8d98020000           lea      rcx, [r13 + 0x298]
0x140148d58: 488d45a7                 lea      rax, [rbp - 0x59]
0x140148d5c: 483bc8                   cmp      rcx, rax
0x140148d5f: 7426                     je       0x140148d87
0x140148d61: 488d55a7                 lea      rdx, [rbp - 0x59]
0x140148d65: 48837dbf10               cmp      qword ptr [rbp - 0x41], 0x10
0x140148d6a: 480f4355a7               cmovae   rdx, qword ptr [rbp - 0x59]
0x140148d6f: 4c8b45b7                 mov      r8, qword ptr [rbp - 0x49]
0x140148d73: e878c0ecff               call     0x140014df0
0x140148d78: 488b742438               mov      rsi, qword ptr [rsp + 0x38]
0x140148d7d: 4c8b742430               mov      r14, qword ptr [rsp + 0x30]
0x140148d82: 488b7c2420               mov      rdi, qword ptr [rsp + 0x20]
0x140148d87: 498d8db8020000           lea      rcx, [r13 + 0x2b8]
0x140148d8e: 488d442420               lea      rax, [rsp + 0x20]
0x140148d93: 483bc8                   cmp      rcx, rax
0x140148d96: 7415                     je       0x140148dad
0x140148d98: 488d542420               lea      rdx, [rsp + 0x20]
0x140148d9d: 4883fe10                 cmp      rsi, 0x10
0x140148da1: 480f43d7                 cmovae   rdx, rdi
0x140148da5: 4d8bc6                   mov      r8, r14
0x140148da8: e843c0ecff               call     0x140014df0
0x140148dad: 4c8d3550e51d00           lea      r14, [rip + 0x1de550] ; 'type'
0x140148db4: 488d3529262000           lea      rsi, [rip + 0x202629] ; 'value'
0x140148dbb: 488d3d56262000           lea      rdi, [rip + 0x202656] ; 'note'
0x140148dc2: 33c9                     xor      ecx, ecx
0x140148dc4: 488d153d262000           lea      rdx, [rip + 0x20263d] ; 'length'
0x140148dcb: 0f1f440000               nop      dword ptr [rax + rax]
0x140148dd0: 0fb6040b                 movzx    eax, byte ptr [rbx + rcx]
0x140148dd4: 48ffc1                   inc      rcx
0x140148dd7: 3a440aff                 cmp      al, byte ptr [rdx + rcx - 1]
0x140148ddb: 751a                     jne      0x140148df7
0x140148ddd: 4883f907                 cmp      rcx, 7
0x140148de1: 75ed                     jne      0x140148dd0
0x140148de3: 498bcf                   mov      rcx, r15
0x140148de6: e845beffff               call     0x140144c30
0x140148deb: 488bc8                   mov      rcx, rax
0x140148dee: ff15dc441d00             call     qword ptr [rip + 0x1d44dc] ; api-ms-win-crt-convert-l1-1-0.dll:atoi
0x140148df4: 894507                   mov      dword ptr [rbp + 7], eax
0x140148df7: 33c9                     xor      ecx, ecx
0x140148df9: 488d1510262000           lea      rdx, [rip + 0x202610] ; 'range'
0x140148e00: 0fb6040b                 movzx    eax, byte ptr [rbx + rcx]
0x140148e04: 48ffc1                   inc      rcx
0x140148e07: 3a440aff                 cmp      al, byte ptr [rdx + rcx - 1]
0x140148e0b: 752b                     jne      0x140148e38
0x140148e0d: 4883f906                 cmp      rcx, 6
0x140148e11: 75ed                     jne      0x140148e00
0x140148e13: 498bcf                   mov      rcx, r15
0x140148e16: e815beffff               call     0x140144c30
0x140148e1b: 49c7c0ffffffff           mov      r8, -1
0x140148e22: 49ffc0                   inc      r8
0x140148e25: 42803c0000               cmp      byte ptr [rax + r8], 0
0x140148e2a: 75f6                     jne      0x140148e22
0x140148e2c: 488bd0                   mov      rdx, rax
0x140148e2f: 488d4dc7                 lea      rcx, [rbp - 0x39]
0x140148e33: e8b8bfecff               call     0x140014df0
0x140148e38: 33c0                     xor      eax, eax
0x140148e3a: 660f1f440000             nop      word ptr [rax + rax]
0x140148e40: 0fb60c03                 movzx    ecx, byte ptr [rbx + rax]
0x140148e44: 48ffc0                   inc      rax
0x140148e47: 3a4c07ff                 cmp      cl, byte ptr [rdi + rax - 1]
0x140148e4b: 752b                     jne      0x140148e78
0x140148e4d: 4883f805                 cmp      rax, 5
0x140148e51: 75ed                     jne      0x140148e40
0x140148e53: 498bcf                   mov      rcx, r15
0x140148e56: e8d5bdffff               call     0x140144c30
0x140148e5b: 49c7c0ffffffff           mov      r8, -1
0x140148e62: 49ffc0                   inc      r8
0x140148e65: 42803c0000               cmp      byte ptr [rax + r8], 0
0x140148e6a: 75f6                     jne      0x140148e62
0x140148e6c: 488bd0                   mov      rdx, rax
0x140148e6f: 488d4de7                 lea      rcx, [rbp - 0x19]
0x140148e73: e878bfecff               call     0x140014df0
0x140148e78: 4d8b7f40                 mov      r15, qword ptr [r15 + 0x40]
0x140148e7c: 4d85ff                   test     r15, r15
0x140148e7f: 0f8560fdffff             jne      0x140148be5
0x140148e85: 498b8540020000           mov      rax, qword ptr [r13 + 0x240]
0x140148e8c: 493b8548020000           cmp      rax, qword ptr [r13 + 0x248]
0x140148e93: 741a                     je       0x140148eaf
0x140148e95: 488d542420               lea      rdx, [rsp + 0x20]
0x140148e9a: 488bc8                   mov      rcx, rax
0x140148e9d: e88eecffff               call     0x140147b30
0x140148ea2: 49818540020000a8000000   add      qword ptr [r13 + 0x240], 0xa8
0x140148ead: eb14                     jmp      0x140148ec3
0x140148eaf: 4c8d442420               lea      r8, [rsp + 0x20]
0x140148eb4: 488bd0                   mov      rdx, rax
0x140148eb7: 498d8d38020000           lea      rcx, [r13 + 0x238]
0x140148ebe: e8cde5ffff               call     0x140147490
0x140148ec3: 49837c243800             cmp      qword ptr [r12 + 0x38], 0
0x140148ec9: 7415                     je       0x140148ee0
0x140148ecb: 33d2                     xor      edx, edx
0x140148ecd: 498bcc                   mov      rcx, r12
0x140148ed0: e83b8dffff               call     0x140141c10
0x140148ed5: 488bd0                   mov      rdx, rax
0x140148ed8: 498bcd                   mov      rcx, r13
0x140148edb: e8e0fbffff               call     0x140148ac0
0x140148ee0: 33d2                     xor      edx, edx
0x140148ee2: 498bcc                   mov      rcx, r12
0x140148ee5: e8c696ffff               call     0x1401425b0
0x140148eea: 4c8be0                   mov      r12, rax
0x140148eed: 488b55ff                 mov      rdx, qword ptr [rbp - 1]
0x140148ef1: 4883fa10                 cmp      rdx, 0x10
0x140148ef5: 7231                     jb       0x140148f28
0x140148ef7: 48ffc2                   inc      rdx
0x140148efa: 488b4de7                 mov      rcx, qword ptr [rbp - 0x19]
0x140148efe: 488bc1                   mov      rax, rcx
0x140148f01: 4881fa00100000           cmp      rdx, 0x1000
0x140148f08: 7219                     jb       0x140148f23
0x140148f0a: 4883c227                 add      rdx, 0x27
0x140148f0e: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x140148f12: 482bc1                   sub      rax, rcx
0x140148f15: 4883c0f8                 add      rax, -8
0x140148f19: 4883f81f                 cmp      rax, 0x1f
0x140148f1d: 0f871b010000             ja       0x14014903e
0x140148f23: e82c091b00               call     0x1402f9854
0x140148f28: 488b55df                 mov      rdx, qword ptr [rbp - 0x21]
0x140148f2c: 4883fa10                 cmp      rdx, 0x10
0x140148f30: 7231                     jb       0x140148f63
0x140148f32: 48ffc2                   inc      rdx
0x140148f35: 488b4dc7                 mov      rcx, qword ptr [rbp - 0x39]
0x140148f39: 488bc1                   mov      rax, rcx
0x140148f3c: 4881fa00100000           cmp      rdx, 0x1000
0x140148f43: 7219                     jb       0x140148f5e
0x140148f45: 4883c227                 add      rdx, 0x27
0x140148f49: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x140148f4d: 482bc1                   sub      rax, rcx
0x140148f50: 4883c0f8                 add      rax, -8
0x140148f54: 4883f81f                 cmp      rax, 0x1f
0x140148f58: 0f87e0000000             ja       0x14014903e
0x140148f5e: e8f1081b00               call     0x1402f9854
0x140148f63: 488b55bf                 mov      rdx, qword ptr [rbp - 0x41]
0x140148f67: 4883fa10                 cmp      rdx, 0x10
0x140148f6b: 7231                     jb       0x140148f9e
0x140148f6d: 48ffc2                   inc      rdx
0x140148f70: 488b4da7                 mov      rcx, qword ptr [rbp - 0x59]
0x140148f74: 488bc1                   mov      rax, rcx
0x140148f77: 4881fa00100000           cmp      rdx, 0x1000
0x140148f7e: 7219                     jb       0x140148f99
0x140148f80: 4883c227                 add      rdx, 0x27
0x140148f84: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x140148f88: 482bc1                   sub      rax, rcx
0x140148f8b: 4883c0f8                 add      rax, -8
0x140148f8f: 4883f81f                 cmp      rax, 0x1f
0x140148f93: 0f87a5000000             ja       0x14014903e
0x140148f99: e8b6081b00               call     0x1402f9854
0x140148f9e: 488b559f                 mov      rdx, qword ptr [rbp - 0x61]
0x140148fa2: 4883fa10                 cmp      rdx, 0x10
0x140148fa6: 722d                     jb       0x140148fd5
0x140148fa8: 48ffc2                   inc      rdx
0x140148fab: 488b4d87                 mov      rcx, qword ptr [rbp - 0x79]
0x140148faf: 488bc1                   mov      rax, rcx
0x140148fb2: 4881fa00100000           cmp      rdx, 0x1000
0x140148fb9: 7215                     jb       0x140148fd0
0x140148fbb: 4883c227                 add      rdx, 0x27
0x140148fbf: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x140148fc3: 482bc1                   sub      rax, rcx
0x140148fc6: 4883c0f8                 add      rax, -8
0x140148fca: 4883f81f                 cmp      rax, 0x1f
0x140148fce: 776e                     ja       0x14014903e
0x140148fd0: e87f081b00               call     0x1402f9854
0x140148fd5: 488b542438               mov      rdx, qword ptr [rsp + 0x38]
0x140148fda: 4883fa10                 cmp      rdx, 0x10
0x140148fde: 722e                     jb       0x14014900e
0x140148fe0: 48ffc2                   inc      rdx
0x140148fe3: 488b4c2420               mov      rcx, qword ptr [rsp + 0x20]
0x140148fe8: 488bc1                   mov      rax, rcx
0x140148feb: 4881fa00100000           cmp      rdx, 0x1000
0x140148ff2: 7215                     jb       0x140149009
0x140148ff4: 4883c227                 add      rdx, 0x27
0x140148ff8: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x140148ffc: 482bc1                   sub      rax, rcx
0x140148fff: 4883c0f8                 add      rax, -8
0x140149003: 4883f81f                 cmp      rax, 0x1f
0x140149007: 7735                     ja       0x14014903e
0x140149009: e846081b00               call     0x1402f9854
0x14014900e: 4d85e4                   test     r12, r12
0x140149011: 0f85f9faffff             jne      0x140148b10
0x140149017: 488b4d17                 mov      rcx, qword ptr [rbp + 0x17]
0x14014901b: 4833cc                   xor      rcx, rsp
0x14014901e: e82d0e1b00               call     0x1402f9e50
0x140149023: 488b9c2430010000         mov      rbx, qword ptr [rsp + 0x130]
0x14014902b: 4881c4e0000000           add      rsp, 0xe0
0x140149032: 415f                     pop      r15
0x140149034: 415e                     pop      r14
0x140149036: 415d                     pop      r13
0x140149038: 415c                     pop      r12
0x14014903a: 5f                       pop      rdi
0x14014903b: 5e                       pop      rsi
0x14014903c: 5d                       pop      rbp
0x14014903d: c3                       ret
0x14014903e: ff155c431d00             call     qword ptr [rip + 0x1d435c] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x140149044: cc                       int3
