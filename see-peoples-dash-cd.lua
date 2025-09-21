-- hello there skids.

local P = game:GetService("Players")
local R = game:GetService("RunService")

if _G.E == nil then
    _G.E = true
else
    _G.E = not _G.E
end

if not _G.E then
    for _, p in ipairs(P:GetPlayers()) do
        if p.Character then
            local h = p.Character:FindFirstChild("Head")
            if h then
                local e = h:FindFirstChild("E")
                if e then
                    e:Destroy()
                end
            end
        end
    end
    return
end

local M = P.LocalPlayer
local A = {
    [10480796021] = "s",
    [10480793962] = "s", 
    [10491993682] = "m",
    [10479335397] = "m",
    [15955393872] = "m",
    [16310343179] = "m",
    [15943915877] = "m",
    [16023456135] = "m",
    [15944317351] = "m",
    [15997042291] = "m",
    [16311141574] = "m",
    [18181589384] = "m",
    [131492147325921] = "m",
    [13380255751] = "m"
}

local C = {}
local T = {
    m = 5,
    s = 2
}

local function U(h)
    local b = Instance.new("BillboardGui")
    b.Name = "E"
    b.Adornee = h
    b.Size = UDim2.new(8, 0, 3, 0)
    b.StudsOffset = Vector3.new(0, 3.5, 0)
    b.AlwaysOnTop = true
    b.MaxDistance = 100
    b.LightInfluence = 1
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 1, 0)
    t.BackgroundTransparency = 1
    t.Text = ""
    t.TextColor3 = Color3.new(1, 1, 1)
    t.TextStrokeColor3 = Color3.new(0, 0, 0)
    t.TextStrokeTransparency = 0
    t.TextScaled = true
    t.Font = Enum.Font.SourceSansBold
    t.TextYAlignment = Enum.TextYAlignment.Center
    
    t.Parent = b
    b.Parent = h
    
    return t
end

local function S(p, d)
    if not _G.E then return end
    
    local x = p.Character
    if not x then return end
    
    local h = x:FindFirstChild("Head")
    if not h then return end
    
    if not C[p] then
        C[p] = {
            m = {a = false, e = 0},
            s = {a = false, e = 0},
            u = nil
        }
    end
    
    local o = C[p]
    
    if not o.u or not o.u.Parent then
        o.u = U(h)
    end
    
    local n = os.clock()
    local e = n + T[d]
    
    if d == "m" then
        o.m = {a = true, e = e}
    else
        o.s = {a = true, e = e}
    end
    
    local c
    c = R.Heartbeat:Connect(function()
        if not _G.E or not p.Parent or not o.u or not o.u.Parent then
            c:Disconnect()
            if C[p] then
                if C[p].u then C[p].u:Destroy() end
                C[p] = nil
            end
            return
        end
        
        local t = os.clock()
        local mr = math.max(0, o.m.e - t)
        local sr = math.max(0, o.s.e - t)
        
        if mr <= 0 then
            o.m.a = false
        end
        if sr <= 0 then
            o.s.a = false
        end
        
        if not o.m.a and not o.s.a then
            o.u:Destroy()
            c:Disconnect()
            C[p] = nil
            return
        end
        
        local mt = string.format("Front/Back Dash: %.1fs", mr)
        local st = string.format("Left/Right Side Dash: %.1fs", sr)
        
        if o.m.a and o.s.a then
            o.u.Text = mt .. "\n" .. st
        elseif o.m.a then
            o.u.Text = mt
        else
            o.u.Text = st
        end
        
        o.u.TextColor3 = Color3.new(1, 1, 1)
    end)
end

local function D(p)
    local function F(x)
        local y = x:WaitForChild("Humanoid", 2)
        if y then
            y.AnimationPlayed:Connect(function(z)
                local i = z.Animation and z.Animation.AnimationId
                if i then
                    local id = tonumber(i:match("%d+"))
                    if A[id] then
                        S(p, A[id])
                    end
                end
            end)
        end
    end
    
    if p.Character then
        F(p.Character)
    end
    p.CharacterAdded:Connect(F)
end

for _, p in ipairs(P:GetPlayers()) do
    task.spawn(D, p)
end

P.PlayerAdded:Connect(D)
P.PlayerRemoving:Connect(function(p)
    if C[p] then
        if C[p].u then C[p].u:Destroy() end
        C[p] = nil
    end
end)

D(M)
