FUNCTION 0x140147820 .. 0x140147b30
0x140147820: 48895c2418               mov      qword ptr [rsp + 0x18], rbx
0x140147825: 48894c2408               mov      qword ptr [rsp + 8], rcx
0x14014782a: 55                       push     rbp
0x14014782b: 56                       push     rsi
0x14014782c: 57                       push     rdi
0x14014782d: 488d6c24b9               lea      rbp, [rsp - 0x47]
0x140147832: 4881eca0000000           sub      rsp, 0xa0
0x140147839: 488bda                   mov      rbx, rdx
0x14014783c: 488bf9                   mov      rdi, rcx
0x14014783f: 4881c108020000           add      rcx, 0x208
0x140147846: ff1514191d00             call     qword ptr [rip + 0x1d1914] ; Qt5Core.dll:??0QByteArray@@QEAA@XZ
0x14014784c: 90                       nop
0x14014784d: 33c0                     xor      eax, eax
0x14014784f: 898710020000             mov      dword ptr [rdi + 0x210], eax
0x140147855: 48898718020000           mov      qword ptr [rdi + 0x218], rax
0x14014785c: 48898728020000           mov      qword ptr [rdi + 0x228], rax
0x140147863: 48c787300200000f000000   mov      qword ptr [rdi + 0x230], 0xf
0x14014786e: 888718020000             mov      byte ptr [rdi + 0x218], al
0x140147874: 48898738020000           mov      qword ptr [rdi + 0x238], rax
0x14014787b: 48898740020000           mov      qword ptr [rdi + 0x240], rax
0x140147882: 48898748020000           mov      qword ptr [rdi + 0x248], rax
0x140147889: 48898750020000           mov      qword ptr [rdi + 0x250], rax
0x140147890: 48898760020000           mov      qword ptr [rdi + 0x260], rax
0x140147897: 48c787680200000f000000   mov      qword ptr [rdi + 0x268], 0xf
0x1401478a2: 888750020000             mov      byte ptr [rdi + 0x250], al
0x1401478a8: 898770020000             mov      dword ptr [rdi + 0x270], eax
0x1401478ae: 48898778020000           mov      qword ptr [rdi + 0x278], rax
0x1401478b5: 88878c020000             mov      byte ptr [rdi + 0x28c], al
0x1401478bb: 898790020000             mov      dword ptr [rdi + 0x290], eax
0x1401478c1: 48898798020000           mov      qword ptr [rdi + 0x298], rax
0x1401478c8: 488987a8020000           mov      qword ptr [rdi + 0x2a8], rax
0x1401478cf: 48c787b00200000f000000   mov      qword ptr [rdi + 0x2b0], 0xf
0x1401478da: 888798020000             mov      byte ptr [rdi + 0x298], al
0x1401478e0: 488987b8020000           mov      qword ptr [rdi + 0x2b8], rax
0x1401478e7: 488987c8020000           mov      qword ptr [rdi + 0x2c8], rax
0x1401478ee: 48c787d00200000f000000   mov      qword ptr [rdi + 0x2d0], 0xf
0x1401478f9: 8887b8020000             mov      byte ptr [rdi + 0x2b8], al
0x1401478ff: 488d4f04                 lea      rcx, [rdi + 4]
0x140147903: 33d2                     xor      edx, edx
0x140147905: 41b800020000             mov      r8d, 0x200
0x14014790b: e802341b00               call     0x1402fad12
0x140147910: 8b03                     mov      eax, dword ptr [rbx]
0x140147912: 8907                     mov      dword ptr [rdi], eax
0x140147914: 488d4dc7                 lea      rcx, [rbp - 0x39]
0x140147918: e853effeff               call     0x140136870
0x14014791d: 90                       nop
0x14014791e: 488d1583761d00           lea      rdx, [rip + 0x1d7683]
0x140147925: 488d4dc7                 lea      rcx, [rbp - 0x39]
0x140147929: ff1511181d00             call     qword ptr [rip + 0x1d1811] ; Qt5Core.dll:??9QString@@QEBA_NPEBD@Z
0x14014792f: 84c0                     test     al, al
0x140147931: 0f84c4010000             je       0x140147afb
0x140147937: c6456f01                 mov      byte ptr [rbp + 0x6f], 1
0x14014793b: 4c8d456f                 lea      r8, [rbp + 0x6f]
0x14014793f: 488d55c7                 lea      rdx, [rbp - 0x39]
0x140147943: 488d4dff                 lea      rcx, [rbp - 1]
0x140147947: e8d448ecff               call     0x14000c220
0x14014794c: 90                       nop
0x14014794d: ba06000000               mov      edx, 6
0x140147952: 488d0d73be1e00           lea      rcx, [rip + 0x1ebe73] ; 'OFFSET'
0x140147959: ff15311c1d00             call     qword ptr [rip + 0x1d1c31] ; Qt5Core.dll:?fromAscii_helper@QString@@CAPEAU?$QTypedArrayData@G@@PEBDH@Z
0x14014795f: 488945d7                 mov      qword ptr [rbp - 0x29], rax
0x140147963: ba0b000000               mov      edx, 0xb
0x140147968: 488d0d11ba1e00           lea      rcx, [rip + 0x1eba11] ; 'cfg_nv_part'
0x14014796f: ff151b1c1d00             call     qword ptr [rip + 0x1d1c1b] ; Qt5Core.dll:?fromAscii_helper@QString@@CAPEAU?$QTypedArrayData@G@@PEBDH@Z
0x140147975: 488945cf                 mov      qword ptr [rbp - 0x31], rax
0x140147979: 4c8d4dd7                 lea      r9, [rbp - 0x29]
0x14014797d: 4c8d45cf                 lea      r8, [rbp - 0x31]
0x140147981: 488d551f                 lea      rdx, [rbp + 0x1f]
0x140147985: 488d4dff                 lea      rcx, [rbp - 1]
0x140147989: e8a265ecff               call     0x14000df30
0x14014798e: 90                       nop
0x14014798f: 488d55ef                 lea      rdx, [rbp - 0x11]
0x140147993: 488bc8                   mov      rcx, rax
0x140147996: ff155c1a1d00             call     qword ptr [rip + 0x1d1a5c] ; Qt5Core.dll:?toString@QVariant@@QEBA?AVQString@@XZ
0x14014799c: 90                       nop
0x14014799d: 33d2                     xor      edx, edx
0x14014799f: 448d4210                 lea      r8d, [rdx + 0x10]
0x1401479a3: 488bc8                   mov      rcx, rax
0x1401479a6: ff1514161d00             call     qword ptr [rip + 0x1d1614] ; Qt5Core.dll:?toInt@QString@@QEBAHPEA_NH@Z
0x1401479ac: 898780020000             mov      dword ptr [rdi + 0x280], eax
0x1401479b2: 488d4def                 lea      rcx, [rbp - 0x11]
0x1401479b6: ff157c1c1d00             call     qword ptr [rip + 0x1d1c7c] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x1401479bc: 90                       nop
0x1401479bd: 488d4d1f                 lea      rcx, [rbp + 0x1f]
0x1401479c1: ff15311b1d00             call     qword ptr [rip + 0x1d1b31] ; Qt5Core.dll:??1QVariant@@QEAA@XZ
0x1401479c7: 90                       nop
0x1401479c8: 488d4dcf                 lea      rcx, [rbp - 0x31]
0x1401479cc: ff15661c1d00             call     qword ptr [rip + 0x1d1c66] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x1401479d2: 90                       nop
0x1401479d3: 488d4dd7                 lea      rcx, [rbp - 0x29]
0x1401479d7: ff155b1c1d00             call     qword ptr [rip + 0x1d1c5b] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x1401479dd: ba04000000               mov      edx, 4
0x1401479e2: 488d0d0fb81e00           lea      rcx, [rip + 0x1eb80f] ; 'SIZE'
0x1401479e9: ff15a11b1d00             call     qword ptr [rip + 0x1d1ba1] ; Qt5Core.dll:?fromAscii_helper@QString@@CAPEAU?$QTypedArrayData@G@@PEBDH@Z
0x1401479ef: 488945e7                 mov      qword ptr [rbp - 0x19], rax
0x1401479f3: ba0b000000               mov      edx, 0xb
0x1401479f8: 488d0d81b91e00           lea      rcx, [rip + 0x1eb981] ; 'cfg_nv_part'
0x1401479ff: ff158b1b1d00             call     qword ptr [rip + 0x1d1b8b] ; Qt5Core.dll:?fromAscii_helper@QString@@CAPEAU?$QTypedArrayData@G@@PEBDH@Z
0x140147a05: 488945df                 mov      qword ptr [rbp - 0x21], rax
0x140147a09: 4c8d4de7                 lea      r9, [rbp - 0x19]
0x140147a0d: 4c8d45df                 lea      r8, [rbp - 0x21]
0x140147a11: 488d552f                 lea      rdx, [rbp + 0x2f]
0x140147a15: 488d4dff                 lea      rcx, [rbp - 1]
0x140147a19: e81265ecff               call     0x14000df30
0x140147a1e: 90                       nop
0x140147a1f: 488d55f7                 lea      rdx, [rbp - 9]
0x140147a23: 488bc8                   mov      rcx, rax
0x140147a26: ff15cc191d00             call     qword ptr [rip + 0x1d19cc] ; Qt5Core.dll:?toString@QVariant@@QEBA?AVQString@@XZ
0x140147a2c: 90                       nop
0x140147a2d: 33d2                     xor      edx, edx
0x140147a2f: 448d4210                 lea      r8d, [rdx + 0x10]
0x140147a33: 488bc8                   mov      rcx, rax
0x140147a36: ff1584151d00             call     qword ptr [rip + 0x1d1584] ; Qt5Core.dll:?toInt@QString@@QEBAHPEA_NH@Z
0x140147a3c: 898784020000             mov      dword ptr [rdi + 0x284], eax
0x140147a42: 488d4df7                 lea      rcx, [rbp - 9]
0x140147a46: ff15ec1b1d00             call     qword ptr [rip + 0x1d1bec] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x140147a4c: 90                       nop
0x140147a4d: 488d4d2f                 lea      rcx, [rbp + 0x2f]
0x140147a51: ff15a11a1d00             call     qword ptr [rip + 0x1d1aa1] ; Qt5Core.dll:??1QVariant@@QEAA@XZ
0x140147a57: 90                       nop
0x140147a58: 488d4ddf                 lea      rcx, [rbp - 0x21]
0x140147a5c: ff15d61b1d00             call     qword ptr [rip + 0x1d1bd6] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x140147a62: 90                       nop
0x140147a63: 488d4de7                 lea      rcx, [rbp - 0x19]
0x140147a67: ff15cb1b1d00             call     qword ptr [rip + 0x1d1bcb] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x140147a6d: 90                       nop
0x140147a6e: 488d4d17                 lea      rcx, [rbp + 0x17]
0x140147a72: e8894fecff               call     0x14000ca00
0x140147a77: 488b5d0f                 mov      rbx, qword ptr [rbp + 0xf]
0x140147a7b: beffffffff               mov      esi, 0xffffffff
0x140147a80: 4885db                   test     rbx, rbx
0x140147a83: 7429                     je       0x140147aae
0x140147a85: 8bc6                     mov      eax, esi
0x140147a87: f00fc14304               lock xadd dword ptr [rbx + 4], eax
0x140147a8c: 83f801                   cmp      eax, 1
0x140147a8f: 7509                     jne      0x140147a9a
0x140147a91: 488b4308                 mov      rax, qword ptr [rbx + 8]
0x140147a95: 488bcb                   mov      rcx, rbx
0x140147a98: ffd0                     call     rax
0x140147a9a: 8bc6                     mov      eax, esi
0x140147a9c: f00fc103                 lock xadd dword ptr [rbx], eax
0x140147aa0: 83f801                   cmp      eax, 1
0x140147aa3: 7509                     jne      0x140147aae
0x140147aa5: 488bcb                   mov      rcx, rbx
0x140147aa8: e8ef231b00               call     0x1402f9e9c
0x140147aad: 90                       nop
0x140147aae: 488b45ff                 mov      rax, qword ptr [rbp - 1]
0x140147ab2: 8b08                     mov      ecx, dword ptr [rax]
0x140147ab4: 85c9                     test     ecx, ecx
0x140147ab6: 7412                     je       0x140147aca
0x140147ab8: 83f9ff                   cmp      ecx, -1
0x140147abb: 743c                     je       0x140147af9
0x140147abd: 488b45ff                 mov      rax, qword ptr [rbp - 1]
0x140147ac1: f00fc130                 lock xadd dword ptr [rax], esi
0x140147ac5: 83fe01                   cmp      esi, 1
0x140147ac8: 752f                     jne      0x140147af9
0x140147aca: 488b5dff                 mov      rbx, qword ptr [rbp - 1]
0x140147ace: 488b4b10                 mov      rcx, qword ptr [rbx + 0x10]
0x140147ad2: 4885c9                   test     rcx, rcx
0x140147ad5: 7418                     je       0x140147aef
0x140147ad7: e8345decff               call     0x14000d810
0x140147adc: 41b808000000             mov      r8d, 8
0x140147ae2: 488b5310                 mov      rdx, qword ptr [rbx + 0x10]
0x140147ae6: 488bcb                   mov      rcx, rbx
0x140147ae9: ff15311a1d00             call     qword ptr [rip + 0x1d1a31] ; Qt5Core.dll:?freeTree@QMapDataBase@@QEAAXPEAUQMapNodeBase@@H@Z
0x140147aef: 488bcb                   mov      rcx, rbx
0x140147af2: ff15181a1d00             call     qword ptr [rip + 0x1d1a18] ; Qt5Core.dll:?freeData@QMapDataBase@@SAXPEAU1@@Z
0x140147af8: 90                       nop
0x140147af9: eb14                     jmp      0x140147b0f
0x140147afb: c7878002000000004500     mov      dword ptr [rdi + 0x280], 0x450000
0x140147b05: c7878402000000100000     mov      dword ptr [rdi + 0x284], 0x1000
0x140147b0f: 488d4dc7                 lea      rcx, [rbp - 0x39]
0x140147b13: ff151f1b1d00             call     qword ptr [rip + 0x1d1b1f] ; Qt5Core.dll:??1QString@@QEAA@XZ
0x140147b19: 90                       nop
0x140147b1a: 488bc7                   mov      rax, rdi
0x140147b1d: 488b9c24d0000000         mov      rbx, qword ptr [rsp + 0xd0]
0x140147b25: 4881c4a0000000           add      rsp, 0xa0
0x140147b2c: 5f                       pop      rdi
0x140147b2d: 5e                       pop      rsi
0x140147b2e: 5d                       pop      rbp
0x140147b2f: c3                       ret
