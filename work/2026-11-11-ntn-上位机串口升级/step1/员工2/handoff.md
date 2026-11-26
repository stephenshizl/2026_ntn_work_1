# Handoff — NTN上位机串口升级（员工2）

| 项目 | 内容 |
|---|---|
| 日期 | 2026-11-26 |
| 交接人 | 员工2 |
| 任务 | Step1静态确认 → Step2真实UART抓包及MCU源码审查 |
| 当前技术基线 | [V1.1独立反汇编确认报告](员工2_20261126_NTN串口升级与MCDT独立反汇编确认报告_V1.1.md) |
| V1.1提交 | e89389b54cdd86cd82dd1a047ff0f042b2c12336 |
| 原始任务 | [step1-issue.txt](../step1-issue.txt) |
| 主仓库 | https://github.com/stephenshizl/2026_ntn_work_1，master |

## 1. 接手者先读

1. 先读step1-issue.txt，确认最新任务；再读员工2 V1.1（以V1.1为当前技术基线，V1.0为历史）。
2. 阅读员工1 README和协议核对、员工3协议勘误与工具；出现冲突按原EXE及实测证据解决，不按员工号或报告篇幅决定。
3. 固件包选择CA033/CA034配套E31和DSP；不要默认刷新Boot、NV或文件系统。
4. 当前目标是PC经终端RS232和HC32F460升级MS150，不是主MCU自身升级，不是卫星FOTA。
5. 先读证据和采集真实日志，后做擦写。没有可恢复测试板和授权时仅做只读操作。

## 2. 已完成及不可忽略的结论

已读取主仓库和任务、核对项目目录和历史报告、从项目经理上传原始EXE直接生成关键路径汇编、独立解析接收跳转表与波特率表、确认NV CRC局部算法，并提交V1.1。

原EXE 5320192B，SHA256：
91ce79dbe330a024e317e915230cf146db6724b9eb8e56918094f9a820d4df64
ImageBase=0x140000000，x64 PE32+，ImageVersion5.4。复现命令和原始字节解析脚本见V1.1第2章。不要使用不同版本EXE的函数地址。

| 项 | 必须遵守 |
|---|---|
| 0x57 | TX两条10B；mode7累计至少2B；真实RX格式待抓包。不能写死单字节06或任意2B即成功 |
| 0x50 | 115200索引04、1.5M索引09；mode8首字节06；本地改速前Sleep500ms，最多5次本地改速，非5次命令重发 |
| 0x55 | 目标57600路径跳过；其他目标速率前置时钟配置，不能无条件重复 |
| 0x79/7A | 固定64KiB头5B；变长头9B且LEN BE32；头后30ms；512B为主机写粒度，非协议ACK周期 |
| 0xEB | 6B命令，返回256B路径；末尾14为XOR而非长度 |
| CHK | 从FF对完整命令逐字节XOR；地址BE32、分区表字段LE32 |
| NV | 已定位CRC计算路径，422B脚本未完成黄金样本验证；地址存在冲突，首版不写 |
| GPIO | PA10/PA8均MCU侧高有效，外部反相后模组低有效；实测释放电平及复位时序 |
| 速度 | 外部RS232建议115200，内部USART3独立提速；不能宣称整机20s |
| 安全 | 先读取并备份目标表和相关数据，写前确认边界，禁止首扇区擦除探测和未经授权全擦 |

## 3. 接手前准备与阻塞清单

| ID | 事项 | 建议负责人 | 关闭条件 |
|---|---|---|---|
| B01 | MCU指定分支可读 | 项目经理/MCU负责人 | GitHub能读work_v1_boot_fix及指定SHA；记录实际commit |
| B02 | 厂家可恢复测试板、备份、USB-UART | 硬件/测试 | 完整原厂恢复流程可用、目标板及电平确认 |
| B03 | 完整双向UART抓包 | 测试/协议负责人 | 无截断原始记录、速率切换和所有关键RX |
| B04 | SP3232E具体料号、USART3波形 | 硬件 | BOM/规格及板级115200、1.5M测试 |
| B05 | NV及回滚机制 | 厂家/协议负责人 | 原厂实际写页黄金数据、主备地址、可验证恢复方式 |
| B06 | 0x57完整回复 | 协议负责人 | 两条指令完整TX/RX、消费边界、错误响应 |
| B07 | 固件及分区版本匹配 | MCU/测试 | 固件SHA、实际目标分区表、E31/DSP配套确认 |

