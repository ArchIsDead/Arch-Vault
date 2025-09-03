-- is ts tuff?

local P = game:GetService("Players")
local R = game:GetService("RunService")
local U = game:GetService("UserInputService")
local T = game:GetService("TweenService")
local L = P.LocalPlayer
local C = workspace.CurrentCamera
local G = game:GetService("CoreGui")

local a = getgenv().camlock or {}
getgenv().camlock = a

a.E = a.E or false
a.X = a.X or 0.1551
a.Y = a.Y or 0.12
a.J = a.J or -0.08
a.F = a.F or 0.27
a.P = a.P or "Head" -- Put Anything yo want, head or leg or torso, idk you choose 
a.T = a.T or nil
a.A = a.A == nil and true or a.A
a.O = a.O == nil and true or a.O

local function f()
    local b, d = C.ViewportSize.X / 2, C.ViewportSize.Y / 2
    local e, h = nil, math.huge
    for _, i in ipairs(P:GetPlayers()) do
        if i ~= L and i.Character and i.Character:FindFirstChild(a.P) then
            local j = i.Character[a.P]
            local k, l = C:WorldToScreenPoint(j.Position)
            if l then
                local m, n = k.X - b, k.Y - d
                local o = math.sqrt(m * m + n * n)
                if o < h then
                    h, e = o, i
                end
            end
        end
    end
    return e
end

local p = nil
local q = nil

local function r()
    if p then
        p:Destroy()
        if q then
            q:Cancel()
        end
    end
    
    local s = Instance.new("BillboardGui")
    s.Name = "stuff"
    s.Size = UDim2.new(2, 0, 2, 0)
    s.AlwaysOnTop = true
    s.ClipsDescendants = true
    s.Adornee = nil
    s.Enabled = false
    s.ExtentsOffset = Vector3.new(0, 2.5, 0)
    s.Parent = G
    
    local t = Instance.new("TextLabel", s)
    t.Name = "yes"
    t.Size = UDim2.new(1, 0, 1, 0)
    t.Position = UDim2.new(0, 0, 0, 0)
    t.BackgroundTransparency = 1
    t.Text = "?"
    t.TextColor3 = Color3.new(1, 1, 1)
    t.TextScaled = true
    t.Font = Enum.Font.SourceSansBold
    t.ZIndex = 10
    
    q = T:Create(
        t,
        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {TextColor3 = Color3.new(0, 0, 0)}
    )
    q:Play()
    
    p = s
    return s
end

local function u(v, w)
    if not p then
        r()
    end
    
    if v and v:FindFirstChild(w) then
        p.Adornee = v[w]
        p.Enabled = true
    else
        if p then
            p.Enabled = false
        end
    end
end

local function x()
    if p then
        if q then
            q:Cancel()
            q = nil
        end
        p:Destroy()
        p = nil
    end
end

R.RenderStepped:Connect(function()
    if a.E then
        if not a.T or not a.T.Character or not a.T.Character:FindFirstChild(a.P) then
            a.T = f()
        end

        if a.T and a.T.Character and a.T.Character:FindFirstChild(a.P) then
            local y = a.T.Character[a.P]
            local z = y.Velocity
            local A = y.Position + Vector3.new(
                z.X * a.X,
                z.Y * a.Y + (z.Y > 1 and a.J or z.Y < -1 and a.F or 0),
                z.Z * a.X
            )
            C.CFrame = CFrame.new(C.CFrame.Position, A)

            u(a.T.Character, a.P)
        else
            x()
            a.T = nil
        end
    else
        x()
        a.T = nil
    end
end)

local B = getrawmetatable(game)
local D = B.__index
setreadonly(B, false)
B.__index = newcclosure(function(E, F)
    if not checkcaller() and typeof(E) == "Instance" and E:IsA("Mouse") and F == "Hit" then
        if a.E and a.T and a.T.Character and a.T.Character:FindFirstChild(a.P) then
            local H = a.T.Character[a.P]
            local I = H.Velocity
            local J = H.Position + Vector3.new(
                I.X * a.X,
                I.Y * a.Y + (I.Y > 1 and a.J or I.Y < -1 and a.F or 0),
                I.Z * a.X
            )
            return CFrame.new(J)
        end
    end
    return D(E, F)
end)
setreadonly(B, true)

local K = Instance.new("ScreenGui", G)
K.Name = "JOB"
K.ResetOnSpawn = false

local M = Instance.new("TextButton", K)
M.Size = UDim2.new(0, 140, 0, 50)
M.Position = UDim2.new(0.5, -70, 0.5, -25)
M.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
M.TextColor3 = Color3.new(1, 1, 1)
M.Text = "camlock OFF"
M.Font = "Ubuntu"
M.TextSize = 22
M.Active = true
M.Draggable = true

Instance.new("UICorner", M).CornerRadius = UDim.new(0, 12)

M.MouseButton1Click:Connect(function()
    a.E = not a.E
    M.Text = a.E and "camlock ON" or "camlock OFF"
    if not a.E then
        a.T = nil
        x()
    end
end)

U.InputBegan:Connect(function(N, O)
    if O then return end
    if N.KeyCode == Enum.KeyCode.C or N.KeyCode == Enum.KeyCode.DPadDown then
        M:Activate()
    end
end)

local function Q(R)
    return math.clamp(R, 30, 300)
end

task.spawn(function()
    while true do
        task.wait(1)
        local S = 50
        pcall(function()
            local T = game:GetService("Stats"):FindFirstChild("Network")
            if T then
                local U = T:FindFirstChild("DataPing")
                if U then S = tonumber(U.Value) or S end
            end
        end)

        S = Q(S)

        if a.A then
            local V = (S - 30) / (300 - 30)
            a.X = 0.1 + (0.31 * V)
            a.Y = 0.09 + (0.23 * V)
        end

        if a.O then
            if S <= 60 then
                a.J = -0.08
                a.F = 0.25
            elseif S <= 100 then
                a.J = -0.09
                a.F = 0.3
            elseif S <= 150 then
                a.J = -0.1
                a.F = 0.35
            elseif S <= 225 then
                a.J = -0.12
                a.F = 0.4
            else
                a.J = -0.14
                a.F = 0.45
            end
        end
    end
end)
