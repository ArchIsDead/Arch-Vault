-- yo gurt : open source skibidi mango and very tuff mustard boiiii
if getgenv().pmo then
    getgenv().pmo = false
    return
else
    getgenv().pmo = true
end

set = set or {
    Message = "ez",
    RepeatCount = 1,
    Cooldown = 1,
    Enabled = true
}

local P = game:GetService("Players")
local L = P.LocalPlayer

local l = L:WaitForChild("leaderstats")
local k = l:WaitForChild("Kills")

local lK = k.Value
local iS = false

local function sM()
    if not set.Enabled or iS then return end
    iS = true
    
    for i = 1, set.RepeatCount do
        if game:GetService("TextChatService") then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(set.Message)
        end
        wait(set.Cooldown)
    end
    
    iS = false
end

k.Changed:Connect(function()
    if k.Value > lK and set.Enabled then
        sM()
    end
    lK = k.Value
end)
