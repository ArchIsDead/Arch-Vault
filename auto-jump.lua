-- watchu lookin at, u dont trust me at all 😒
if not _G.Auto then
    _G.Auto = true
    spawn(function()
        while _G.Auto do
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                local humanoid = character.Humanoid
                
                if humanoid:GetState() == Enum.HumanoidStateType.Running then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                
                wait(0.05)
            end
            wait(0.05)
        end
    end)
else
    _G.Auto = false
end
