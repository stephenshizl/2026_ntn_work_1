FUNCTION 0x14014ad60 .. 0x14014af74
0x14014ad60: 48895c2410               mov      qword ptr [rsp + 0x10], rbx
0x14014ad65: 48896c2418               mov      qword ptr [rsp + 0x18], rbp
0x14014ad6a: 4889742420               mov      qword ptr [rsp + 0x20], rsi
0x14014ad6f: 57                       push     rdi
0x14014ad70: 4154                     push     r12
0x14014ad72: 4155                     push     r13
0x14014ad74: 4156                     push     r14
0x14014ad76: 4157                     push     r15
0x14014ad78: 4881ec90010000           sub      rsp, 0x190
0x14014ad7f: 488b0562a93900           mov      rax, qword ptr [rip + 0x39a962]
0x14014ad86: 4833c4                   xor      rax, rsp
0x14014ad89: 4889842480010000         mov      qword ptr [rsp + 0x180], rax
0x14014ad91: 4c8be9                   mov      r13, rcx
0x14014ad94: 4881c108020000           add      rcx, 0x208
0x14014ad9b: ff159fe01c00             call     qword ptr [rip + 0x1ce09f] ; Qt5Core.dll:?constData@QByteArray@@QEBAPEBDXZ
0x14014ada1: 488bf8                   mov      rdi, rax
0x14014ada4: 498b9508020000           mov      rdx, qword ptr [r13 + 0x208]
0x14014adab: 8b4204                   mov      eax, dword ptr [rdx + 4]
0x14014adae: 99                       cdq
0x14014adaf: 0fb6d2                   movzx    edx, dl
0x14014adb2: 03c2                     add      eax, edx
0x14014adb4: 8bc8                     mov      ecx, eax
0x14014adb6: 0fb6c0                   movzx    eax, al
0x14014adb9: 2bc2                     sub      eax, edx
0x14014adbb: c1f908                   sar      ecx, 8
0x14014adbe: 4c63f8                   movsxd   r15, eax
0x14014adc1: 418bad80020000           mov      ebp, dword ptr [r13 + 0x280]
0x14014adc8: 448d7101                 lea      r14d, [rcx + 1]
0x14014adcc: 85c0                     test     eax, eax
0x14014adce: 440f44f1                 cmove    r14d, ecx
0x14014add2: 33f6                     xor      esi, esi
0x14014add4: 8bde                     mov      ebx, esi
0x14014add6: 4585f6                   test     r14d, r14d
0x14014add9: 0f8e62010000             jle      0x14014af41
0x14014addf: 458d66ff                 lea      r12d, [r14 - 1]
0x14014ade3: 33d2                     xor      edx, edx
0x14014ade5: 41b82b010000             mov      r8d, 0x12b
0x14014adeb: 488d4c2451               lea      rcx, [rsp + 0x51]
0x14014adf0: e81dff1a00               call     0x1402fad12
0x14014adf5: c644245002               mov      byte ptr [rsp + 0x50], 2
0x14014adfa: 8bcd                     mov      ecx, ebp
0x14014adfc: 488d542451               lea      rdx, [rsp + 0x51]
0x14014ae01: e81abdfeff               call     0x140136b20
0x14014ae06: 413bdc                   cmp      ebx, r12d
0x14014ae09: 7512                     jne      0x14014ae1d
0x14014ae0b: 4d8bc7                   mov      r8, r15
0x14014ae0e: 488bd7                   mov      rdx, rdi
0x14014ae11: 488d4c2455               lea      rcx, [rsp + 0x55]
0x14014ae16: e8d9fe1a00               call     0x1402facf4
0x14014ae1b: eb65                     jmp      0x14014ae82
0x14014ae1d: 488bcf                   mov      rcx, rdi
0x14014ae20: 488d442455               lea      rax, [rsp + 0x55]
0x14014ae25: ba02000000               mov      edx, 2
0x14014ae2a: 660f1f440000             nop      word ptr [rax + rax]
0x14014ae30: 0f1001                   movups   xmm0, xmmword ptr [rcx]
0x14014ae33: 0f1100                   movups   xmmword ptr [rax], xmm0
0x14014ae36: 0f104910                 movups   xmm1, xmmword ptr [rcx + 0x10]
0x14014ae3a: 0f114810                 movups   xmmword ptr [rax + 0x10], xmm1
0x14014ae3e: 0f104120                 movups   xmm0, xmmword ptr [rcx + 0x20]
0x14014ae42: 0f114020                 movups   xmmword ptr [rax + 0x20], xmm0
0x14014ae46: 0f104930                 movups   xmm1, xmmword ptr [rcx + 0x30]
0x14014ae4a: 0f114830                 movups   xmmword ptr [rax + 0x30], xmm1
0x14014ae4e: 0f104140                 movups   xmm0, xmmword ptr [rcx + 0x40]
0x14014ae52: 0f114040                 movups   xmmword ptr [rax + 0x40], xmm0
0x14014ae56: 0f104950                 movups   xmm1, xmmword ptr [rcx + 0x50]
0x14014ae5a: 0f114850                 movups   xmmword ptr [rax + 0x50], xmm1
0x14014ae5e: 0f104160                 movups   xmm0, xmmword ptr [rcx + 0x60]
0x14014ae62: 0f114060                 movups   xmmword ptr [rax + 0x60], xmm0
0x14014ae66: 488d8080000000           lea      rax, [rax + 0x80]
0x14014ae6d: 0f104970                 movups   xmm1, xmmword ptr [rcx + 0x70]
0x14014ae71: 0f1148f0                 movups   xmmword ptr [rax - 0x10], xmm1
0x14014ae75: 488d8980000000           lea      rcx, [rcx + 0x80]
0x14014ae7c: 4883ea01                 sub      rdx, 1
0x14014ae80: 75ae                     jne      0x14014ae30
0x14014ae82: c644242001               mov      byte ptr [rsp + 0x20], 1
0x14014ae87: c744242408000000         mov      dword ptr [rsp + 0x24], 8
0x14014ae8f: 4889742428               mov      qword ptr [rsp + 0x28], rsi
0x14014ae94: 4889742438               mov      qword ptr [rsp + 0x38], rsi
0x14014ae99: 48c74424400f000000       mov      qword ptr [rsp + 0x40], 0xf
0x14014aea2: c644242800               mov      byte ptr [rsp + 0x28], 0
0x14014aea7: 41b805010000             mov      r8d, 0x105
0x14014aead: 488d542450               lea      rdx, [rsp + 0x50]
0x14014aeb2: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014aeb7: e8349fecff               call     0x140014df0
0x14014aebc: 90                       nop
0x14014aebd: 4c8d4c2420               lea      r9, [rsp + 0x20]
0x14014aec2: 4c8d442424               lea      r8, [rsp + 0x24]
0x14014aec7: 488d542428               lea      rdx, [rsp + 0x28]
0x14014aecc: 498bcd                   mov      rcx, r13
0x14014aecf: e87c26ffff               call     0x14013d550
0x14014aed4: 84c0                     test     al, al
0x14014aed6: 400f94c6                 sete     sil
0x14014aeda: 488b542440               mov      rdx, qword ptr [rsp + 0x40]
0x14014aedf: 4883fa10                 cmp      rdx, 0x10
0x14014aee3: 722e                     jb       0x14014af13
0x14014aee5: 48ffc2                   inc      rdx
0x14014aee8: 488b4c2428               mov      rcx, qword ptr [rsp + 0x28]
0x14014aeed: 488bc1                   mov      rax, rcx
0x14014aef0: 4881fa00100000           cmp      rdx, 0x1000
0x14014aef7: 7215                     jb       0x14014af0e
0x14014aef9: 4883c227                 add      rdx, 0x27
0x14014aefd: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14014af01: 482bc1                   sub      rax, rcx
0x14014af04: 4883c0f8                 add      rax, -8
0x14014af08: 4883f81f                 cmp      rax, 0x1f
0x14014af0c: 7725                     ja       0x14014af33
0x14014af0e: e841e91a00               call     0x1402f9854
0x14014af13: 4084f6                   test     sil, sil
0x14014af16: 7522                     jne      0x14014af3a
0x14014af18: 4881c700010000           add      rdi, 0x100
0x14014af1f: 81c500010000             add      ebp, 0x100
0x14014af25: ffc3                     inc      ebx
0x14014af27: 413bde                   cmp      ebx, r14d
0x14014af2a: 7d15                     jge      0x14014af41
0x14014af2c: 33f6                     xor      esi, esi
0x14014af2e: e9b0feffff               jmp      0x14014ade3
0x14014af33: ff1567241d00             call     qword ptr [rip + 0x1d2467] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14014af39: cc                       int3
0x14014af3a: b8ffffffff               mov      eax, 0xffffffff
0x14014af3f: eb02                     jmp      0x14014af43
0x14014af41: 33c0                     xor      eax, eax
0x14014af43: 488b8c2480010000         mov      rcx, qword ptr [rsp + 0x180]
0x14014af4b: 4833cc                   xor      rcx, rsp
0x14014af4e: e8fdee1a00               call     0x1402f9e50
0x14014af53: 4c8d9c2490010000         lea      r11, [rsp + 0x190]
0x14014af5b: 498b5b38                 mov      rbx, qword ptr [r11 + 0x38]
0x14014af5f: 498b6b40                 mov      rbp, qword ptr [r11 + 0x40]
0x14014af63: 498b7348                 mov      rsi, qword ptr [r11 + 0x48]
0x14014af67: 498be3                   mov      rsp, r11
0x14014af6a: 415f                     pop      r15
0x14014af6c: 415e                     pop      r14
0x14014af6e: 415d                     pop      r13
0x14014af70: 415c                     pop      r12
0x14014af72: 5f                       pop      rdi
0x14014af73: c3                       ret
