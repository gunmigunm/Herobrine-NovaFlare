# 宣传片制作说明（60s / 1920×1080 / 30fps）

以代码逐帧绘制，不依赖任何模板或视频生成模型。渲染器 `render_promo.py` 用 Pillow 合成单帧，直接把 RGB 帧写入 ffmpeg stdin，再与配乐混流成片。

## 视觉语言

源自 Claude / Anthropic 的纸感界面风格，抽成设计 token：

| token | 值 | 用途 |
|---|---|---|
| PAPER | `#FAF9F5` | 主画布（刻意不用纯白） |
| CARD | `#F0EEE6` | 卡片底 |
| INK | `#141413` | 标题与正文 |
| MUTED | `#5E5D59` | 次文本 |
| HAIR | `#D1CFC5` | 发丝分隔线 |
| CORAL | `#D97757` | 唯一强调色 |
| DARK | `#141413` | 深色场景底色 |

- 标题：Georgia（衬线，≈Copernicus 的开源替代）；中文用微软雅黑 / 宋体
- 小标：Consolas 等宽字（仅用于拉丁文，避免中文豆腐块）
- 缓动：统一 `cubic-bezier(0.16,1,0.3,1)`，时长 0.8s，位移 22~34px
- 网格：12 栏，内容区 x = 132 ~ 1788
- 纸纹：米白场景 alpha 3 / 深色场景 alpha 2，叠加高斯模糊，避免脏噪点

## 分镜（7 页）

| 时间 | 内容 |
|---|---|
| 0–7s | 封面：Herobrine 大字 + NovaFlare 副题 + 周期信息 |
| 7–16s | 三曲清单（recreated / danger / little-herobrine）+ woods 背景卡片 |
| 16–24s | 双难度：Hard（重制）/ Hardcore（Him 原版） |
| 24–34s | woods 舞台满屏横移，演示无黑边 |
| 34–41s | 移植说明（引擎、舞台、构建、制作） |
| 41–51s | 实机演示：左题目 / 中 danger · Hardcore 实录 / 右来源署名 |
| 51–60s | 深色收尾，末 1.2s 收黑 |

## 实机页素材

- 来源：B 站 UP 主 **Austinキ**，《[FNF] him 单曲 danger 难度 hardcore 1.2x》，`BV1XSEt6EEe9`
- 截取原片 00:46–00:56，30fps 抽成 300 帧 PNG（`bili/seq/f%04d.png`），面板按 680×426 内容区裁切后缩放至 760×477
- 页面只做缓慢推近（1.00→1.03）与入场淡入，不改画面本体
- 版权归原作者，仅作演示与出处标注

## 声音

纯配乐、无旁白：暖氛围电子 + 稀疏钢琴 + 木质低频，76BPM，60.00s；混流时做一次 loudnorm（I=−14 / TP=−1.5 / LRA=11），实测成片 −14.32 LUFS / −1.43 dBTP。

## 成片

https://pan.baidu.com/netdisk/share?surl=VmCsZSyxXPYY__W76Nk8sA （提取码 `hb01`，永久）

> 二进制成片与实机帧序列不入仓库，仓库只保留说明与参数，方便重渲。上一版（6 页、无实机页）在网盘保留为 `Herobrine_NovaFlare_promo_60s_v1.mp4`。
