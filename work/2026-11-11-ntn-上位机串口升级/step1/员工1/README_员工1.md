# step1 员工1交付索引

日期：2026-11-11

结论：主MCU USART3经电平转换接到MS150下载UART0，BOOT/RESET/电源控制齐备，硬件路径支持串口升级。MCU端PA10高有效进入下载，PA8高有效复位。尚未进行实板烧录验证。

1. [可行性与工作报告](NTN串口升级可行性与工作报告_员工1.md)：结论、引脚证据、固件核查、现有软件差距、工作量和验证边界。
2. [实施方案](NTN串口升级实施方案_员工1.md)：PC经MCU升级架构、二进制会话、4KiB缓存、状态机、恢复及验收用例。
3. [协议核对与参考工具分析](协议核对与参考工具分析_员工1.md)：文档错误补正、MCDT静态反汇编地址及未确认项。
4. [离线验证结果](evidence/verification.json)：命令XOR、镜像/擦除边界、tar.gz BIN一致性、boot/NV同一性。
5. [来源清单](evidence/source_manifest.json)：输入文件大小、SHA-256；[验证脚本](evidence/verify_inputs.py)、[静态分析脚本](evidence/inspect_mcdt.py)可复核。

`evidence/` 同时保存PDF文字提取、原理图/协议渲染及反汇编片段。GPIO同名txt来自 `work/器件` 可读副本；指定原件不是标准ZIP/OLE文件，未成功读取其内容。

本次只新增本员工目录的报告和证据。未改动生产源码、固件、协议、原理图或其他员工文件，未执行硬件擦写。
