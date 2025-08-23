-- yes trash

local player = game.Players.LocalPlayer
local run = game:GetService("RunService")
local stats = game:GetService("Stats")
local ui = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "My Feet"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

local freeschlep = Instance.new("Frame")
freeschlep.Size = UDim2.new(0, 120, 0, 40)
freeschlep.Position = UDim2.new(1, -130, 0, 8)
freeschlep.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
freeschlep.BackgroundTransparency = 0.2
freeschlep.BorderSizePixel = 0
freeschlep.Parent = gui

local chips = Instance.new("UICorner")
chips.CornerRadius = UDim.new(0, 10)
chips.Parent = freeschlep

local meh = Instance.new("UIPadding")
meh.PaddingLeft = UDim.new(0, 12)
meh.PaddingRight = UDim.new(0, 12)
meh.Parent = freeschlep

local yes = Instance.new("TextLabel")
yes.Size = UDim2.new(1, 0, 1, 0)
yes.BackgroundTransparency = 1
yes.Text = "Ping: idk gang"
yes.TextColor3 = Color3.fromRGB(220, 220, 220)
yes.TextSize = 16
yes.Font = Enum.Font.GothamSemibold
yes.TextXAlignment = Enum.TextXAlignment.Left
yes.Parent = freeschlep

if ui.TouchEnabled then
    freeschlep.Size = UDim2.new(0, 140, 0, 46)
    yes.TextSize = 18
    freeschlep.Position = UDim2.new(1, -150, 0, 12)
end

run.Heartbeat:Connect(function()
    local ping = 0
    local perfStats = stats:FindFirstChild("PerformanceStats")
    if perfStats then
        local pingStat = perfStats:FindFirstChild("Ping")
        if pingStat then
            ping = pingStat:GetValue()
        end
    end
    
    yes.Text = "Ping: " .. math.floor(ping) .. "ms"
    
    if ping < 80 then
        yes.TextColor3 = Color3.fromRGB(76, 175, 80)
    elseif ping < 190 then
        yes.TextColor3 = Color3.fromRGB(255, 193, 7)
    else
        yes.TextColor3 = Color3.fromRGB(244, 67, 54)
    end
end)
