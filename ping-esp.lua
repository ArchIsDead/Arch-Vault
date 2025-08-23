-- idk, btw you can change the maxdistance for better experience

local plr = game:GetService("Players")
local run = game:GetService("RunService")

local on = false
local gui = Instance.new("Folder")
gui.Parent = game.CoreGui

local function mak(player)
    if player == plr.LocalPlayer then return end
    
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 100, 0, 40)
    bb.AlwaysOnTop = true
    bb.MaxDistance = 200
    bb.Parent = gui
    
    local pin = Instance.new("TextLabel")
    pin.Size = UDim2.new(1, 0, 1, 0)
    pin.BackgroundTransparency = 1
    pin.Text = "idk gang"
    pin.Font = Enum.Font.SciFi
    pin.TextSize = 12
    pin.Parent = bb
    
    local con
    con = run.RenderStepped:Connect(function()
        if not on then
            bb.Adornee = nil
            return
        end
        
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            bb.Adornee = char.HumanoidRootPart
            
            local png = player:GetAttribute("Ping") or 0
            pin.Text = math.floor(png) .. "ms"
            
            png = math.clamp(png, 0, 300)
            pin.TextColor3 = Color3.new(png/300, (300-png)/300, 0)
            
            local hum = char:FindFirstChild("Humanoid")
            if hum and hum.Health <= 0 then
                pin.TextColor3 = Color3.new(0, 0, 0)
            end
        else
            bb.Adornee = nil
        end
    end)
    
    player.CharacterAdded:Connect(function()
        if on then
            bb.Adornee = player.Character:WaitForChild("HumanoidRootPart")
        end
    end)
end

plr.PlayerAdded:Connect(mak)

local function tog()
    on = not on
    
    if on then
        for _, p in ipairs(plr:GetPlayers()) do
            mak(p)
        end
    else
        gui:ClearAllChildren()
    end
end

tog()

return tog
