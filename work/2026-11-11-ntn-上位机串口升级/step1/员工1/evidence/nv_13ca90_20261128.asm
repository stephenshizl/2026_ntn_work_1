FUNCTION 0x14013ca90 .. 0x14013cdfa
0x14013ca90: 48895c2418               mov      qword ptr [rsp + 0x18], rbx
0x14013ca95: 55                       push     rbp
0x14013ca96: 56                       push     rsi
0x14013ca97: 57                       push     rdi
0x14013ca98: 4154                     push     r12
0x14013ca9a: 4155                     push     r13
0x14013ca9c: 4156                     push     r14
0x14013ca9e: 4157                     push     r15
0x14013caa0: 488dac2420ecffff         lea      rbp, [rsp - 0x13e0]
0x14013caa8: b8e0140000               mov      eax, 0x14e0
0x14013caad: e88ed61b00               call     0x1402fa140
0x14013cab2: 482be0                   sub      rsp, rax
0x14013cab5: 488b052c8c3a00           mov      rax, qword ptr [rip + 0x3a8c2c]
0x14013cabc: 4833c4                   xor      rax, rsp
0x14013cabf: 488985d0130000           mov      qword ptr [rbp + 0x13d0], rax
0x14013cac6: 4c8be2                   mov      r12, rdx
0x14013cac9: 4c8bf9                   mov      r15, rcx
0x14013cacc: 0f57c0                   xorps    xmm0, xmm0
0x14013cacf: f30f7f442440             movdqu   xmmword ptr [rsp + 0x40], xmm0
0x14013cad5: 4533ed                   xor      r13d, r13d
0x14013cad8: 4c896c2450               mov      qword ptr [rsp + 0x50], r13
0x14013cadd: 660f6f054bdb2000         movdqa   xmm0, xmmword ptr [rip + 0x20db4b]
0x14013cae5: f30f7f4598               movdqu   xmmword ptr [rbp - 0x68], xmm0
0x14013caea: 660f6f0d4edb2000         movdqa   xmm1, xmmword ptr [rip + 0x20db4e]
0x14013caf2: f30f7f4da8               movdqu   xmmword ptr [rbp - 0x58], xmm1
0x14013caf7: 660f6f0551db2000         movdqa   xmm0, xmmword ptr [rip + 0x20db51]
0x14013caff: f30f7f45b8               movdqu   xmmword ptr [rbp - 0x48], xmm0
0x14013cb04: c745c800093d00           mov      dword ptr [rbp - 0x38], 0x3d0900
0x14013cb0b: 418d550d                 lea      edx, [r13 + 0xd]
0x14013cb0f: 488d4c2440               lea      rcx, [rsp + 0x40]
0x14013cb14: e877190000               call     0x14013e490
0x14013cb19: 458d4534                 lea      r8d, [r13 + 0x34]
0x14013cb1d: 488d5598                 lea      rdx, [rbp - 0x68]
0x14013cb21: 488b7c2440               mov      rdi, qword ptr [rsp + 0x40]
0x14013cb26: 488bcf                   mov      rcx, rdi
0x14013cb29: e8dee11b00               call     0x1402fad0c
0x14013cb2e: 4c8d4f34                 lea      r9, [rdi + 0x34]
0x14013cb32: 4c894c2448               mov      qword ptr [rsp + 0x48], r9
0x14013cb37: 418bdd                   mov      ebx, r13d
0x14013cb3a: 458b0424                 mov      r8d, dword ptr [r12]
0x14013cb3e: 488bd7                   mov      rdx, rdi
0x14013cb41: 443902                   cmp      dword ptr [rdx], r8d
0x14013cb44: 7460                     je       0x14013cba6
0x14013cb46: ffc3                     inc      ebx
0x14013cb48: 4883c204                 add      rdx, 4
0x14013cb4c: 498bc9                   mov      rcx, r9
0x14013cb4f: 482bcf                   sub      rcx, rdi
0x14013cb52: 48c1f902                 sar      rcx, 2
0x14013cb56: 4863c3                   movsxd   rax, ebx
0x14013cb59: 483bc1                   cmp      rax, rcx
0x14013cb5c: 72e3                     jb       0x14013cb41
0x14013cb5e: 4032f6                   xor      sil, sil
0x14013cb61: 4885ff                   test     rdi, rdi
0x14013cb64: 0f8422020000             je       0x14013cd8c
0x14013cb6a: 488b542450               mov      rdx, qword ptr [rsp + 0x50]
0x14013cb6f: 482bd7                   sub      rdx, rdi
0x14013cb72: 4883e2fc                 and      rdx, 0xfffffffffffffffc
0x14013cb76: 488bc7                   mov      rax, rdi
0x14013cb79: 4881fa00100000           cmp      rdx, 0x1000
0x14013cb80: 0f82fe010000             jb       0x14013cd84
0x14013cb86: 4883c227                 add      rdx, 0x27
0x14013cb8a: 488b7ff8                 mov      rdi, qword ptr [rdi - 8]
0x14013cb8e: 482bc7                   sub      rax, rdi
0x14013cb91: 4883c0f8                 add      rax, -8
0x14013cb95: 4883f81f                 cmp      rax, 0x1f
0x14013cb99: 0f86e5010000             jbe      0x14013cd84
0x14013cb9f: ff15fb071e00             call     qword ptr [rip + 0x1e07fb] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14013cba5: 90                       nop
0x14013cba6: 83fbff                   cmp      ebx, -1
0x14013cba9: 74b3                     je       0x14013cb5e
0x14013cbab: 4181f800e10000           cmp      r8d, 0xe100
0x14013cbb2: 7423                     je       0x14013cbd7
0x14013cbb4: c744243808000000         mov      dword ptr [rsp + 0x38], 8
0x14013cbbc: c644243055               mov      byte ptr [rsp + 0x30], 0x55
0x14013cbc1: 4c8d442438               lea      r8, [rsp + 0x38]
0x14013cbc6: 488d542430               lea      rdx, [rsp + 0x30]
0x14013cbcb: 498bcf                   mov      rcx, r15
0x14013cbce: e83d080000               call     0x14013d410
0x14013cbd3: 84c0                     test     al, al
0x14013cbd5: 7487                     je       0x14013cb5e
0x14013cbd7: c644243050               mov      byte ptr [rsp + 0x30], 0x50
0x14013cbdc: 885c2431                 mov      byte ptr [rsp + 0x31], bl
0x14013cbe0: 4c896d98                 mov      qword ptr [rbp - 0x68], r13
0x14013cbe4: 48c745b00f000000         mov      qword ptr [rbp - 0x50], 0xf
0x14013cbec: 48c745a802000000         mov      qword ptr [rbp - 0x58], 2
0x14013cbf4: 0fb7442430               movzx    eax, word ptr [rsp + 0x30]
0x14013cbf9: 66894598                 mov      word ptr [rbp - 0x68], ax
0x14013cbfd: c6459a00                 mov      byte ptr [rbp - 0x66], 0
0x14013cc01: 0f104598                 movups   xmm0, xmmword ptr [rbp - 0x68]
0x14013cc05: 0f11442458               movups   xmmword ptr [rsp + 0x58], xmm0
0x14013cc0a: 48c744246802000000       mov      qword ptr [rsp + 0x68], 2
0x14013cc13: 48c74424700f000000       mov      qword ptr [rsp + 0x70], 0xf
0x14013cc1c: b2ff                     mov      dl, 0xff
0x14013cc1e: 418bc5                   mov      eax, r13d
0x14013cc21: 498bcd                   mov      rcx, r13
0x14013cc24: 0f1f4000                 nop      dword ptr [rax]
0x14013cc28: 0f1f840000000000         nop      dword ptr [rax + rax]
0x14013cc30: 32540c58                 xor      dl, byte ptr [rsp + rcx + 0x58]
0x14013cc34: ffc0                     inc      eax
0x14013cc36: 8bc8                     mov      ecx, eax
0x14013cc38: 4883f902                 cmp      rcx, 2
0x14013cc3c: 72f2                     jb       0x14013cc30
0x14013cc3e: 48c744246803000000       mov      qword ptr [rsp + 0x68], 3
0x14013cc47: 8854245a                 mov      byte ptr [rsp + 0x5a], dl
0x14013cc4b: c644245b00               mov      byte ptr [rsp + 0x5b], 0
0x14013cc50: 41b803000000             mov      r8d, 3
0x14013cc56: 488d542458               lea      rdx, [rsp + 0x58]
0x14013cc5b: 418b0f                   mov      ecx, dword ptr [r15]
0x14013cc5e: e82d0d0000               call     0x14013d990
0x14013cc63: 84c0                     test     al, al
0x14013cc65: 7439                     je       0x14013cca0
0x14013cc67: 33d2                     xor      edx, edx
0x14013cc69: 41b800140000             mov      r8d, 0x1400
0x14013cc6f: 488d4dd0                 lea      rcx, [rbp - 0x30]
0x14013cc73: e89ae01b00               call     0x1402fad12
0x14013cc78: 44896c2438               mov      dword ptr [rsp + 0x38], r13d
0x14013cc7d: c744242008000000         mov      dword ptr [rsp + 0x20], 8
0x14013cc85: 41b9b80b0000             mov      r9d, 0xbb8
0x14013cc8b: 4c8d442438               lea      r8, [rsp + 0x38]
0x14013cc90: 488d55d0                 lea      rdx, [rbp - 0x30]
0x14013cc94: 418b0f                   mov      ecx, dword ptr [r15]
0x14013cc97: e8d40d0000               call     0x14013da70
0x14013cc9c: 85c0                     test     eax, eax
0x14013cc9e: 7441                     je       0x14013cce1
0x14013cca0: 488b542470               mov      rdx, qword ptr [rsp + 0x70]
0x14013cca5: 4883fa10                 cmp      rdx, 0x10
0x14013cca9: 722e                     jb       0x14013ccd9
0x14013ccab: 48ffc2                   inc      rdx
0x14013ccae: 488b4c2458               mov      rcx, qword ptr [rsp + 0x58]
0x14013ccb3: 4881fa00100000           cmp      rdx, 0x1000
0x14013ccba: 488bc1                   mov      rax, rcx
0x14013ccbd: 7215                     jb       0x14013ccd4
0x14013ccbf: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14013ccc3: 482bc1                   sub      rax, rcx
0x14013ccc6: 4883c227                 add      rdx, 0x27
0x14013ccca: 4883c0f8                 add      rax, -8
0x14013ccce: 4883f81f                 cmp      rax, 0x1f
0x14013ccd2: 7741                     ja       0x14013cd15
0x14013ccd4: e87bcb1b00               call     0x1402f9854
0x14013ccd9: 4032f6                   xor      sil, sil
0x14013ccdc: e99e000000               jmp      0x14013cd7f
0x14013cce1: 488b542470               mov      rdx, qword ptr [rsp + 0x70]
0x14013cce6: 4883fa10                 cmp      rdx, 0x10
0x14013ccea: 7235                     jb       0x14013cd21
0x14013ccec: 48ffc2                   inc      rdx
0x14013ccef: 488b4c2458               mov      rcx, qword ptr [rsp + 0x58]
0x14013ccf4: 488bc1                   mov      rax, rcx
0x14013ccf7: 4881fa00100000           cmp      rdx, 0x1000
0x14013ccfe: 721c                     jb       0x14013cd1c
0x14013cd00: 4883c227                 add      rdx, 0x27
0x14013cd04: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14013cd08: 482bc1                   sub      rax, rcx
0x14013cd0b: 4883c0f8                 add      rax, -8
0x14013cd0f: 4883f81f                 cmp      rax, 0x1f
0x14013cd13: 7607                     jbe      0x14013cd1c
0x14013cd15: ff1585061e00             call     qword ptr [rip + 0x1e0685] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14013cd1b: cc                       int3
0x14013cd1c: e833cb1b00               call     0x1402f9854
0x14013cd21: 418bdd                   mov      ebx, r13d
0x14013cd24: 8b0d86473b00             mov      ecx, dword ptr [rip + 0x3b4786]
0x14013cd2a: 65488b042558000000       mov      rax, qword ptr gs:[0x58]
0x14013cd33: ba68010000               mov      edx, 0x168
0x14013cd38: 4c8b34c8                 mov      r14, qword ptr [rax + rcx*8]
0x14013cd3c: 4c03f2                   add      r14, rdx
0x14013cd3f: 90                       nop
0x14013cd40: b9f4010000               mov      ecx, 0x1f4
0x14013cd45: e876cfffff               call     0x140139cc0
0x14013cd4a: 418b06                   mov      eax, dword ptr [r14]
0x14013cd4d: 390585143b00             cmp      dword ptr [rip + 0x3b1485], eax
0x14013cd53: 7f65                     jg       0x14013cdba
0x14013cd55: 4c896d90                 mov      qword ptr [rbp - 0x70], r13
0x14013cd59: 4c8d4c2458               lea      r9, [rsp + 0x58]
0x14013cd5e: 458b0424                 mov      r8d, dword ptr [r12]
0x14013cd62: 498bd7                   mov      rdx, r15
0x14013cd65: 488d0d04143b00           lea      rcx, [rip + 0x3b1404]
0x14013cd6c: e8ef2e0000               call     0x14013fc60
0x14013cd71: 0fb6f0                   movzx    esi, al
0x14013cd74: 84c0                     test     al, al
0x14013cd76: 7507                     jne      0x14013cd7f
0x14013cd78: ffc3                     inc      ebx
0x14013cd7a: 83fb05                   cmp      ebx, 5
0x14013cd7d: 7cc1                     jl       0x14013cd40
0x14013cd7f: e9ddfdffff               jmp      0x14013cb61
0x14013cd84: 488bcf                   mov      rcx, rdi
0x14013cd87: e8c8ca1b00               call     0x1402f9854
0x14013cd8c: 400fb6c6                 movzx    eax, sil
0x14013cd90: 488b8dd0130000           mov      rcx, qword ptr [rbp + 0x13d0]
0x14013cd97: 4833cc                   xor      rcx, rsp
0x14013cd9a: e8b1d01b00               call     0x1402f9e50
0x14013cd9f: 488b9c2430150000         mov      rbx, qword ptr [rsp + 0x1530]
0x14013cda7: 4881c4e0140000           add      rsp, 0x14e0
0x14013cdae: 415f                     pop      r15
0x14013cdb0: 415e                     pop      r14
0x14013cdb2: 415d                     pop      r13
0x14013cdb4: 415c                     pop      r12
0x14013cdb6: 5f                       pop      rdi
0x14013cdb7: 5e                       pop      rsi
0x14013cdb8: 5d                       pop      rbp
0x14013cdb9: c3                       ret
0x14013cdba: 488d0d17143b00           lea      rcx, [rip + 0x3b1417]
0x14013cdc1: e86ece1b00               call     0x1402f9c34
0x14013cdc6: 833d0b143b00ff           cmp      dword ptr [rip + 0x3b140b], -1
0x14013cdcd: 7586                     jne      0x14013cd55
0x14013cdcf: 488d0d9a133b00           lea      rcx, [rip + 0x3b139a]
0x14013cdd6: e8052a0000               call     0x14013f7e0
0x14013cddb: 488d0d8e771d00           lea      rcx, [rip + 0x1d778e]
0x14013cde2: e8adcc1b00               call     0x1402f9a94
0x14013cde7: 90                       nop
0x14013cde8: 488d0de9133b00           lea      rcx, [rip + 0x3b13e9]
0x14013cdef: e8e0cd1b00               call     0x1402f9bd4
0x14013cdf4: e95cffffff               jmp      0x14013cd55
0x14013cdf9: cc                       int3
