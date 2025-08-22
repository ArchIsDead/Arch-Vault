-- watchu lookin at, execute 2x btw to stop
if getgenv().Stop then
    getgenv().Stop = false
else
    getgenv().Stop = true
    c = game.Players.LocalPlayer.Character
    if c then
        h = c:FindFirstChildOfClass("Humanoid")
        if h then
            h.AnimationPlayed:Connect(function(track)
                if getgenv().Stop then
                    track:Stop()
                end
            end)
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        h = char:WaitForChildOfClass("Humanoid")
        h.AnimationPlayed:Connect(function(track)
            if getgenv().Stop then
                track:Stop()
            end
        end)
    end)
end
