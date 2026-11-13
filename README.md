# PBZ_ZhanMod

影之刃零（Phantom Blade Zero）的 UE4SS Lua 测试 Mod，v0.1。

目的只有一个：验证按键能不能进到 Lua、能不能摸到游戏对象。**不保证任何视觉效果。**

## 用法

1. 确认游戏根目录已装 UE4SS（`platform\steam\ue4ss\`）。
2. 把整个 `PBZ_ZhanMod` 文件夹丢进 UE4SS 的 mods 目录。
3. 确保 `enabled.txt` 在，且在 `mods.txt` 里启用。
4. 读档进场景后按 **K**。
5. 看 `platform\steam\ue4ss\UE4SS.log`，搜 `[ZhanMod]`。

## 当前逻辑

- `main.lua` 加载时打一行 `main.lua loaded`
- 按 K：打印 PlayerController / World / HUD 的 FullName
- 遍历已加载 Class，按关键词（`BossKill` `Zhan` `Letter` `UIBlend` `Exec` `Chuzhan`）找可疑 UMG

## 安装

详细步骤见 [INSTALL.md](INSTALL.md)。
