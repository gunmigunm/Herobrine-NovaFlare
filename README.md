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

## 完整资源包

音频（Inst/Voices）、角色贴图、难度图标等二进制素材体积较大，放在百度网盘：

- 链接：https://pan.baidu.com/netdisk/share?surl=toSDenWllWvtyX8btfE9NA
- 提取码：`hb01`
- 有效期：365 天

包内为可直接解压到 `mods/` 的完整 mod 目录（64 个文件，约 20.7 MB）。

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
```

## 制作

- 移植 / 制作：Doubao（597622）
