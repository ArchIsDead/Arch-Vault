-- no idea bruv

local _G = _G
local p = game:GetService("Players")
local r = game:GetService("RunService")
local t = game:GetService("TweenService")

_G.a = not _G.a

if not _G.a then
    if _G.b then
        _G.b:Destroy()
        _G.b = nil
    end
    return
end

local c = p.LocalPlayer
local d = c:WaitForChild("PlayerGui")

local e = Instance.new("ScreenGui")
e.Name = "yogurt"
e.Parent = d
e.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
e.ResetOnSpawn = false

_G.b = e

local f = Instance.new("Frame")
f.Name = "idk"
f.Size = UDim2.new(0, 180, 0, 40)
f.Position = UDim2.new(0.5, 0, 1, -150)
f.AnchorPoint = Vector2.new(0.5, 1)
f.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
f.BackgroundTransparency = 0.7
f.BorderSizePixel = 0
f.Parent = e

local g = Instance.new("UICorner")
g.CornerRadius = UDim.new(0, 8)
g.Parent = f

local h = Instance.new("ImageLabel")
h.Name = "sybau"
h.Size = UDim2.new(1, 10, 1, 10)
h.Position = UDim2.new(0, -5, 0, -5)
h.BackgroundTransparency = 1
h.Image = "rbxassetid://5028857084"
h.ImageColor3 = Color3.fromRGB(50, 150, 255)
h.ScaleType = Enum.ScaleType.Slice
h.SliceCenter = Rect.new(24, 24, 24, 24)
h.Parent = f

local i = Instance.new("TextLabel")
i.Name = "sukma"
i.Size = UDim2.new(1, 0, 1, 0)
i.BackgroundTransparency = 1
i.Text = "STUDS/S: 0.0"
i.TextColor3 = Color3.fromRGB(255, 255, 255)
i.Font = Enum.Font.SciFi
i.TextSize = 18
i.TextStrokeTransparency = 0.8
i.Parent = f

local j = Vector3.new(0, 0, 0)
local k = os.clock()
local l = 0
local m = {}
local n = false

local o = 50
local q = 0.2
local s = 5

local function u(v, w, x)
	return v + (w - v) * x
end

local function y(z)
	local A = math.clamp(z / o, 0, 1)
	
	local B = Color3.new(
		u(1, 0, A),
		u(1, 0, A),
		u(1, 0, A)
	)
	
	local C = Color3.new(
		u(0, 1, A),
		u(0, 1, A),
		u(0, 1, A)
	)
	
	local D = t:Create(
		i,
		TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{TextColor3 = B}
	)
	
	local E = t:Create(
		f,
		TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{BackgroundColor3 = C}
	)
	
	D:Play()
	E:Play()
	
	i.Text = string.format("STUDS/S: %.1f", z)
end

local function F()
	if not c.Character then return end
	
	local G = c.Character:FindFirstChild("HumanoidRootPart")
	if not G then return end
	
	local H = os.clock()
	local I = G.Position
	
	if not n then
		j = I
		k = H
		n = true
		return
	end
	
	local J = H - k
	
	if J > 0 then
		local K = (I - j).Magnitude
		local L = K / J
		
		table.insert(m, L)
		if #m > s then
			table.remove(m, 1)
		end
		
		local M = 0
		for N = 1, #m do
			M = M + m[N]
		end
		local O = M / #m
		
		l = u(l, O, q)
		
		y(l)
		
		j = I
		k = H
	end
end

local P
P = r.RenderStepped:Connect(function()
    if _G.a then
        F()
    else
        P:Disconnect()
    end
end)

c.CharacterAdded:Connect(function(Q)
	Q:WaitForChild("HumanoidRootPart")
	
	j = Q.HumanoidRootPart.Position
	k = os.clock()
	l = 0
	m = {}
	
	i.Text = "STUDS/S: 0.0"
	f.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	i.TextColor3 = Color3.fromRGB(255, 255, 255)
end)
