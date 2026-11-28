FUNCTION 0x14014aab0 .. 0x14014ad5d
0x14014aab0: 48895c2408               mov      qword ptr [rsp + 8], rbx
0x14014aab5: 55                       push     rbp
0x14014aab6: 56                       push     rsi
0x14014aab7: 57                       push     rdi
0x14014aab8: 4156                     push     r14
0x14014aaba: 4157                     push     r15
0x14014aabc: 4883ec70                 sub      rsp, 0x70
0x14014aac0: 4c8bf2                   mov      r14, rdx
0x14014aac3: 488bf9                   mov      rdi, rcx
0x14014aac6: 48837a1810               cmp      qword ptr [rdx + 0x18], 0x10
0x14014aacb: 7203                     jb       0x14014aad0
0x14014aacd: 488b12                   mov      rdx, qword ptr [rdx]
0x14014aad0: beffffffff               mov      esi, 0xffffffff
0x14014aad5: 448bc6                   mov      r8d, esi
0x14014aad8: 488d8c24b0000000         lea      rcx, [rsp + 0xb0]
0x14014aae0: ff15b2d11c00             call     qword ptr [rip + 0x1cd1b2] ; Qt5Core.dll:?fromLocal8Bit@QString@@SA?AV1@PEBDH@Z
0x14014aae6: 90                       nop
0x14014aae7: 448d4605                 lea      r8d, [rsi + 5]
0x14014aaeb: 488d9424a8000000         lea      rdx, [rsp + 0xa8]
0x14014aaf3: 488d8c24b0000000         lea      rcx, [rsp + 0xb0]
0x14014aafb: ff1587e21c00             call     qword ptr [rip + 0x1ce287] ; Qt5Core.dll:?right@QString@@QEBA?AV1@H@Z
0x14014ab01: 90                       nop
0x14014ab02: 488d15e7082000           lea      rdx, [rip + 0x2008e7] ; '.xml'
0x14014ab09: 488bc8                   mov      rcx, rax
0x14014ab0c: ff15f6e21c00             call     qword ptr [rip + 0x1ce2f6] ; Qt5Core.dll:??8QString@@QEBA_NPEBD@Z
0x14014ab12: 0fb6d8                   movzx    ebx, al
0x14014ab15: 488d8c24a8000000         lea      rcx, [rsp + 0xa8]
0x14014ab1d: ff1515eb1c00             call     qword ptr [rip + 0x1ceb15] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x14014ab23: 4533ff                   xor      r15d, r15d
0x14014ab26: 84db                     test     bl, bl
0x14014ab28: 0f84b3000000             je       0x14014abe1
0x14014ab2e: b900001000               mov      ecx, 0x100000
0x14014ab33: e8f0f51a00               call     0x1402fa128
0x14014ab38: 488be8                   mov      rbp, rax
0x14014ab3b: 33d2                     xor      edx, edx
0x14014ab3d: 41b800001000             mov      r8d, 0x100000
0x14014ab43: 488bc8                   mov      rcx, rax
0x14014ab46: e8c7011b00               call     0x1402fad12
0x14014ab4b: 4489bc24a8000000         mov      dword ptr [rsp + 0xa8], r15d
0x14014ab53: 498bd6                   mov      rdx, r14
0x14014ab56: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014ab5b: e8a084ecff               call     0x140013000
0x14014ab60: 4c8d8c24a8000000         lea      r9, [rsp + 0xa8]
0x14014ab68: 4c8bc5                   mov      r8, rbp
0x14014ab6b: 488bd0                   mov      rdx, rax
0x14014ab6e: 488bcf                   mov      rcx, rdi
0x14014ab71: e86af7ffff               call     0x14014a2e0
0x14014ab76: 8bd8                     mov      ebx, eax
0x14014ab78: 85c0                     test     eax, eax
0x14014ab7a: 7514                     jne      0x14014ab90
0x14014ab7c: 488bd5                   mov      rdx, rbp
0x14014ab7f: 488bcf                   mov      rcx, rdi
0x14014ab82: e8a9e7ffff               call     0x140149330
0x14014ab87: 85c0                     test     eax, eax
0x14014ab89: 7412                     je       0x14014ab9d
0x14014ab8b: bbb6860100               mov      ebx, 0x186b6
0x14014ab90: 488bcd                   mov      rcx, rbp
0x14014ab93: e8bcec1a00               call     0x1402f9854
0x14014ab98: e996010000               jmp      0x14014ad33
0x14014ab9d: 488d5704                 lea      rdx, [rdi + 4]
0x14014aba1: 448b8710020000           mov      r8d, dword ptr [rdi + 0x210]
0x14014aba8: 488d8c24a8000000         lea      rcx, [rsp + 0xa8]
0x14014abb0: ff15ead91c00             call     qword ptr [rip + 0x1cd9ea] ; Qt5Core.dll:?fromRawData@QByteArray@@SA?AV1@PEBDH@Z
0x14014abb6: 488d8f08020000           lea      rcx, [rdi + 0x208]
0x14014abbd: 488bd0                   mov      rdx, rax
0x14014abc0: ff158ae41c00             call     qword ptr [rip + 0x1ce48a] ; Qt5Core.dll:??4QByteArray@@QEAAAEAV0@$$QEAV0@@Z
0x14014abc6: 488d8c24a8000000         lea      rcx, [rsp + 0xa8]
0x14014abce: ff150cea1c00             call     qword ptr [rip + 0x1cea0c] ; Qt5Core.dll:??1QByteArray@@QEAA@XZ
0x14014abd4: 488bcd                   mov      rcx, rbp
0x14014abd7: e878ec1a00               call     0x1402f9854
0x14014abdc: e9a2000000               jmp      0x14014ac83
0x14014abe1: 498bd6                   mov      rdx, r14
0x14014abe4: 488d4c2448               lea      rcx, [rsp + 0x48]
0x14014abe9: e81284ecff               call     0x140013000
0x14014abee: 488bd8                   mov      rbx, rax
0x14014abf1: 4889442420               mov      qword ptr [rsp + 0x20], rax
0x14014abf6: 488bd0                   mov      rdx, rax
0x14014abf9: 488d8c24a8000000         lea      rcx, [rsp + 0xa8]
0x14014ac01: ff15b1e11c00             call     qword ptr [rip + 0x1ce1b1] ; Qt5Core.dll:?fromStdString@QString@@SA?AV1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@Z
0x14014ac07: 90                       nop
0x14014ac08: 488bd0                   mov      rdx, rax
0x14014ac0b: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014ac10: ff156ae81c00             call     qword ptr [rip + 0x1ce86a] ; Qt5Core.dll:??0QFile@@QEAA@AEBVQString@@@Z
0x14014ac16: 90                       nop
0x14014ac17: 488d8c24a8000000         lea      rcx, [rsp + 0xa8]
0x14014ac1f: ff1513ea1c00             call     qword ptr [rip + 0x1cea13] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x14014ac25: ba01000000               mov      edx, 1
0x14014ac2a: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014ac2f: ff1533e81c00             call     qword ptr [rip + 0x1ce833] ; Qt5Core.dll:?open@QFile@@UEAA_NV?$QFlags@W4OpenModeFlag@QIODevice@@@@@Z
0x14014ac35: 84c0                     test     al, al
0x14014ac37: 0f84dd000000             je       0x14014ad1a
0x14014ac3d: 488d9424b8000000         lea      rdx, [rsp + 0xb8]
0x14014ac45: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014ac4a: ff15e8e61c00             call     qword ptr [rip + 0x1ce6e8] ; Qt5Core.dll:?readAll@QIODevice@@QEAA?AVQByteArray@@XZ
0x14014ac50: 488d8f08020000           lea      rcx, [rdi + 0x208]
0x14014ac57: 488bd0                   mov      rdx, rax
0x14014ac5a: ff15f0e31c00             call     qword ptr [rip + 0x1ce3f0] ; Qt5Core.dll:??4QByteArray@@QEAAAEAV0@$$QEAV0@@Z
0x14014ac60: 488d8c24b8000000         lea      rcx, [rsp + 0xb8]
0x14014ac68: ff1572e91c00             call     qword ptr [rip + 0x1ce972] ; Qt5Core.dll:??1QByteArray@@QEAA@XZ
0x14014ac6e: 90                       nop
0x14014ac6f: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014ac74: ff15fee71c00             call     qword ptr [rip + 0x1ce7fe] ; Qt5Core.dll:??1QFile@@UEAA@XZ
0x14014ac7a: 90                       nop
0x14014ac7b: 488bcb                   mov      rcx, rbx
0x14014ac7e: e8dd8becff               call     0x140013860
0x14014ac83: 488bcf                   mov      rcx, rdi
0x14014ac86: e84533ffff               call     0x14013dfd0
0x14014ac8b: 84c0                     test     al, al
0x14014ac8d: 0f84a2000000             je       0x14014ad35
0x14014ac93: 488bcf                   mov      rcx, rdi
0x14014ac96: e895ddffff               call     0x140148a30
0x14014ac9b: 8bf0                     mov      esi, eax
0x14014ac9d: 85c0                     test     eax, eax
0x14014ac9f: 0f8590000000             jne      0x14014ad35
0x14014aca5: 488bcf                   mov      rcx, rdi
0x14014aca8: e8b3000000               call     0x14014ad60
0x14014acad: 488d15cc431d00           lea      rdx, [rip + 0x1d43cc] ; '4G'
0x14014acb4: 488d0db53f3a00           lea      rcx, [rip + 0x3a3fb5]
0x14014acbb: ff1547e11c00             call     qword ptr [rip + 0x1ce147] ; Qt5Core.dll:??8QString@@QEBA_NPEBD@Z
0x14014acc1: 84c0                     test     al, al
0x14014acc3: 741a                     je       0x14014acdf
0x14014acc5: c7878002000000b04500     mov      dword ptr [rdi + 0x280], 0x45b000
0x14014accf: 488bcf                   mov      rcx, rdi
0x14014acd2: e859ddffff               call     0x140148a30
0x14014acd7: 8bf0                     mov      esi, eax
0x14014acd9: 85c0                     test     eax, eax
0x14014acdb: 742a                     je       0x14014ad07
0x14014acdd: eb56                     jmp      0x14014ad35
0x14014acdf: 8b8f80020000             mov      ecx, dword ptr [rdi + 0x280]
0x14014ace5: 80bf8c02000000           cmp      byte ptr [rdi + 0x28c], 0
0x14014acec: 7508                     jne      0x14014acf6
0x14014acee: 8d8100200000             lea      eax, [rcx + 0x2000]
0x14014acf4: eb0b                     jmp      0x14014ad01
0x14014acf6: 8b8788020000             mov      eax, dword ptr [rdi + 0x288]
0x14014acfc: c1e00c                   shl      eax, 0xc
0x14014acff: 03c1                     add      eax, ecx
0x14014ad01: 898780020000             mov      dword ptr [rdi + 0x280], eax
0x14014ad07: 488bcf                   mov      rcx, rdi
0x14014ad0a: e851000000               call     0x14014ad60
0x14014ad0f: 85c0                     test     eax, eax
0x14014ad11: 7425                     je       0x14014ad38
0x14014ad13: beb4860100               mov      esi, 0x186b4
0x14014ad18: eb1b                     jmp      0x14014ad35
0x14014ad1a: 488d4c2428               lea      rcx, [rsp + 0x28]
0x14014ad1f: ff1553e71c00             call     qword ptr [rip + 0x1ce753] ; Qt5Core.dll:??1QFile@@UEAA@XZ
0x14014ad25: 90                       nop
0x14014ad26: 488bcb                   mov      rcx, rbx
0x14014ad29: e8328becff               call     0x140013860
0x14014ad2e: bbb6860100               mov      ebx, 0x186b6
0x14014ad33: 8bf3                     mov      esi, ebx
0x14014ad35: 448bfe                   mov      r15d, esi
0x14014ad38: 488d8c24b0000000         lea      rcx, [rsp + 0xb0]
0x14014ad40: ff15f2e81c00             call     qword ptr [rip + 0x1ce8f2] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x14014ad46: 418bc7                   mov      eax, r15d
0x14014ad49: 488b9c24a0000000         mov      rbx, qword ptr [rsp + 0xa0]
0x14014ad51: 4883c470                 add      rsp, 0x70
0x14014ad55: 415f                     pop      r15
0x14014ad57: 415e                     pop      r14
0x14014ad59: 5f                       pop      rdi
0x14014ad5a: 5e                       pop      rsi
0x14014ad5b: 5d                       pop      rbp
0x14014ad5c: c3                       ret
