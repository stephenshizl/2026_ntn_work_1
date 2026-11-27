# NTN 串口升级复盘评估与 Bus Hound 抓包可行性报告（员工3）

| 项目 | 内容 |
| :--- | :--- |
| **完成单位** | youyoutech |
| **责任员工** | 员工3 |
| **评估日期** | 2026-11-26 |
| **任务依据** | `step1-issue.txt`（含 2026-11-26 Bus Hound 补充问题） |
| **核查基线** | 原理图 `20260924(1)`、`MS150下载流程 Rev 1.4`、`MCDTV5.exe` (`SHA256: 91ce79db...d4df64`)、本地 MCU 源码 `work_v1_boot_fix @ 03b0abc3f4` |
| **历史文档关系** | 保留 `2026-11-11` 旧版报告作历史档案；本报告对旧版勘误并作为员工3最新技术基线 |

---

## 1. 核心总结结论

1. **硬件通路结论（100% 物理可行，但板级高速波形待实测）**：
   主 MCU（`U6`，HC32F460 48+1 脚封装，512 KB 片内 Flash）通过 `USART3 (PB4/PB5)` 经 `R4/R3 (0Ω)` 与双向电平转换芯片 `U22 (TXB0104RUTR, 3.3V↔1.8V)` 直连 NTN 模组（`U7`，ST1000 / MS150）的下载口 `UART0 (Pin 32/33)`，且 MCU 完整接管了 `BOOTSEL (PA10→Q4反相)`、`RESETN (PA8→Q3反相)` 与电源控制 `VCC_ST1000 (PB15→Q7102→Q1)`。
2. **关于 2026-11-26 新问题（Bus Hound 能否监控 UART 实际下载协议）**：
   **可以，且智联安官方《MS150固件下载流程 Rev 1.4》第 7–8 页的示例截图本身就是用 Bus Hound 抓取的。** 但仅适用于 **USB 转串口虚拟 COM 口**，必须规避默认 `Max Phase` 截断、免费版缓冲上限、USB 芯片层状态字节混入以及时间戳精度失真 4 个关键坑；**必须同步并联硬件逻辑分析仪（≥24 MHz，推荐 50–100 MHz）** 才能最终关闭 30 ms 头尾延时、切速相位和 `TXB0104RUTR` 1.5 Mbps 信号质量等 P0 疑点。
3. **跨员工分歧仲裁与本地 MCU 源码实核（已关闭员工2 交接单 B01 阻塞项）**：
   - **Flash 2MB vs 8MB 真相**：2026-09-24 原理图 `U11` 标为 `ZD25WQ16CEIGR (2 MB)`（员工5 据此判定不可暂存整包）；实际 V30 样板与当前 MCU 源码（`applications/app_flash.c`）已换料为 **`BY25Q64ES (8 MB, JEDEC 68 40 17)`**。但 11-20 引入 MCU OTA 后，`board/ports/fal_cfg.h` 已占用 `0x000000`–`0x211FFF`，剩余 `reserved` 实际起点为 **`0x212000`（约 5.93 MiB）**，且最新提交 `494fd44837`/`03b0abc3f4` 支持外置 NOR 故障降级启动。
   - **员工3（11-11 旧版）6 项自查勘误**：直接核对原始 PDF、`.ini`、MCU 源码与 `MCDTV5.exe` 反汇编后，确认旧版报告在 `0x57` 接收模式、`T_Header_5gNew` 偏移与默认地址、`compile_nv_xml.py` 漏写 `CurrentVersion`、部分 GPIO 引脚号、FAL 分区基址与“整机 20 秒”表述上存在明确错误，下文第 3 节逐项更正。
4. **工程落地建议**：
   - **Step 2（当下最优先）**：用 **Bus Hound + 逻辑分析仪** 抓取原厂 `MCDTV5.exe` 真实下载过程（先只读握手/读页，再在可恢复板跑 CA033→CA034），彻底冻结协议。
   - **Step 3（首版方案）**：采纳 **“PC (115200 bps, 4KB 分块+CRC32) → MCU RAM 缓冲代理 → MS150 UART0”流式架构**，首版仅更新 E31 + DSP 且严格基于 `EB` 读回的真实分区表更新 `mv_length`，**不默认刷写二级 Boot 和 NV**。该方案天然兼容 8 MB 现板、2 MB 旧板及 NOR 故障降级状态；量产阶段再按需评估利用 `0x212000` 之后的 `reserved` 区做外置 Flash 整包暂存加速。

