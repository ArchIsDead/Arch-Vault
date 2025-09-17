-- use Animation detection soo it sill not work to exploiters who use no animations

local p = game:GetService("Players")
local r = game:GetService("RunService")

local m = p.LocalPlayer
local a = {
    [10479335397] = true,
    [15955393872] = true,
    [16310343179] = true,
    [15943915877] = true,
    [16023456135] = true,
    [15944317351] = true,
    [15997042291] = true,
    [16311141574] = true,
    [18181589384] = true,
    [131492147325921] = true,
    [13380255751] = true
}

local c = {}

local function u(h)
    local b = Instance.new("BillboardGui")
    b.Adornee = h
    b.Size = UDim2.new(4, 0, 1, 0)
    b.StudsOffset = Vector3.new(0, 2.5, 0)
    b.AlwaysOnTop = true
    b.MaxDistance = 50
    b.LightInfluence = 0
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 1, 0)
    t.BackgroundTransparency = 1
    t.Text = "5.0s"
    t.TextColor3 = Color3.fromRGB(255, 50, 50)
    t.TextScaled = true
    t.Font = Enum.Font.SourceSansBold
    t.TextStrokeTransparency = 0.5
    t.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    t.Parent = b
    b.Parent = h
    
    return t
end

local function s(p)
    if p == m or c[p] then return end
    
    local x = p.Character
    if not x then return end
    
    local h = x:FindFirstChild("Head")
    if not h then return end
    
    c[p] = true
    local t = u(h)
    local o = os.clock()
    
    local n
    n = r.Heartbeat:Connect(function()
        if not p.Parent or not t.Parent then
            n:Disconnect()
            c[p] = nil
            return
        end
        
        local e = os.clock() - o
        local l = math.max(0, 5 - e)
        
        if l <= 0 then
            t.Text = "0.0s"
            t.Parent:Destroy()
            n:Disconnect()
            c[p] = nil
            return
        end
        
        t.Text = string.format("%.1fs", l)
        local g = l / 5
        t.TextColor3 = Color3.new(1, g, g * 0.5)
    end)
end

local function d(p)
    if p == m then return end
    
    local function f(x)
        local y = x:WaitForChild("Humanoid", 2)
        if y then
            y.AnimationPlayed:Connect(function(z)
                local i = z.Animation and z.Animation.AnimationId
                if i and a[tonumber(i:match("%d+"))] then
                    s(p)
                end
            end)
        end
    end
    
    if p.Character then
        f(p.Character)
    end
    p.CharacterAdded:Connect(f)
end

for _, p in ipairs(p:GetPlayers()) do
    task.spawn(d, p)
end

p.PlayerAdded:Connect(d)
p.PlayerRemoving:Connect(function(p)
    c[p] = nil
end)
