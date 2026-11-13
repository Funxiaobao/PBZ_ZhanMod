-- PBZ 斩字测试 Mod  v0.1
-- 目的：只验证「按键能进到 Lua」这条通路，先别管效果
-- 日志：游戏根目录 platform\steam\ue4ss\UE4SS.log  搜 [ZhanMod]

local function log(s)
    print("[ZhanMod] " .. tostring(s) .. "\n")
end

log("main.lua loaded")

local function getName(obj)
    local ok, n = pcall(function() return obj:GetFullName() end)
    if ok and n then return n end
    return "<no-name>"
end

local function onKey()
    log("=== K pressed ===")

    local pc = nil
    pcall(function()
        pc = UEHelpers.GetPlayerController()
    end)
    if not pc then
        log("PlayerController 还没拿到，先读档进场景再按")
        return
    end
    log("PC: " .. getName(pc))

    local world = nil
    pcall(function() world = pc:GetWorld() end)
    log("World: " .. getName(world))

    -- 试着摸 HUD / GameViewport，斩字如果是 UMG 就挂在它们下面
    local hud = nil
    pcall(function() hud = pc.HUD end)
    log("HUD: " .. getName(hud))

    -- 扫一遍已加载的 Class，找名字里带关键词的
    local keys = { "BossKill", "Zhan", "Letter", "UIBlend", "Exec", "Chuzhan" }
    local found = 0
    local ok = pcall(function()
        local classes = FindAllOf("Class")
        if not classes then return end
        for _, c in ipairs(classes) do
            local n = getName(c)
            local hit = false
            for _, k in ipairs(keys) do
                if n:lower():find(k:lower(), 1, true) then hit = true break end
            end
            if hit then
                log("CLASS " .. n)
                found = found + 1
                if found > 60 then break end
            end
        end
    end)
    if not ok then log("Class 扫描失败，可能是 API 版本差异") end
    log("扫到 " .. found .. " 个候选类")

    log("=== done, 把 UE4SS.log 发我 ===")
end

-- 两种 API 签名都试试，不同 UE4SS 版本不一样
local bound = false
pcall(function()
    RegisterKeyBind(Key.K, onKey)
    bound = true
    log("bind ok: RegisterKeyBind(Key.K, fn)")
end)
if not bound then
    pcall(function()
        RegisterKeyBind(ModifierKey.NONE, Key.K, onKey)
        bound = true
        log("bind ok: RegisterKeyBind(NONE, Key.K, fn)")
    end)
end
if not bound then
    log("按键绑定失败！UE4SS 版本可能太老，或者改成 F8 试试")
end