---

## 2. 硬件原理图与本地 MCU 源码（`work_v1_boot_fix @ 03b0abc3f4`）实核

以下引脚与驱动行为均已直接对照 `铱星NTN物联网终端-20260924(1)-原理图.pdf` 与本地源码 `board/board_config.h`、`applications/hw_power.c`、`board/ports/fal_cfg.h`、`drv_usart.c` 核实：

| 信号功能 | MCU (`U6`, HC32F460) | 中间电路 | NTN 模组 (`U7`, ST1000) | 实核结论与开发约束 |
| :--- | :--- | :--- | :--- | :--- |
| **NTN TX** | `PB4` (Pin 40, `USART3_TX`) | `R4 (0Ω)` → `U22 (TXB0104RUTR)` | Pin 32 (`UART0_RXD`) | 3.3V→1.8V；拆 `R3/R4` 可隔离 MCU 供原厂工具直连抓包 |
| **NTN RX** | `PB5` (Pin 41, `USART3_RX`) | `R3 (0Ω)` ← `U22 (TXB0104RUTR)` | Pin 33 (`UART0_TXD`) | 1.8V→3.3V；`TXB0104` 对容性负载敏感，1.5M 波形须实测 |
| **BOOT 控制** | `PA10` (Pin 31, `NTN_BOOT_PIN`) | `R47/R48` → `Q4 (DTC123JET1G)` | Pin 24 (`UART_BOOT`) | **硬件反相**：MCU 输出高=拉低 BOOTSEL 进下载，低=正常启动 |
| **复位控制** | `PA8` (Pin 29, `NTN_RST_PIN`) | `R7/R45` → `Q3 (DTC123JET1G)` | Pin 12 (`RESETN`) | **硬件反相**：MCU 输出高=拉低 RESETN 复位，低=释放运行 |
| **模组电源** | `PB15` (Pin 28, `NTN_PWR_EN_PIN`) | `R35/R36` → `Q7102 (DTC123JET1G)` → `Q1 (PMOS)` | Pin 18/19 (`VBAT1/2`) | 高电平导通 `VCC_ST1000` (3.76V)，支持硬断电救砖 |
| **RF PA 电源** | `PB0` (Pin 18, `PA_PWREN_PIN`) | `U8 (LMR14030)` | Pin 56/57 (`VCC_PA1/2`) | 4.16V/3.5A；串口刷机期间无需射频发射 |
| **唤醒 / 状态** | `PA15` (Pin 38) / `PB3` (Pin 39) | 经 `U22` | Pin 13 (`WAKEUP_IN`) / Pin 15 (`NET_STATUS`) | `PA15` 低有效保持唤醒，`PB3` 为状态输入 |
| **PC 上位机口** | `PA0` (`USART1_RX`) / `PA1` (`USART1_TX`) | `U4 (SP3232E)` → `J1` | — | 受 `SP3232E` 速率限制，上位机口固定 **115200 bps** |
| **外置 Flash** | `PB1/2/10/12/13/14` (`QSPI`) | 直连 | `U11` | 原理图标 `ZD25WQ16CEIGR (2MB)`，现板实为 `BY25Q64ES (8MB)` |

### MCU 现有源码 4 项必须提前处理的改造点

1. **`hw_power_ntn_set(RT_TRUE)` 会强制清除 BOOT 模式**：
   实查 `applications/hw_power.c` 第 104、112 行，该函数固定执行 `rt_pin_write(NTN_BOOT_PIN, PIN_LOW)`。进下载模式禁止复用它，必须新增独立的 `hw_ntn_enter_boot()` / `hw_ntn_exit_boot()`。
2. **USART3 1.5 Mbps 波特率精度与时钟源评估**：
   实查 `drv_usart.c` 与 `hc32_ll_usart.c`，驱动已启用 `USART_OVER_SAMPLE_8BIT` 与小数分频。在 `PCLK1 = 100 MHz` 下，`1500000 bps` 对应 `DIV_Integer = 7`、`DIV_Fraction = 118`，实际波特率 `1,501,464.8 bps`，理论误差仅 **`+0.098%`**。但 `board.c` 明确板卡无外部高速晶振（MPLL 源自内部 16 MHz HRC，温漂典型 ±1%–2%），叠加 `TXB0104RUTR` 带宽特性，须在实板上验证 `1500000 / 921600 / 460800 bps` 眼图与误码率。
