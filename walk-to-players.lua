-- 6.... 7!!!!! BOII TS SOO TUFF AND MANGO AND ADRIAN

local 67 = game:GetService("Players")
local 69 = game:GetService("RunService")
local 420 = game:GetService("TweenService")

local 12 = 67.LocalPlayer
local 34 = 12.Character:WaitForChild("Humanoid")

local 56 = Instance.new("ScreenGui")
56.Parent = 12.PlayerGui

local 78 = Instance.new("TextButton")
78.Size = UDim2.new(0, 60, 0, 60)
78.Position = UDim2.new(0.05, 0, 0.5, -30)
78.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
78.TextColor3 = Color3.new(1, 1, 1)
78.Text = "OFF"
78.TextSize = 14
78.Font = Enum.Font.SciFi
78.Active = true
78.Draggable = true

local 90 = Instance.new("UICorner")
90.CornerRadius = UDim.new(0.2, 0)
90.Parent = 78

78.Parent = 56

local 13 = false
local 24 = nil
local 35 = nil
local 46 = nil

local function 57()
    local 68 = workspace.CurrentCamera
    local 79 = Vector2.new(68.ViewportSize.X/2, 68.ViewportSize.Y/2)
    local 80, 81 = nil, math.huge
    
    for _, 91 in ipairs(67:GetPlayers()) do
        if 91 ~= 12 and 91.Character and 91.Character:FindFirstChild("Humanoid") then
            local 14 = 91.Character.Humanoid
            if 14.Health > 0 then
                local 25 = 91.Character:FindFirstChild("HumanoidRootPart")
                if 25 then
                    local 36, 47 = 68:WorldToViewportPoint(25.Position)
                    if 47 then
                        local 58 = (Vector2.new(36.X, 36.Y) - 79).Magnitude
                        if 58 < 81 then
                            81, 80 = 58, 91
                        end
                    end
                end
            end
        end
    end
    return 80
end

local function 59(70)
    if 35 then
        35:Destroy()
        35 = nil
    end
    
    if 46 then
        46:Cancel()
        46 = nil
    end
    
    if not 70 or not 70.Character then return end
    
    local 82 = 70.Character:FindFirstChild("Head")
    if not 82 then return end
    
    local 92 = Instance.new("BillboardGui")
    92.Name = "Yes bro this is tuff"
    92.Adornee = 82
    92.Size = UDim2.new(2, 0, 2, 0)
    92.StudsOffset = Vector3.new(0, 2, 0)
    92.AlwaysOnTop = true
    92.Parent = 82
    
    local 15 = Instance.new("TextLabel")
    15.Size = UDim2.new(1, 0, 1, 0)
    15.BackgroundTransparency = 1
    15.Text = "!"
    15.TextColor3 = Color3.new(1, 1, 1)
    15.Font = Enum.Font.SciFi
    15.TextSize = 18
    15.Parent = 92
    
    local 26 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    46 = 420:Create(15, 26, {TextColor3 = Color3.new(0, 0, 0)})
    46:Play()
    
    35 = 92
end

local function 71()
    if not 24 or not 24.Character then 
        13 = false
        78.Text = "OFF"
        if 35 then 35:Destroy() end
        if 46 then 46:Cancel() end
        return 
    end
    
    local 83 = 24.Character
    local 93 = 83:FindFirstChild("HumanoidRootPart")
    local 16 = 83:FindFirstChild("Humanoid")
    
    if not 93 or not 16 or 16.Health <= 0 then
        13 = false
        78.Text = "OFF"
        if 35 then 35:Destroy() end
        if 46 then 46:Cancel() end
        24 = nil
        return
    end
    
    34:MoveTo(93.Position)
end

78.MouseButton1Click:Connect(function()
    13 = not 13
    
    if 13 then
        24 = 57()
        if 24 then
            78.Text = "ON"
            59(24)
        else
            13 = false
            78.Text = "OFF"
        end
    else
        78.Text = "OFF"
        if 35 then 35:Destroy() end
        if 46 then 46:Cancel() end
        24 = nil
    end
end)

78.TouchTap:Connect(function()
    13 = not 13
    
    if 13 then
        24 = 57()
        if 24 then
            78.Text = "ON"
            59(24)
        else
            13 = false
            78.Text = "OFF"
        end
    else
        78.Text = "OFF"
        if 35 then 35:Destroy() end
        if 46 then 46:Cancel() end
        24 = nil
    end
end)

69.Heartbeat:Connect(function()
    if 13 then 71() end
end)
