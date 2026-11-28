FUNCTION 0x140149330 .. 0x140149435
0x140149330: 48895c2408               mov      qword ptr [rsp + 8], rbx
0x140149335: 48896c2410               mov      qword ptr [rsp + 0x10], rbp
0x14014933a: 4889742418               mov      qword ptr [rsp + 0x18], rsi
0x14014933f: 48897c2420               mov      qword ptr [rsp + 0x20], rdi
0x140149344: 4156                     push     r14
0x140149346: 4881ec30030000           sub      rsp, 0x330
0x14014934d: 488bda                   mov      rbx, rdx
0x140149350: 488bf9                   mov      rdi, rcx
0x140149353: 4533c0                   xor      r8d, r8d
0x140149356: b201                     mov      dl, 1
0x140149358: 488d4c2420               lea      rcx, [rsp + 0x20]
0x14014935d: e8fe6fffff               call     0x140140360
0x140149362: 90                       nop
0x140149363: 48c7c5ffffffff           mov      rbp, -1
0x14014936a: 4c8bc5                   mov      r8, rbp
0x14014936d: 488bd3                   mov      rdx, rbx
0x140149370: 488d4c2420               lea      rcx, [rsp + 0x20]
0x140149375: e84695ffff               call     0x1401428c0
0x14014937a: 85c0                     test     eax, eax
0x14014937c: 0f8589000000             jne      0x14014940b
0x140149382: 33d2                     xor      edx, edx
0x140149384: 488d4c2420               lea      rcx, [rsp + 0x20]
0x140149389: e88288ffff               call     0x140141c10
0x14014938e: 33d2                     xor      edx, edx
0x140149390: 488bc8                   mov      rcx, rax
0x140149393: e87888ffff               call     0x140141c10
0x140149398: 4c8bf0                   mov      r14, rax
0x14014939b: 4885c0                   test     rax, rax
0x14014939e: 746b                     je       0x14014940b
0x1401493a0: 488d8f18020000           lea      rcx, [rdi + 0x218]
0x1401493a7: 4533c0                   xor      r8d, r8d
0x1401493aa: 488d15f75b1d00           lea      rdx, [rip + 0x1d5bf7]
0x1401493b1: e83abaecff               call     0x140014df0
0x1401493b6: 488bb740020000           mov      rsi, qword ptr [rdi + 0x240]
0x1401493bd: 488b9f38020000           mov      rbx, qword ptr [rdi + 0x238]
0x1401493c4: 483bde                   cmp      rbx, rsi
0x1401493c7: 7422                     je       0x1401493eb
0x1401493c9: 0f1f8000000000           nop      dword ptr [rax]
0x1401493d0: 488bcb                   mov      rcx, rbx
0x1401493d3: e868fdf3ff               call     0x140089140
0x1401493d8: 4881c3a8000000           add      rbx, 0xa8
0x1401493df: 483bde                   cmp      rbx, rsi
0x1401493e2: 75ec                     jne      0x1401493d0
0x1401493e4: 488b9f38020000           mov      rbx, qword ptr [rdi + 0x238]
0x1401493eb: 48899f40020000           mov      qword ptr [rdi + 0x240], rbx
0x1401493f2: 498bd6                   mov      rdx, r14
0x1401493f5: 488bcf                   mov      rcx, rdi
0x1401493f8: e8c3f6ffff               call     0x140148ac0
0x1401493fd: 488bcf                   mov      rcx, rdi
0x140149400: e8ebe7ffff               call     0x140147bf0
0x140149405: 85c0                     test     eax, eax
0x140149407: 7502                     jne      0x14014940b
0x140149409: 33ed                     xor      ebp, ebp
0x14014940b: 488d4c2420               lea      rcx, [rsp + 0x20]
0x140149410: e8db74ffff               call     0x1401408f0
0x140149415: 8bc5                     mov      eax, ebp
0x140149417: 4c8d9c2430030000         lea      r11, [rsp + 0x330]
0x14014941f: 498b5b10                 mov      rbx, qword ptr [r11 + 0x10]
0x140149423: 498b6b18                 mov      rbp, qword ptr [r11 + 0x18]
0x140149427: 498b7320                 mov      rsi, qword ptr [r11 + 0x20]
0x14014942b: 498b7b28                 mov      rdi, qword ptr [r11 + 0x28]
0x14014942f: 498be3                   mov      rsp, r11
0x140149432: 415e                     pop      r14
0x140149434: c3                       ret
