# Herobrine (Minecraft) — NovaFlare Engine 移植

Minecraft 都市传说 Herobrine 主题周，移植到 **NovaFlare Engine 1.2.1**（Psych Engine 0.73 深度改写，含 Psych 1.0 特性）的 mods 格式。

## 周内容

| 顺序 | 歌曲 ID | 对手 |
|---|---|---|
| 1 | `recreated` | herobrine |
| 2 | `danger` | herobrine |
| 3 | `little-herobrine` | herobrine |

玩家角色为 `slender`（`flip_x: true`，朝左）。

## 难度

- **Hard** —— 原 Normal 谱面重命名而来
- **Hardcore** —— 原 Him 模组自带的硬核谱面
- Easy / Normal 已移除；`weeks/weekHero.json` 中 `difficulties` 为 `"Hard,Hardcore"`

谱面文件对应关系：

```
data/<song>/<song>-hard.json       ->  Hard
data/<song>/<song>-hardcore.json   ->  Hardcore
```

## 舞台 woods

原版天空/树林美术保持 1:1（不缩放变形），只把画布向四周延展，让镜头横向跟随与变焦时始终铺满，**不再出现黑边**：

| 素材 | 尺寸 | 用途 |
|---|---|---|
| `images/woods/sky_wide.png` | 3000×1400 | 星空 + 立方体月亮，光晕按径向剖面继续向外扩散 |
| `images/woods/woods_wide.png` | 4072×1521 | 卡通树林，左右镜像拼接（接缝天然连续） |

`stages/woods.lua` 中放置参数：

```lua
makeLuaSprite('sky',   'woods/sky_wide',   -1502.9, -640.0)   -- scale 1.4286
makeLuaSprite('woods', 'woods/woods_wide', -753.3,  -160.4)   -- scale 0.6843
```

已按 6 个镜头位置（`cx` 0/400/900/1200、`zoom` 0.7/0.8/0.9）做全覆盖自检，露底像素为 0。

## 安装

1. 把整个文件夹放进引擎的 `mods/` 目录，目录名 `Herobrine`；
2. `modsList.txt` 增加一行 `Herobrine|1`；
3. 启动引擎，故事模式选择 Herobrine 周。

## 完整资源包（永久分享）

音频（Inst/Voices）、角色贴图、难度图标等二进制素材体积较大，放在百度网盘：

- 链接：https://pan.baidu.com/netdisk/share?surl=ddJFGAps2n3mvvH3ceP-3A
- 提取码：`hb01`
- 有效期：**永久**

包内为可直接解压到 `mods/` 的完整 mod 目录（64 个文件，约 20.7 MB）。

## 宣传片（60 秒）

以代码逐帧渲染（PIL → ffmpeg 管道编码），视觉语言取自 Claude / Anthropic 的纸感界面风格：米白 `#FAF9F5` 画布、卡片 `#F0EEE6`、墨黑 `#141413`、唯一强调色珊瑚 `#D97757`、衬线大标题 + 无衬线正文、统一 0.8s expo 缓出。

- 规格：1920×1080 / 30fps / 60.00s / H.264 + AAC（配乐，响度 −14 LUFS）
- 分镜：封面 → 三曲清单 → 双难度 → woods 满屏横移 → 移植说明 → **实机演示** → 深色收尾
- 实机页版式：左题目「实机一局」、中 danger · Hardcore 实录、右来源署名
- 下载：https://pan.baidu.com/netdisk/share?surl=VmCsZSyxXPYY__W76Nk8sA
- 提取码：`hb01`　有效期：**永久**

### 实机素材来源

实机画面取自 B 站 UP 主 **Austinキ** 的《[FNF] him 单曲 danger 难度 hardcore 1.2x》（`BV1XSEt6EEe9`），截取原片 00:46–00:56，未做裁改与合成；版权归原作者，本片仅作演示与出处标注。

## 目录

```
pack.json                      mod 元信息
weeks/weekHero.json            周配置（歌曲顺序、难度、背景）
stages/woods.json              舞台坐标与 defaultZoom 0.7
stages/woods.lua               背景精灵加载与层级
characters/*.json              角色动画与朝向
images/menudifficulties/       Hard / Hardcore 难度牌
images/storymenu/difficulties/ 故事模式难度牌
data/credits.txt               制作人员
promo/README.md                宣传片分镜、设计 token 与素材出处
```

## 制作

- 移植 / 制作：Doubao（597622）
