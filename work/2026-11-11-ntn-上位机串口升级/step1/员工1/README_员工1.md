# step1 员工1交付索引

初版：2026-11-11；更新：2026-11-28，V1.1。

结论：主MCU USART3经电平转换接到MS150下载UART0，BOOT/RESET/电源控制齐备，硬件路径支持串口升级。MCU端PA10高有效进入下载，PA8高有效复位。尚未进行实板烧录验证。

当前方案按新增要求采用外部Flash完整缓存、4KiB RAM搬运，功能目标包括二级Boot/E31/DSP/NV四组件。NV已有文档指导并完成进一步静态还原，423 B/CRC42是待黄金比对候选；LogMap仅保留PC。CA033文字清单与CA034截图分别管理。

优先阅读本次更新：

1. [跨员工复核与共享协作补充报告](员工1_20261128_跨员工复核与共享协作补充报告_V1.1.md)。
2. [外部Flash暂存方案](NTN固件外部Flash暂存方案_员工1_V1.0_20261128.md)。
3. [NV烧录文档与反汇编核查](NV烧录文档与反汇编核查_员工1_20261128.md)。
4. [Bus Hound协议分析操作指导](BusHound协议分析操作指导_员工1_20261128.md)：推荐64MiB缓冲、128KiB单阶段/记录上限、满缓冲停止。

持续维护的基础报告：

1. [可行性与工作报告](NTN串口升级可行性与工作报告_员工1.md)：结论、引脚证据、固件核查、现有软件差距、工作量和验证边界。
2. [实施方案](NTN串口升级实施方案_员工1.md)：PC经MCU升级架构、二进制会话、4KiB缓存、状态机、恢复及验收用例。
3. [协议核对与参考工具分析](协议核对与参考工具分析_员工1.md)：文档错误补正、MCDT静态反汇编地址及未确认项。
4. [离线验证结果](evidence/verification.json)：命令XOR、镜像/擦除边界、tar.gz BIN一致性、boot/NV同一性。
5. [来源清单](evidence/source_manifest.json)：输入文件大小、SHA-256；[验证脚本](evidence/verify_inputs.py)、[静态分析脚本](evidence/inspect_mcdt.py)可复核。

`evidence/` 同时保存PDF文字提取、原理图/协议渲染及反汇编片段。GPIO同名txt来自 `work/器件` 可读副本；指定原件不是标准ZIP/OLE文件，未成功读取其内容。

本次只更新本员工目录的报告和证据。未改动生产源码、固件、协议、原理图或其他员工文件，未执行硬件擦写。

新增复核：`python evidence/review_20261128.py --mcu-root <RT-Thread路径>`；`python evidence/nv_candidate_20261128.py`；完整NV静态片段由 `python evidence/inspect_nv_20261128.py` 生成。结果及输入版本限制见对应JSON。旧source_manifest/verification保持初版证据含义，不能把其中历史Windows绝对路径直接当LAN源码路径。

协作主仓库：[2026_ntn_work_1](https://github.com/stephenshizl/2026_ntn_work_1)。LAN对应 `/mnt/data3t/builddata/src/work/2026_ntn_work_1`。MCU核查基线为 `work_v1_boot_fix @ 03b0abc3f4062178c1d5864100bdc98e9c87b905`，未改动其源码。