3. **当前未启用 UART3 DMA 且轮询发送不等待 `TX_CPLT`**：
   `rtconfig.h` 虽定义 `RT_SERIAL_USING_DMA`，但未开启 `BSP_UART3_RX_USING_DMA` / `BSP_UART3_TX_USING_DMA`；`hc32_putc` 仅判 `USART_FLAG_TX_EMPTY`，且 `hc32_uart_rxerr_irq_handler` 遇溢出静默清标志丢字节。实现烧录引擎时：
   - 发送 `0x79`/`0x7A` 头部进入 **30 ms 延时前**，以及发送 `50 xx xx` 切换波特率前，**必须轮询等待 `USART_FLAG_TX_CPLT`** 确保最后一位停止位已发完；
   - 高速读取 256B 页（`0xEB`）期间禁止并发触发关中断长的 Flash 写操作，建议后续评估开启 UART3 DMA。
4. **线程独占与双重看门狗（`task_wdt` + BL1 SWDT）**：
   进入 NTN 升级会话时，必须暂停/互斥 `ntn_rx_thread_entry`、`ntn_service`、BLE `ctrl2_ntn_worker` 与 `app_telemetry` 路由，避免抢占 `uart1`/`uart3`；同时长耗时擦写期间必须持续喂 `task_wdt`（`rs232` 30s / `ble` 10s / `raw_tx` 10s / `ntn` 60s）与 BL1 硬件 `SWDT`（`boot/ota_icg.h` 配置周期约 26.2s）。

---

## 3. 员工3 旧版报告（11-11）自查勘误与多方分歧仲裁

本轮直接对照原始 `MCDTV5.exe` 反汇编、`MS150下载流程(1).pdf`、`sharkNTN/flashPartition.ini` 与本地 MCU 源码，对之前各员工报告中的冲突做如下定论：

| 争议 / 错误项 | 员工3（11-11 旧版） | 员工1 / 员工2 / 员工5 | 本轮原始证据直接核实结果（最终口径） |
| :--- | :--- | :--- | :--- |
| **`0x57` 清写保护接收判断** | 误写为单字节 `0x06` ACK | 员工2 指出走 **mode 7**（≥2B） | **员工2 正确，员工3 更正**：`0x14013E0D1`/`0x14013E1B3` 传 `mode=7`（`0x14013DD40: cmp ebx, 2`），且第 1 条调用未检返回值；TX 确为两条 10B 帧（末字节 `0x61`/`0x58`），真实 RX 格式与结束边界待抓包实锤 |
| **`0x55`/`0x50` 切速逻辑** | 笼统写先 `55 AA` 再 `50 09 A6` | 员工2 指出 57600 跳过 `55`，改速最多重试 5 次 | **实核确认**：`0x14013CBAB` 判 `0xE100 (57600)` 跳过 `55 AA`；`50 [idx] [chk]` 走 mode 8（首字节 `0x06`），之后 `Sleep(500)` 并最多 5 次尝试本地改速 |
| **`T_Header_5gNew` 布局与默认地址** | 把 `manu_part` 放在 `fixed_part_t` 外导致全表错位 +12B；地址写成 `0x1000`/`0x24000`/`0x2D4000` | 员工1/2 推导 E31 `mv_length` 在 `0x78`、DSP 在 `0x84`，默认 `0x28000`/`0x3A8000` | **员工1/2 正确，员工3 重大更正**：PDF 第 5–6 页确认 `fixed_part_t=88B`（含 `manufacture_part` 与 `sec_addr=0x8000`），`firmware` 在 `0x70` (`mv_length` `0x78`)，`dsp0_code` 在 `0x7C` (`mv_length` `0x84`)；`sharkNTN/flashPartition.ini` 确为 `S_ADDR=0x8000`、E31 `0x28000` (`0x380000`)、DSP `0x3A8000` (`0x60000`)。实烧以 `EB` 读回表为准 |
| **NV 编译脚本与刷写策略** | 宣称 `compile_nv_xml.py` 已生成 422B 并建议写双分区 | 员工1/2 指出脚本未经黄金样本验证且地址冲突，首版禁写 NV | **员工1/2 正确，并发现新实锤缺陷**：PDF 第 8 页 Bus Hound 原图显示 `02 00 4c 40 00 | 00 00 01 01 | 31 2e 36 ...`，证明 `CurrentVersion("1.6\0")` 紧跟 Magic 序列化；旧脚本读了该字段却未写入 `buf` 导致全镜像错位 4B。且 `0x4C4000`/`0x4C6000` 与 `NV_BACKUP_ADDR=0x56F000` 冲突。**结论：首版严禁默认刷写 NV 与二级 Boot** |
| **外置 Flash 容量与 FAL 分区** | 误写 `onchip_flash_1024k` 且占 `0x200000` 6MB | 员工5 据原理图标注认为仅 2MB 无法暂存 | **真相查清**：原理图标 `ZD25WQ16CEIGR (2MB)`，现板已换 `BY25Q64ES (8MB)`；但 MCU OTA 已占 `0x000000..0x211FFF`，可用 `reserved` 为 `0x212000..0x7FFFFF`（≈5.93 MiB）。旧报告 `0x200000` 会破坏 MCU OTA `ota_scratch` |
| **引脚与耗时笔误** | `USART1` PA0/PA1 写反、`WAKEUP` 错写 PB3、宣称 20~30s 整包 | 员工2/5 纠正引脚并指出 115200 整机约 4.5~5.5 分钟 | **更正确认**：`PA0=RX, PA1=TX`；`PA15=WAKEUP, PB3=STATUS`；CA034（E31+DSP = 2,583,790B）经 RS232 115200 仅纯载荷即 224.3s，总耗时约 4.5~5.5 分钟 |

