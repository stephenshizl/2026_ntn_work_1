FUNCTION 0x14015f180 .. 0x14015f4bd
0x14015f180: 48895c2418               mov      qword ptr [rsp + 0x18], rbx
0x14015f185: 55                       push     rbp
0x14015f186: 56                       push     rsi
0x14015f187: 57                       push     rdi
0x14015f188: 488dac2450fdffff         lea      rbp, [rsp - 0x2b0]
0x14015f190: 4881ecb0030000           sub      rsp, 0x3b0
0x14015f197: 488b054a653800           mov      rax, qword ptr [rip + 0x38654a]
0x14015f19e: 4833c4                   xor      rax, rsp
0x14015f1a1: 488985a0020000           mov      qword ptr [rbp + 0x2a0], rax
0x14015f1a8: 488bda                   mov      rbx, rdx
0x14015f1ab: 488bf9                   mov      rdi, rcx
0x14015f1ae: c644243000               mov      byte ptr [rsp + 0x30], 0
0x14015f1b3: 488d510c                 lea      rdx, [rcx + 0xc]
0x14015f1b7: 4c8d442430               lea      r8, [rsp + 0x30]
0x14015f1bc: 488d4dc0                 lea      rcx, [rbp - 0x40]
0x14015f1c0: e85b86feff               call     0x140147820
0x14015f1c5: 90                       nop
0x14015f1c6: c6854c02000000           mov      byte ptr [rbp + 0x24c], 0
0x14015f1cd: 488bd3                   mov      rdx, rbx
0x14015f1d0: 488d4dc0                 lea      rcx, [rbp - 0x40]
0x14015f1d4: e8d7b8feff               call     0x14014aab0
0x14015f1d9: 8bd8                     mov      ebx, eax
0x14015f1db: 4c8d0d8ed51e00           lea      r9, [rip + 0x1ed58e] ; 'int __cdecl DownLoad::DownLoadFileToNV(const class std::basic_string<char,struct std::char_traits<char>,class std::alloc'
0x14015f1e2: 41b819010000             mov      r8d, 0x119
0x14015f1e8: 488d1529d51e00           lea      rdx, [rip + 0x1ed529] ; '..\\module\\function\\src\\download\\Download.cpp'
0x14015f1ef: 488d4da0                 lea      rcx, [rbp - 0x60]
0x14015f1f3: ff15979f1b00             call     qword ptr [rip + 0x1b9f97] ; Qt5Core.dll:??0QMessageLogger@@QEAA@PEBDH0@Z
0x14015f1f9: 488d542438               lea      rdx, [rsp + 0x38]
0x14015f1fe: 488bc8                   mov      rcx, rax
0x14015f201: ff15819f1b00             call     qword ptr [rip + 0x1b9f81] ; Qt5Core.dll:?debug@QMessageLogger@@QEBA?AVQDebug@@XZ
0x14015f207: 90                       nop
0x14015f208: 488d157d011c00           lea      rdx, [rip + 0x1c017d]
0x14015f20f: 488bc8                   mov      rcx, rax
0x14015f212: ff15e09e1b00             call     qword ptr [rip + 0x1b9ee0] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@PEBD@Z
0x14015f218: 488d15d9d51e00           lea      rdx, [rip + 0x1ed5d9] ; 'DownLoad::DownLoadFileToNV'
0x14015f21f: 488bc8                   mov      rcx, rax
0x14015f222: ff15d09e1b00             call     qword ptr [rip + 0x1b9ed0] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@PEBD@Z
0x14015f228: 488d1565fe1b00           lea      rdx, [rip + 0x1bfe65]
0x14015f22f: 488bc8                   mov      rcx, rax
0x14015f232: ff15c09e1b00             call     qword ptr [rip + 0x1b9ec0] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@PEBD@Z
0x14015f238: ba19010000               mov      edx, 0x119
0x14015f23d: 488bc8                   mov      rcx, rax
0x14015f240: ff157a9c1b00             call     qword ptr [rip + 0x1b9c7a] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@H@Z
0x14015f246: 488d155b011c00           lea      rdx, [rip + 0x1c015b]
0x14015f24d: 488bc8                   mov      rcx, rax
0x14015f250: ff15a29e1b00             call     qword ptr [rip + 0x1b9ea2] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@PEBD@Z
0x14015f256: 488d15bbd51e00           lea      rdx, [rip + 0x1ed5bb] ; 'write nv ret'
0x14015f25d: 488bc8                   mov      rcx, rax
0x14015f260: ff15929e1b00             call     qword ptr [rip + 0x1b9e92] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@PEBD@Z
0x14015f266: 8bd3                     mov      edx, ebx
0x14015f268: 488bc8                   mov      rcx, rax
0x14015f26b: ff154f9c1b00             call     qword ptr [rip + 0x1b9c4f] ; Qt5Core.dll:??6QDebug@@QEAAAEAV0@H@Z
0x14015f271: 90                       nop
0x14015f272: 488d4c2438               lea      rcx, [rsp + 0x38]
0x14015f277: ff15839e1b00             call     qword ptr [rip + 0x1b9e83] ; Qt5Core.dll:??1QDebug@@QEAA@XZ
0x14015f27d: 85db                     test     ebx, ebx
0x14015f27f: 0f850b020000             jne      0x14015f490
0x14015f285: 488b4f50                 mov      rcx, qword ptr [rdi + 0x50]
0x14015f289: 4885c9                   test     rcx, rcx
0x14015f28c: 7413                     je       0x14015f2a1
0x14015f28e: c744243864000000         mov      dword ptr [rsp + 0x38], 0x64
0x14015f296: 488b01                   mov      rax, qword ptr [rcx]
0x14015f299: 488d542438               lea      rdx, [rsp + 0x38]
0x14015f29e: ff5010                   call     qword ptr [rax + 0x10]
0x14015f2a1: 8b9550020000             mov      edx, dword ptr [rbp + 0x250]
0x14015f2a7: 488d4da0                 lea      rcx, [rbp - 0x60]
0x14015f2ab: e8e0d0f6ff               call     0x1400cc390
0x14015f2b0: 488bf0                   mov      rsi, rax
0x14015f2b3: 488d9578020000           lea      rdx, [rbp + 0x278]
0x14015f2ba: 488d4c2440               lea      rcx, [rsp + 0x40]
0x14015f2bf: e83c3debff               call     0x140013000
0x14015f2c4: 90                       nop
0x14015f2c5: 488b542450               mov      rdx, qword ptr [rsp + 0x50]
0x14015f2ca: 4c8b442458               mov      r8, qword ptr [rsp + 0x58]
0x14015f2cf: 498bc8                   mov      rcx, r8
0x14015f2d2: 482bca                   sub      rcx, rdx
0x14015f2d5: 4883f905                 cmp      rcx, 5
0x14015f2d9: 723b                     jb       0x14015f316
0x14015f2db: 488d4205                 lea      rax, [rdx + 5]
0x14015f2df: 4889442450               mov      qword ptr [rsp + 0x50], rax
0x14015f2e4: 488d5c2440               lea      rbx, [rsp + 0x40]
0x14015f2e9: 4983f810                 cmp      r8, 0x10
0x14015f2ed: 480f435c2440             cmovae   rbx, qword ptr [rsp + 0x40]
0x14015f2f3: 4803da                   add      rbx, rdx
0x14015f2f6: 41b805000000             mov      r8d, 5
0x14015f2fc: 488d1525d51e00           lea      rdx, [rip + 0x1ed525] ; '#crc:'
0x14015f303: 488bcb                   mov      rcx, rbx
0x14015f306: e801ba1900               call     0x1402fad0c
0x14015f30b: c6430500                 mov      byte ptr [rbx + 5], 0
0x14015f30f: 488d442440               lea      rax, [rsp + 0x40]
0x14015f314: eb21                     jmp      0x14015f337
0x14015f316: 48c744242005000000       mov      qword ptr [rsp + 0x20], 5
0x14015f31f: 4c8d0d02d51e00           lea      r9, [rip + 0x1ed502] ; '#crc:'
0x14015f326: 4533c0                   xor      r8d, r8d
0x14015f329: 418d5005                 lea      edx, [r8 + 5]
0x14015f32d: 488d4c2440               lea      rcx, [rsp + 0x40]
0x14015f332: e8c939ebff               call     0x140012d00
0x14015f337: 0f1000                   movups   xmm0, xmmword ptr [rax]
0x14015f33a: 0f11442460               movups   xmmword ptr [rsp + 0x60], xmm0
0x14015f33f: 0f104810                 movups   xmm1, xmmword ptr [rax + 0x10]
0x14015f343: 0f114c2470               movups   xmmword ptr [rsp + 0x70], xmm1
0x14015f348: 33db                     xor      ebx, ebx
0x14015f34a: 48895810                 mov      qword ptr [rax + 0x10], rbx
0x14015f34e: 48c740180f000000         mov      qword ptr [rax + 0x18], 0xf
0x14015f356: 8818                     mov      byte ptr [rax], bl
0x14015f358: 4c8bce                   mov      r9, rsi
0x14015f35b: 4c8d442460               lea      r8, [rsp + 0x60]
0x14015f360: 0fb6542430               movzx    edx, byte ptr [rsp + 0x30]
0x14015f365: 488d4d80                 lea      rcx, [rbp - 0x80]
0x14015f369: e8c283f2ff               call     0x140087730
0x14015f36e: 488d8f80000000           lea      rcx, [rdi + 0x80]
0x14015f375: 488d5580                 lea      rdx, [rbp - 0x80]
0x14015f379: e8d2d3ebff               call     0x14001c750
0x14015f37e: 488b5598                 mov      rdx, qword ptr [rbp - 0x68]
0x14015f382: 4883fa10                 cmp      rdx, 0x10
0x14015f386: 7235                     jb       0x14015f3bd
0x14015f388: 48ffc2                   inc      rdx
0x14015f38b: 488b4d80                 mov      rcx, qword ptr [rbp - 0x80]
0x14015f38f: 488bc1                   mov      rax, rcx
0x14015f392: 4881fa00100000           cmp      rdx, 0x1000
0x14015f399: 721c                     jb       0x14015f3b7
0x14015f39b: 4883c227                 add      rdx, 0x27
0x14015f39f: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14015f3a3: 482bc1                   sub      rax, rcx
0x14015f3a6: 4883c0f8                 add      rax, -8
0x14015f3aa: 4883f81f                 cmp      rax, 0x1f
0x14015f3ae: 7607                     jbe      0x14015f3b7
0x14015f3b0: ff15eadf1b00             call     qword ptr [rip + 0x1bdfea] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14015f3b6: cc                       int3
0x14015f3b7: e898a41900               call     0x1402f9854
0x14015f3bc: 90                       nop
0x14015f3bd: 488b542478               mov      rdx, qword ptr [rsp + 0x78]
0x14015f3c2: 4883fa10                 cmp      rdx, 0x10
0x14015f3c6: 7236                     jb       0x14015f3fe
0x14015f3c8: 48ffc2                   inc      rdx
0x14015f3cb: 488b4c2460               mov      rcx, qword ptr [rsp + 0x60]
0x14015f3d0: 488bc1                   mov      rax, rcx
0x14015f3d3: 4881fa00100000           cmp      rdx, 0x1000
0x14015f3da: 721c                     jb       0x14015f3f8
0x14015f3dc: 4883c227                 add      rdx, 0x27
0x14015f3e0: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14015f3e4: 482bc1                   sub      rax, rcx
0x14015f3e7: 4883c0f8                 add      rax, -8
0x14015f3eb: 4883f81f                 cmp      rax, 0x1f
0x14015f3ef: 7607                     jbe      0x14015f3f8
0x14015f3f1: ff15a9df1b00             call     qword ptr [rip + 0x1bdfa9] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14015f3f7: cc                       int3
0x14015f3f8: e857a41900               call     0x1402f9854
0x14015f3fd: 90                       nop
0x14015f3fe: 488b542458               mov      rdx, qword ptr [rsp + 0x58]
0x14015f403: 4883fa10                 cmp      rdx, 0x10
0x14015f407: 7235                     jb       0x14015f43e
0x14015f409: 48ffc2                   inc      rdx
0x14015f40c: 488b4c2440               mov      rcx, qword ptr [rsp + 0x40]
0x14015f411: 488bc1                   mov      rax, rcx
0x14015f414: 4881fa00100000           cmp      rdx, 0x1000
0x14015f41b: 721c                     jb       0x14015f439
0x14015f41d: 4883c227                 add      rdx, 0x27
0x14015f421: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14015f425: 482bc1                   sub      rax, rcx
0x14015f428: 4883c0f8                 add      rax, -8
0x14015f42c: 4883f81f                 cmp      rax, 0x1f
0x14015f430: 7607                     jbe      0x14015f439
0x14015f432: ff1568df1b00             call     qword ptr [rip + 0x1bdf68] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14015f438: cc                       int3
0x14015f439: e816a41900               call     0x1402f9854
0x14015f43e: 48895c2450               mov      qword ptr [rsp + 0x50], rbx
0x14015f443: 48c74424580f000000       mov      qword ptr [rsp + 0x58], 0xf
0x14015f44c: c644244000               mov      byte ptr [rsp + 0x40], 0
0x14015f451: 488b55b8                 mov      rdx, qword ptr [rbp - 0x48]
0x14015f455: 4883fa10                 cmp      rdx, 0x10
0x14015f459: 7235                     jb       0x14015f490
0x14015f45b: 48ffc2                   inc      rdx
0x14015f45e: 488b4da0                 mov      rcx, qword ptr [rbp - 0x60]
0x14015f462: 488bc1                   mov      rax, rcx
0x14015f465: 4881fa00100000           cmp      rdx, 0x1000
0x14015f46c: 721c                     jb       0x14015f48a
0x14015f46e: 4883c227                 add      rdx, 0x27
0x14015f472: 488b49f8                 mov      rcx, qword ptr [rcx - 8]
0x14015f476: 482bc1                   sub      rax, rcx
0x14015f479: 4883c0f8                 add      rax, -8
0x14015f47d: 4883f81f                 cmp      rax, 0x1f
0x14015f481: 7607                     jbe      0x14015f48a
0x14015f483: ff1517df1b00             call     qword ptr [rip + 0x1bdf17] ; api-ms-win-crt-runtime-l1-1-0.dll:_invalid_parameter_noinfo_noreturn
0x14015f489: cc                       int3
0x14015f48a: e8c5a31900               call     0x1402f9854
0x14015f48f: 90                       nop
0x14015f490: 488d4dc0                 lea      rcx, [rbp - 0x40]
0x14015f494: e8579af2ff               call     0x140088ef0
0x14015f499: 8bc3                     mov      eax, ebx
0x14015f49b: 488b8da0020000           mov      rcx, qword ptr [rbp + 0x2a0]
0x14015f4a2: 4833cc                   xor      rcx, rsp
0x14015f4a5: e8a6a91900               call     0x1402f9e50
0x14015f4aa: 488b9c24e0030000         mov      rbx, qword ptr [rsp + 0x3e0]
0x14015f4b2: 4881c4b0030000           add      rsp, 0x3b0
0x14015f4b9: 5f                       pop      rdi
0x14015f4ba: 5e                       pop      rsi
0x14015f4bb: 5d                       pop      rbp
0x14015f4bc: c3                       ret
