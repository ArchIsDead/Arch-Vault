-- don't be toxic if you don't want to be GOONED by arxh the skibidi one
-- execute 2x to disable btw(not tested cuz I'm lazy)

if _G.Gurt then
    _G.Gurt:Disconnect()
    _G.Gurt = nil
    return
end

local P = game:GetService("Players")
local L = P.LocalPlayer

local Settings = {
    Message = "Ez Kid",
    RepeatCount = 1,
    Cooldown = 1,
    Enabled = true
}

local l = L:WaitForChild("leaderstats")
local k = l:WaitForChild("Kills")

local lK = k.Value
local iS = false

local function sM()
    if not Settings.Enabled or iS then return end
    iS = true
    
    for i = 1, Settings.RepeatCount do
        if game:GetService("TextChatService") then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(Settings.Message)
        end
        wait(Settings.Cooldown)
    end
    
    iS = false
end

_G.Gurt = k.Changed:Connect(function()
    if k.Value > lK and Settings.Enabled then
        sM()
    end
    lK = k.Value
end)
