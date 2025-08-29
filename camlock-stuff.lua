-- mid yes

local Stuff1 = game:GetService("Players")
local Stuff2 = game:GetService("RunService")
local Stuff3 = game:GetService("UserInputService")
local Stuff4 = game:GetService("CoreGui")

local goon1 = Stuff1.LocalPlayer
local goon2 = workspace.CurrentCamera

local goon3 = Instance.new("ScreenGui")
goon3.Name = "goon4"
goon3.Parent = Stuff4
goon3.ResetOnSpawn = false
goon3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local goon5 = Instance.new("TextButton")
goon5.Name = "goon6"
goon5.Size = UDim2.new(0, 50, 0, 50)
goon5.Position = UDim2.new(0, 10, 0, 10)
goon5.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
goon5.BorderSizePixel = 1
goon5.BorderColor3 = Color3.fromRGB(80, 80, 80)
goon5.Text = "OFF"
goon5.TextColor3 = Color3.fromRGB(255, 255, 255)
goon5.TextSize = 14
goon5.Font = Enum.Font.GothamBold
goon5.Active = true
goon5.Parent = goon3

local goon7 = Instance.new("UICorner")
goon7.CornerRadius = UDim.new(0, 6)
goon7.Parent = goon5

local prediction = 0.136
local goon9 = false
local goon10 = nil
local goon11 = nil
local goon12 = false
local goon13 = nil
local goon14 = {}

local function Stuff5()
    local goon15 = nil
    local goon16 = math.huge
end

local function Stuff6(goon17)
    if not goon17 or not goon17.Character then
        return
    end
end

local function Stuff7(goon18)
    if goon14[goon18] then
        goon14[goon18]:Destroy()
        goon14[goon18] = nil
    end
end

local function Stuff8()
    for goon19, goon20 in pairs(goon14) do
        goon20:Destroy()
    end
    goon14 = {}
end

local function Stuff9()
    if not goon9 then
        return
    end
end

local function Stuff10()
    goon9 = not goon9
end

goon5.MouseButton1Click:Connect(Stuff10)

if Stuff3.TouchEnabled then
    goon5.TouchTap:Connect(Stuff10)
end

local function Stuff11(goon21)
    if not goon12 or not goon13 then
        return
    end
end

goon5.InputBegan:Connect(function(goon22)
    if goon22.UserInputType == Enum.UserInputType.MouseButton1 then
        goon12 = true
        goon13 = goon22.Position
        startPos = goon5.Position
        goon5.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

goon5.InputEnded:Connect(function(goon23)
    if goon23.UserInputType == Enum.UserInputType.MouseButton1 then
        goon12 = false
        goon13 = nil
        startPos = nil
        goon5.BackgroundColor3 = goon9 and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(20, 20, 20)
    end
end)

goon5.InputChanged:Connect(function(goon24)
    if goon24.UserInputType == Enum.UserInputType.MouseMovement and goon12 then
        Stuff11(goon24)
    end
end)

local goon25 = Stuff2.Heartbeat:Connect(function()
    if goon9 and goon10 and goon10.Character then
        local goon26 = goon10.Character:FindFirstChild("Humanoid")
        if not goon26 or goon26.Health <= 0 then
            Stuff7(goon10)
            goon10 = Stuff5()
            if goon10 then
                Stuff6(goon10)
            else
                Stuff10()
            end
        end
    end
end)

local function Stuff12(goon27)
    if goon27 ~= goon1 then
        goon27.CharacterAdded:Connect(function(goon28)
            if goon9 and (not goon10 or not goon10.Character or (goon10.Character:FindFirstChild("Humanoid") and goon10.Character.Humanoid.Health <= 0)) then
                goon28:WaitForChild("Humanoid")
                local goon29 = Stuff5()
                if goon29 then
                    Stuff7(goon10)
                    goon10 = goon29
                    Stuff6(goon10)
                end
            end
        end)
    end
end

for _, goon30 in ipairs(Stuff1:GetPlayers()) do
    Stuff12(goon30)
end

Stuff1.PlayerAdded:Connect(Stuff12)

Stuff1.PlayerRemoving:Connect(function(goon31)
    if goon31 == goon1 then
        if goon11 then
            goon11:Disconnect()
        end
        if goon25 then
            goon25:Disconnect()
        end
        Stuff8()
        goon3:Destroy()
    elseif goon14[goon31] then
        Stuff7(goon31)
        if goon10 == goon31 then
            goon10 = Stuff5()
            if goon10 then
                Stuff6(goon10)
            else
                Stuff10()
            end
        end
    end
end)

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    goon2 = workspace.CurrentCamera
end)

goon3.Enabled = true