B01历史状态：V1.0检查时MCU仓库返回409 empty；本轮未重新验证是否已推送，接手必须重新检查。主仓库Gitlink为03b0abc3f4062178c1d5864100bdc98e9c87b905。

```bash
git ls-remote --heads https://github.com/stephenshizl/hc32f460_rtthread_ntn.git
git clone -b work_v1_boot_fix https://github.com/stephenshizl/hc32f460_rtthread_ntn.git
cd hc32f460_rtthread_ntn
git rev-parse HEAD
git status --short
```

若无法读取，请负责人从本地正确工程推送该分支；不要强制推送、不覆盖其他员工分支。若最新HEAD与Gitlink不同，先记录差异并由负责人确定基线。

## 4. Step2：Bus Hound + 逻辑分析仪实测SOP

### 4.1 测试环境

Windows 10/11、原版MCDTV5.exe、厂家支持MS150下载的USB-UART/测试板、Bus Hound（https://perisoft.net/bushound/）、至少24MHz逻辑分析仪（采样率只是建议，实际需验证解码质量）。原厂工具必须来自授权来源。不要让两个串口驱动同时驱动同一线。TTL探头只连接符合电压范围的逻辑电平，不连接RS232高压侧；共地、高阻采集。

记录板号、版本、COM号、USB VID/PID及适配器型号、固件SHA256、原工具设置、日期和操作者。在MCDT打开COM前先启动监控；软件监控不应作为另一个应用抢占COM口。

### 4.2 软件抓包

1. Bus Hound设备列表选择实际COM或USB-UART设备，打开双向数据及可见控制/配置事件、时间戳；具体菜单以现场版本为准。
2. 验证采集有完整TX/RX，检查单次数据长度、容量、循环覆盖及截断。先做短时间只读握手；免费版容量不足则分场景捕获或使用适合的授权版本。
3. 保存原始捕获文件及可导出的HEX文本；不要仅截图。USB-UART包头/状态字节、操作系统I/O边界和UART协议帧不同，解码时保留原始数据。
4. 同步启动逻辑分析仪，CH0主机TX，CH1模组TX，另采BOOTSEL/RESETN；115200和1.5M分别解码。软件时间戳不是物理线间隔。
5. 先只读验证进入ROM、版本和读页；获准后用原厂工具在可恢复测试板执行CA033→CA034。明确选择E31/DSP，不选未经审批的Boot、NV。
6. 保存升级前后ATI/AT+CGMR、入网及数据收发记录；成功升级并不能代替全部异常测试。

### 4.3 重点捕获矩阵

| Case | 采集内容 | PASS条件 |
|---|---|---|
| CAP01 | BOOT/RESET、连续U、C0 | 明确电平时序、起始速率、停止U及完整RX |
| CAP02 | 两条57 | 完整10B TX、RX逐字节及间隔；明确是文本/ACK/组合、帧结束和错误分支 |
| CAP03 | 55、50 09 A6、50 04 AB | ACK在线速率，500ms主机改速事件，第一条新速率指令可正确解码 |
| CAP04 | EB读页 | 发送6B，原始响应长度与数据边界；重复读取一致 |
| CAP05 | 79/7A | 头5/9B、BE32 LEN、真实头尾间隔、数据+CHK及最终响应 |
| CAP06 | 20/D8、写页及分区表 | 对照实际分区范围、读取校验与提交前后；仅在获准测试板 |
| CAP07 | 完整升级 | 配套版本正确，重启AT、入网注册和数据收发 |
| CAP08 | 异常恢复 | 有可靠恢复手段后再做掉线、断电、校验失败、重复升级 |
| CAP09 | NV专项 | 仅额外授权后测试，保存原厂写页黄金样本，逐字节复核脚本 |

CAP02/03/04/05属于P0，不关闭这些争议不能冻结生产协议。不可将预期值写成实测值；每项记录PASS/FAIL/BLOCKED和证据路径。

## 5. 日志及交付目录建议

在项目经理确认的新阶段目录（例如work/2026-11-11-ntn-上位机串口升级/step2/员工X/）提交：

