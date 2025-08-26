-- ts pmo, btw execute again to disable / enable

_G.studs = 8
_G.chat = "ez kid"

_G.E = not _G.E
if _G.E == nil then _G.E = true end
if not _G.E then return end

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(x)
    x:WaitForChild("Humanoid").AnimationPlayed:Connect(function(t)
        if t.Animation and t.Parent and t.Parent.Parent ~= game:GetService("Players").LocalPlayer.Character then
            local i = t.Animation.AnimationId:match("%d+")
            if i == "12351854556" or i == "15311685628" or i == "78521642007560" then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(_G.chat)
            end
        end
    end)
end)

if game:GetService("Players").LocalPlayer.Character then
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").AnimationPlayed:Connect(function(t)
        if t.Animation and t.Parent and t.Parent.Parent ~= game:GetService("Players").LocalPlayer.Character then
            local i = t.Animation.AnimationId:match("%d+")
            if i == "12351854556" or i == "15311685628" or i == "78521642007560" then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(_G.chat)
            end
        end
    end)
end