---

## 4. 2026-11-26 核心评估：使用 Bus Hound 监控 UART 实际下载协议

### 4.1 明确结论：**可以，且有官方原图实锤**

- 智联安官方《MS150固件下载流程 Rev 1.4》第 7–8 页中的抓包示例：
  ```text
  46  OUT  20 00 4c 40 00 d3
  46  IN   06
  71  46  OUT  02 00 4c 60 00 00 00 01 01 31 2e 36 ...
  ```
  就是标准的 **Bus Hound** 抓取记录（Device ID `46`、Phase `OUT`/`IN`、Seq `70`/`71`）。
- **适用前提**：PC 运行原厂 `MCDTV5.exe` 通过 **USB 转串口适配器（CH340 / FT232 / CP2102 / PL2303）** 直连 ST1000/MS150 的 `UART0`（1.8V TTL 适配器，或经 `U22` 后的 3.3V TTL 侧——如在样板上拆掉 `R3/R4` 隔离 MCU 后飞线）。对于老式主板原生 RS232（Legacy 16550），Bus Hound 支持很差；且严禁试图把 1.5 Mbps 走板载 `SP3232E`。

### 4.2 Bus Hound 实操的 5 个关键避坑点

| 序号 | 常见问题 / 陷阱 | 后果 | 必做规避配置 |
| :---: | :--- | :--- | :--- |
| **1** | **默认 `Max Phase` 过小（32~64B）** | `0xEB` (256B)、`0x32` (262B)、`0x79` (65,542B) 被截断，看不全帧尾与校验和 | `Settings -> Max Phase` 必须设为 **≥ 65542（建议 131072）** |
| **2** | **免费版（Free Edition）缓冲受限** | CA034 单次 E31 下载达 2.5 MB，免费版极易循环覆盖或无法抓取完整大包 | 使用**正式完整版**并将 `Buffer Size` 调至 **32~64 MB**；或按 CAP01~CAP05 **分段只抓关键步骤** |
| **3** | **USB 总线层 vs COM 端口层混淆** | 若勾选 USB 设备节点，**FTDI 每 64B Bulk IN 会自带 2B 状态头（如 `01 60`）**，CH340 切速显示为 Vendor Control Request，极易误当成 MS150 协议字节 | 优先确认是否可见 `Ports (COMx)` 串口节点；若挂 USB 节点抓包，**解码时必须剔除芯片私有状态头**，并优先使用无额外包头污染的适配器或同步用串口层工具对照 |
| **4** | **漏勾控制事件或后启动监控** | 看不到 `SET_BAUD_RATE` 切速点，或丢掉前几条握手帧 | 在 `MCDTV5.exe` **打开 COM 口前**点 `Run`；勾选 `IN`、`OUT`、`CTL`（含 Serial IOCTL）、`USTS`、`TIME`、`DELTA`；以文本/原始格式完整导出，不只截图 |
| **5** | **把软件时间戳当成物理线时序** | Windows IRP/USB 1 ms 轮询帧 + 芯片 FIFO（如 FTDI 默认 16 ms Latency Timer）会掩盖真实 30 ms 间隔与 1.5M 切速瞬间 | **严禁仅凭 Bus Hound 判定 30 ms 容差或切速 ACK 的波特率归属**，必须同步并联硬件逻辑分析仪 |