```text
README.md
handoff.md
manifest.json
capture/
  bus_hound_original.*
  bus_hound_export.txt
  logic_original.*
  logic_uart_decoded.csv
  mcdt_log.txt
analysis/
  decoded_frames.csv
  protocol_diffs.md
  protocol_spec.md
  test_results.md
  checksum_tests.py
  golden_vectors.json
```

大型抓包可用受控附件或LFS，明确文件哈希和可访问位置；不要公开未经审核的客户设备标识、配置及供应商保密数据。

manifest至少记录test_id、board_revision、module_version_before/after、tool_sha256、firmware_sha256、adapter、COM、baud、capture软件/硬件版本、capture_sha256、测试时间、操作者。

decoded_frames.csv列：
test_id,seq,timestamp_us,direction,baud,raw_hex,opcode,address,length,checksum_calc,checksum_wire,rx_hex,response_kind,status,evidence_file,evidence_offset,notes

按命令和长度重组原始数据；对同一数据分别核对软件及硬件时间，保留不明字节，不丢弃矛盾证据。

## 6. MCU开发接手要求（抓包关闭之后）

在实际源码中定位board_config.h、ntn_ms150.c、hw_power相关代码、RS232收发、UART DMA/ISR、RT-Thread线程和FAL分区。以下为建议检索，不代表本轮已获取源码。

```bash
git grep -n -E 'ntn_rx_thread_entry|hw_power_ntn_set|MCU_NTN_BOOT|MCU_NTN_RESET|UART3|USART3|MCUUPG'
git grep -n -i -E 'rs232|fal_partition|uart.*dma'
```

设计要求：
- 唯一UART3接收者，明确正常AT/URC与二进制升级模式互斥；RS232独立115200。
- GPIO进入下载模式专用接口，不复用会清除BOOT的正常上电路径；复位/电源时序以实测为准。
- 维护会话包含会话ID、序号、长度、CRC32、状态码；PC收到的进度以模组成功读回为准，不以MCU收到包为准。
- 先备份目标分区表和保留区域、验证地址及镜像匹配；只授权E31/DSP写范围；不默认更新NV/boot。
- 状态机：IDLE→PRECHECK→ENTER_BOOT→SYNC→INIT→READ_TABLE→PLAN→ERASE→WRITE→VERIFY→COMMIT_TABLE→REBOOT→CHECK_VERSION→DONE；失败ERROR/RECOVERY。
- 4KiB缓存方案优先用于POC；整包外置Flash方案需核实FAL实际容量和回滚，不承诺双备份。
- 错误场景下禁止盲目重发擦写命令；记录最后确认状态，读回/重新同步后决定恢复。
- 编写单元测试：校验、端序、边界溢出、分片/拼包、超时、断开、禁止地址、错误版本、异常恢复。

## 7. 后续工作与责任边界

建议顺序：
1. 测试负责人完成CAP01—CAP07的原始抓包及报告。
2. 协议负责人依据V1.1+抓包关闭争议，生成唯一协议规范。
3. MCU负责人恢复指定源码可访问并完成独占升级代理设计审查。
4. PC负责人编写Python原厂UART直接POC，随后开发代理模式POC。
5. MCU与PC联调整机；异常恢复必须在有恢复能力的测试板上执行。
6. 项目经理确认验收及量产范围后再做正式工具和后续BLE/Web扩展。

本次交接不代表完成动态验证、完整EXE反编译、生产源码修改、NV烧录或实板验证。员工2报告中VA为静态定位，源代码名称为人工功能性命名。完整汇编可用V1.1脚本复现；实际EXE不在本次新增文件中。保留V1.0、员工1/3和员工2目录原有员工5报告，避免覆盖历史证据。

## 8. 给下一位员工的任务指令

请以V1.1为技术基线，不重复做无关UI反编译。先核实MCU分支及现场资源，然后采集原厂真实UART下载过程，逐项对照CAP矩阵。特别确认0x57的完整应答，不要再假设单字节ACK。输出带员工号、日期、Git commit基线和证据路径的协议修订报告；无法实测则明确BLOCKED，不得虚构日志。完成后将成果提交到项目指定目录、工作分支，并交接下一阶段。
