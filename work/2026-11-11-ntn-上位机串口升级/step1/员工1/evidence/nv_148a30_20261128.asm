FUNCTION 0x140148a30 .. 0x140148ab3
0x140148a30: 48895c2418               mov      qword ptr [rsp + 0x18], rbx
0x140148a35: 4889742420               mov      qword ptr [rsp + 0x20], rsi
0x140148a3a: 57                       push     rdi
0x140148a3b: 4883ec20                 sub      rsp, 0x20
0x140148a3f: 8b9980020000             mov      ebx, dword ptr [rcx + 0x280]
0x140148a45: 488bf1                   mov      rsi, rcx
0x140148a48: 8bb984020000             mov      edi, dword ptr [rcx + 0x284]
0x140148a4e: 03fb                     add      edi, ebx
0x140148a50: 3bdf                     cmp      ebx, edi
0x140148a52: 7338                     jae      0x140148a8c
0x140148a54: 0f1f4000                 nop      dword ptr [rax]
0x140148a58: 0f1f840000000000         nop      dword ptr [rax + rax]
0x140148a60: 4c8d442430               lea      r8, [rsp + 0x30]
0x140148a65: 895c2430                 mov      dword ptr [rsp + 0x30], ebx
0x140148a69: 488d542438               lea      rdx, [rsp + 0x38]
0x140148a6e: c744243820000000         mov      dword ptr [rsp + 0x38], 0x20
0x140148a76: 488bce                   mov      rcx, rsi
0x140148a79: e8e243ffff               call     0x14013ce60
0x140148a7e: 3c01                     cmp      al, 1
0x140148a80: 751c                     jne      0x140148a9e
0x140148a82: 81c300100000             add      ebx, 0x1000
0x140148a88: 3bdf                     cmp      ebx, edi
0x140148a8a: 72d4                     jb       0x140148a60
0x140148a8c: 33c0                     xor      eax, eax
0x140148a8e: 488b5c2440               mov      rbx, qword ptr [rsp + 0x40]
0x140148a93: 488b742448               mov      rsi, qword ptr [rsp + 0x48]
0x140148a98: 4883c420                 add      rsp, 0x20
0x140148a9c: 5f                       pop      rdi
0x140148a9d: c3                       ret
0x140148a9e: 488b5c2440               mov      rbx, qword ptr [rsp + 0x40]
0x140148aa3: b8ae860100               mov      eax, 0x186ae
0x140148aa8: 488b742448               mov      rsi, qword ptr [rsp + 0x48]
0x140148aad: 4883c420                 add      rsp, 0x20
0x140148ab1: 5f                       pop      rdi
0x140148ab2: c3                       ret
