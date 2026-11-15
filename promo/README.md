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
- 小标：Consolas等宽字（仅用于拉丁文，避免中文豆腐块）
- 缓动：统一 `cubic-bezier(0.16,1,0.3,1)`，时长 0.8s，位移 22~34px
- 网格：12 栏，内容区 x = 138 ~ 1782
- 纸纹：米白场景 alpha 3 / 深色场景 alpha 2，叠加高斯模糊，避免脏噪点

## 分镜

| 时间 | 内容 |
|---|---|
| 0–8s | 封面：Herobrine 大字 + NovaFlare 副题 + 周期信息 |
| 8–20s | 三曲清单（recreated / danger / little-herobrine）+ woods 背景卡片 |
| 20–30s | 双难度：Hard（重制）/ Hardcore（Him 原版） |
| 30–44s | woods 舞台满屏横移，演示无黑边 |
| 44–52s | 移植说明（引擎、舞台、构建、制作） |
| 52–60s | 深色收尾，末 1.2s 收黑 |

## 声音

纯配乐、无旁白：暖氛围电子 + 稀疏钢琴 + 木质低频，76BPM，60.00s；混流时做一次 loudnorm（I=−14 / TP=−1.5 / LRA=11），实测成片 −14.32 LUFS / −1.43 dBTP。

## 成片

https://pan.baidu.com/netdisk/share?surl=cB3BCYxBIAKMrTwhVwCLJw （提取码 `hb01`，永久）

> 二进制成片不入仓库，仓库只保留说明与参数，方便重渲。
