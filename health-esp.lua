-- yes just like the weakest dummy but worse sadly

local hg78 = game:GetService("Players")
local rt45 = game:GetService("RunService")
local pl12 = hg78.LocalPlayer
local cm89 = workspace.CurrentCamera

if _G.femboylovers76 then
    for p, d in pairs(_G.femboylovers76) do
        if d.mango then
            d.mango:Destroy()
        end
    end
    _G.femboylovers76 = nil
    return
end

_G.femboylovers76 = {}
local tx56 = {}

local function cr23(qw67)
    if _G.femboylovers76[qw67] then
        _G.femboylovers76[qw67].mango:Destroy()
    end
    
    local bb90 = Instance.new("BillboardGui")
    bb90.Name = "mango"
    bb90.AlwaysOnTop = true
    bb90.Size = UDim2.new(4, 0, 2, 0)
    bb90.StudsOffset = Vector3.new(0, 2.5, 0)
    bb90.Adornee = nil
    bb90.MaxDistance = 150
    bb90.Parent = qw67.Character and qw67.Character:FindFirstChild("Head") or nil
    bb90.Enabled = false
    
    local tl11 = Instance.new("TextLabel")
    tl11.Name = "mango"
    tl11.Size = UDim2.new(1, 0, 1, 0)
    tl11.Position = UDim2.new(0.5, 0, 0.5, 0)
    tl11.AnchorPoint = Vector2.new(0.5, 0.5)
    tl11.BackgroundTransparency = 1
    tl11.Text = "100%"
    tl11.TextColor3 = Color3.fromRGB(220, 220, 220)
    tl11.TextStrokeColor3 = Color3.new(0, 0, 0)
    tl11.TextStrokeTransparency = 0.4
    tl11.TextSize = 18
    tl11.Font = Enum.Font.Arcade
    tl11.Parent = bb90
    
    _G.femboylovers76[qw67] = {
        mango = bb90,
        a = 100,
        b = 0,
        c = Color3.fromRGB(220, 220, 220),
        d = Color3.fromRGB(220, 220, 220),
        e = 18,
        f = 18
    }
    
    tx56[qw67] = 0
    
    return bb90
end

local function lp99(a, b, t)
    return a + (b - a) * math.clamp(t, 0, 1)
end

local function lc44(c1, c2, t)
    return Color3.new(
        lp99(c1.R, c2.R, t),
        lp99(c1.G, c2.G, t),
        lp99(c1.B, c2.B, t)
    )
end

local function ud87()
    for p, d in pairs(_G.femboylovers76) do
        if p and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character:FindFirstChild("Head") then
            local hm22 = p.Character.Humanoid
            local hd33 = p.Character.Head
            
            if d.mango.Adornee ~= hd33 then
                d.mango.Adornee = hd33
                d.mango.Parent = hd33
            end
            
            local hp55 = math.floor((hm22.Health / hm22.MaxHealth) * 100)
            d.mango.Text = tostring(hp55) .. "%"
            
            if hm22.Health < d.a then
                d.b = tick()
                d.d = Color3.fromRGB(180, 30, 30)
            elseif tick() - d.b > 1 then
                d.d = Color3.fromRGB(220, 220, 220)
            end
            
            d.c = lc44(d.c, d.d, 0.3)
            d.mango.TextColor3 = d.c
            
            local ds66 = (pl12.Character and pl12.Character:FindFirstChild("Head") and 
                (hd33.Position - pl12.Character.Head.Position).Magnitude or math.huge)
            
            local sc77 = math.clamp(1 - (ds66 / 150) * 0.5, 0.5, 1)
            d.f = 18 * sc77
            
            d.e = lp99(d.e, d.f, 0.15)
            d.mango.TextSize = d.e
            
            local tp88 = math.clamp((ds66 / 150) * 2, 0, 0.8)
            tx56[p] = lp99(tx56[p], tp88, 0.15)
            d.mango.TextTransparency = tx56[p]
            d.mango.TextStrokeTransparency = tx56[p] + 0.2
            
            d.a = hm22.Health
            
            d.mango.Enabled = ds66 <= 150
        else
            if d.mango then
                d.mango.Enabled = false
            end
        end
    end
end

local function in10(p)
    if _G.femboylovers76[p] then
        _G.femboylovers76[p].mango:Destroy()
        _G.femboylovers76[p] = nil
    end
    
    local ca09 = function(c)
        wait(0.5)
        if not _G.femboylovers76[p] then
            cr23(p)
        end
    end
    
    if p.Character then
        spawn(function()
            wait(0.5)
            if not _G.femboylovers76[p] then
                cr23(p)
            end
        end)
    end
    
    p.CharacterAdded:Connect(ca09)
    p.CharacterRemoving:Connect(function()
        if _G.femboylovers76[p] and _G.femboylovers76[p].mango then
            _G.femboylovers76[p].mango.Enabled = false
        end
    end)
end

for _, p in ipairs(hg78:GetPlayers()) do
    in10(p)
end

hg78.PlayerAdded:Connect(in10)

hg78.PlayerRemoving:Connect(function(p)
    if _G.femboylovers76[p] then
        _G.femboylovers76[p].mango:Destroy()
        _G.femboylovers76[p] = nil
    end
end

rt45.RenderStepped:Connect(ud87)

for _, p in ipairs(hg78:GetPlayers()) do
    if p.Character then
        spawn(function()
            wait(0.5)
            cr23(p)
        end)
    end
    p.CharacterAdded:Connect(function(c)
        wait(0.5)
        cr23(p)
    end)
end
