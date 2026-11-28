FUNCTION 0x14014a2e0 .. 0x14014a4dd
0x14014a2e0: 48895c2408               mov      qword ptr [rsp + 8], rbx
0x14014a2e5: 56                       push     rsi
0x14014a2e6: 57                       push     rdi
0x14014a2e7: 4156                     push     r14
0x14014a2e9: 4883ec60                 sub      rsp, 0x60
0x14014a2ed: 488b05f4b33900           mov      rax, qword ptr [rip + 0x39b3f4]
0x14014a2f4: 4833c4                   xor      rax, rsp
0x14014a2f7: 4889442450               mov      qword ptr [rsp + 0x50], rax
0x14014a2fc: 4d8bf1                   mov      r14, r9
0x14014a2ff: 498bd8                   mov      rbx, r8
0x14014a302: 488bfa                   mov      rdi, rdx
0x14014a305: 4889542428               mov      qword ptr [rsp + 0x28], rdx
0x14014a30a: 488d4c2430               lea      rcx, [rsp + 0x30]
0x14014a30f: e8ec8cecff               call     0x140013000
0x14014a314: 488d542430               lea      rdx, [rsp + 0x30]
0x14014a319: 48837c244810             cmp      qword ptr [rsp + 0x48], 0x10
0x14014a31f: 480f43542430             cmovae   rdx, qword ptr [rsp + 0x30]
0x14014a325: 4c8d0528012000           lea      r8, [rip + 0x200128]
0x14014a32c: 488d4c2420               lea      rcx, [rsp + 0x20]
0x14014a331: ff1551311d00             call     qword ptr [rip + 0x1d3151] ; api-ms-win-crt-stdio-l1-1-0.dll:fopen_s
0x14014a337: 85c0                     test     eax, eax
0x14014a339: 0f8498000000             je       0x14014a3d7
0x14014a33f: 488b542448               mov      rdx, qword ptr [rsp + 0x48]
0x14014a344: 4883fa10                 cmp      rdx, 0x10
0x14014a348: 7232                     jb       0x14014a37c
0x14014a34a: 48ffc2                   inc      rdx
0x14014a34d: 488b4c2430               mov      rcx, qword ptr [rsp + 0x30]
0x14014a352: 488bc1                   mov      rax, rcx
0x14014a355: 4881fa00100000           cmp      rdx, 0x1000
0x14014a35c: 7219                     jb       0x14014a377
0x14014a35e: 4883c227                 add      rdx, 0x27
0x14014a362: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14014a366: 482bc1                   sub      rax, rcx
0x14014a369: 4883c0f8                 add      rax, -8
0x14014a36d: 4883f81f                 cmp      rax, 0x1f
0x14014a371: 0f87d3000000             ja       0x14014a44a
0x14014a377: e8d8f41a00               call     0x1402f9854
0x14014a37c: 48c744244000000000       mov      qword ptr [rsp + 0x40], 0
0x14014a385: 48c74424480f000000       mov      qword ptr [rsp + 0x48], 0xf
0x14014a38e: c644243000               mov      byte ptr [rsp + 0x30], 0
0x14014a393: 488b5718                 mov      rdx, qword ptr [rdi + 0x18]
0x14014a397: 4883fa10                 cmp      rdx, 0x10
0x14014a39b: 7230                     jb       0x14014a3cd
0x14014a39d: 48ffc2                   inc      rdx
0x14014a3a0: 488b0f                   mov      rcx, qword ptr [rdi]
0x14014a3a3: 4881fa00100000           cmp      rdx, 0x1000
0x14014a3aa: 721c                     jb       0x14014a3c8
0x14014a3ac: 4883c227                 add      rdx, 0x27
0x14014a3b0: 4c8b41f8                 mov      r8, qword ptr [rcx - 8]
0x14014a3b4: 492bc8                   sub      rcx, r8
0x14014a3b7: 488d41f8                 lea      rax, [rcx - 8]
0x14014a3bb: 4883f81f                 cmp      rax, 0x1f
0x14014a3bf: 0f8711010000             ja       0x14014a4d6
0x14014a3c5: 498bc8                   mov      rcx, r8
0x14014a3c8: e887f41a00               call     0x1402f9854
0x14014a3cd: b86b000000               mov      eax, 0x6b
0x14014a3d2: e9ce000000               jmp      0x14014a4a5
0x14014a3d7: 33f6                     xor      esi, esi
0x14014a3d9: 488b4c2420               mov      rcx, qword ptr [rsp + 0x20]
0x14014a3de: ff156c301d00             call     qword ptr [rip + 0x1d306c] ; api-ms-win-crt-stdio-l1-1-0.dll:fgetc
0x14014a3e4: 83f8ff                   cmp      eax, -1
0x14014a3e7: 741f                     je       0x14014a408
0x14014a3e9: 0f1f8000000000           nop      dword ptr [rax]
0x14014a3f0: 8803                     mov      byte ptr [rbx], al
0x14014a3f2: ffc6                     inc      esi
0x14014a3f4: 488d5b01                 lea      rbx, [rbx + 1]
0x14014a3f8: 488b4c2420               mov      rcx, qword ptr [rsp + 0x20]
0x14014a3fd: ff154d301d00             call     qword ptr [rip + 0x1d304d] ; api-ms-win-crt-stdio-l1-1-0.dll:fgetc
0x14014a403: 83f8ff                   cmp      eax, -1
0x14014a406: 75e8                     jne      0x14014a3f0
0x14014a408: 418936                   mov      dword ptr [r14], esi
0x14014a40b: 488b4c2420               mov      rcx, qword ptr [rsp + 0x20]
0x14014a410: ff156a301d00             call     qword ptr [rip + 0x1d306a] ; api-ms-win-crt-stdio-l1-1-0.dll:fclose
0x14014a416: 488b542448               mov      rdx, qword ptr [rsp + 0x48]
0x14014a41b: 4883fa10                 cmp      rdx, 0x10
0x14014a41f: 7235                     jb       0x14014a456
0x14014a421: 48ffc2                   inc      rdx
0x14014a424: 488b4c2430               mov      rcx, qword ptr [rsp + 0x30]
0x14014a429: 488bc1                   mov      rax, rcx
0x14014a42c: 4881fa00100000           cmp      rdx, 0x1000
0x14014a433: 721c                     jb       0x14014a451
0x14014a435: 4883c227                 add      rdx, 0x27
0x14014a439: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14014a43d: 482bc1                   sub      rax, rcx
0x14014a440: 4883c0f8                 add      rax, -8
0x14014a444: 4883f81f                 cmp      rax, 0x1f
0x14014a448: 7607                     jbe      0x14014a451
0x14014a44a: ff15502f1d00             call     qword ptr [rip + 0x1d2f50] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14014a450: cc                       int3
0x14014a451: e8fef31a00               call     0x1402f9854
0x14014a456: 48c744244000000000       mov      qword ptr [rsp + 0x40], 0
0x14014a45f: 48c74424480f000000       mov      qword ptr [rsp + 0x48], 0xf
0x14014a468: c644243000               mov      byte ptr [rsp + 0x30], 0
0x14014a46d: 488b5718                 mov      rdx, qword ptr [rdi + 0x18]
0x14014a471: 4883fa10                 cmp      rdx, 0x10
0x14014a475: 722c                     jb       0x14014a4a3
0x14014a477: 48ffc2                   inc      rdx
0x14014a47a: 488b0f                   mov      rcx, qword ptr [rdi]
0x14014a47d: 4881fa00100000           cmp      rdx, 0x1000
0x14014a484: 7218                     jb       0x14014a49e
0x14014a486: 4883c227                 add      rdx, 0x27
0x14014a48a: 4c8b41f8                 mov      r8, qword ptr [rcx - 8]
0x14014a48e: 492bc8                   sub      rcx, r8
0x14014a491: 488d41f8                 lea      rax, [rcx - 8]
0x14014a495: 4883f81f                 cmp      rax, 0x1f
0x14014a499: 773b                     ja       0x14014a4d6
0x14014a49b: 498bc8                   mov      rcx, r8
0x14014a49e: e8b1f31a00               call     0x1402f9854
0x14014a4a3: 33c0                     xor      eax, eax
0x14014a4a5: 48c7471000000000         mov      qword ptr [rdi + 0x10], 0
0x14014a4ad: 48c747180f000000         mov      qword ptr [rdi + 0x18], 0xf
0x14014a4b5: c60700                   mov      byte ptr [rdi], 0
0x14014a4b8: 488b4c2450               mov      rcx, qword ptr [rsp + 0x50]
0x14014a4bd: 4833cc                   xor      rcx, rsp
0x14014a4c0: e88bf91a00               call     0x1402f9e50
0x14014a4c5: 488b9c2480000000         mov      rbx, qword ptr [rsp + 0x80]
0x14014a4cd: 4883c460                 add      rsp, 0x60
0x14014a4d1: 415e                     pop      r14
0x14014a4d3: 5f                       pop      rdi
0x14014a4d4: 5e                       pop      rsi
0x14014a4d5: c3                       ret
0x14014a4d6: ff15c42e1d00             call     qword ptr [rip + 0x1d2ec4] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14014a4dc: cc                       int3