### 4.3 推荐的最佳抓包组合方案（软件 + 硬件双保险）

1. **软件侧（协议字节全量复核）**：
   - **主选**：**Bus Hound（完整版大缓冲）**，或使用面向 Windows Serial IRP 层的专业串口监控工具（如 **IO Ninja Serial Monitor** / **HHD Device Monitoring Studio**），可直接捕获纯净的 `IRP_MJ_WRITE` / `IRP_MJ_READ` 与 `IOCTL_SERIAL_SET_BAUD_RATE`（完全无 FTDI/CH340 USB 封包噪音）。
   - **开源零限流备选**：**Wireshark + USBPcap**（无免费版容量上限，本机 `MCDT_5.4` 目录内已自带 Wireshark）。
2. **硬件侧（物理时序与信号完整性仲裁，强烈建议并行）**：
   - 使用 **≥ 24 MHz（推荐 50–100 MHz）逻辑分析仪**，4 通道同步高阻采集：`UART0_TXD`、`UART0_RXD`、`BOOTSEL`、`RESETN`（注意匹配 1.8V 或 `U22` MCU 侧 3.3V 阈值，共地，**严禁接触 RS232 ±12V 侧**）；必要时用示波器看 `TXB0104RUTR` 在 1.5 Mbps 下的边沿振铃。
3. **P0 必抓验证清单（关闭全部静态遗留争议）**：
   - **CAP01（只读）**：`BOOTSEL/RESETN` 脉冲 → 连续 `'U' (0x55)` → `C0 3F` 完整应答；
   - **CAP02（只读，P0）**：两条 10B `0x57` 清写保护指令的**完整 RX 字节、结束符及残留字节情况**；
   - **CAP03（只读，P0）**：`55 AA`、`50 09 A6`（切 1.5M）、`50 04 AB`（回 115200）时，`0x06` 是在旧速还是新速发出、以及 500 ms 切速窗口；
   - **CAP04（只读，P0）**：`EB 00 00 00 00 14` 返回的精确字节数（验证是否纯 256B 无额外 ACK），读取并备份板卡真实分区表；
   - **CAP05（获准测试板，P0）**：`79` (64KB) 与 `7A` (<64KB) 的头部字节、头后真实物理间隔（是否严格 30 ms）、以及数据+CHK 后的最终应答；
   - **CAP06（获准测试板）**：`20`/`D8` 擦除、`32` 回写分区表及升级后 `ATI`/`AT+CGMR` 与驻网验证。

---

## 5. 推荐执行路线图

1. **Step 2（协议抓包定版）**：先在可恢复测试板上按 CAP01~CAP04（只读）→ CAP05~CAP06（写入）执行 **Bus Hound + 逻辑分析仪** 联合抓包，产出唯一无歧义的协议规范与黄金向量。
2. **Step 3（首版 MCU/PC 工程实现）**：
   - 采用 **PC (115200 bps, 4KB 分块+序号+CRC32) → HC32F460 RAM 代理 → MS150 UART0（实测选定 460800/921600/1500000 bps）**；
   - 仅更新 E31 + DSP，按 `EB` 读回分区表原样保留 `fixed_inf` 及其他分区，仅更新对应 `mv_length`，全部块写完并读回校验通过后再擦写 0 地址分区表；
   - 新增独立 `hw_ntn_enter_boot()` / `hw_ntn_exit_boot()`、独占 UART1/UART3 会话、`USART_FLAG_TX_CPLT` 硬件发完等待及 `task_wdt` + `SWDT` 喂狗保障。
3. **Step 4（量产增强，按需评估）**：待流式方案稳定验收后，再评估是否基于 8 MB `BY25Q64ES` 的 `0x212000` 之后 `reserved` 空间（≈5.93 MiB）实现外置 Flash 整包暂存与断点续刷。
