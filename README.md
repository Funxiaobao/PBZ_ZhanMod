# PBZ_ZhanMod

影之刃零（Phantom Blade Zero）的 UE4SS Lua 测试 Mod，v0.1。

目的只有一个：验证按键能不能进到 Lua、能不能摸到游戏对象。**不保证任何视觉效果。**

## 下载

不用会 Git，直接点右边 Releases → 下载 `PBZ_ZhanMod-v0.1.zip`，解压得到一个 `PBZ_ZhanMod` 文件夹。

## 用法

1. 确认游戏根目录已装 UE4SS（`platform\steam\ue4ss\`）。
2. 把解压出的整个 `PBZ_ZhanMod` 文件夹丢进 UE4SS 的 `Mods` 目录（最终路径 `...\ue4ss\Mods\PBZ_ZhanMod\Scripts\main.lua`）。
3. 在 `mods.txt` 里加一行 `PBZ_ZhanMod : 1`。
4. 读档进场景后按 **K**。
5. 看 `platform\steam\ue4ss\UE4SS.log`，搜 `[ZhanMod]`。

## 当前逻辑

- `main.lua` 加载时打一行 `main.lua loaded`
- 按 K：打印 PlayerController / World / HUD 的 FullName
- 遍历已加载 Class，按关键词（`BossKill` `Zhan` `Letter` `UIBlend` `Exec` `Chuzhan`）找可疑 UMG

## 安装

详细图文步骤见 [安装教程.md](安装教程.md)，含前置、验证、常见问题和卸载。

装不上或日志有报错，开个 Issue 把 `UE4SS.log` 里 `[ZhanMod]` 那几行贴上来。
