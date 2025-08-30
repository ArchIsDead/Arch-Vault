-- tuff boiiii execute again to disable or enable blud

local delay = 0.2 -- change it how you want it gang, 0.2 - 0.3 gud for me

_G.A1 = not _G.A1

if not _G.A1 then
    if _G.C1 then
        _G.C1:Disconnect()
    end
    return
end

local P = game.Players.LocalPlayer

_G.C1 = P.CharacterAdded:Connect(function(C)
    C:WaitForChild("Humanoid").AnimationPlayed:Connect(function(T)
        if T.Animation.AnimationId == "rbxassetid://13294471966" then
            task.wait(delay)
            P.Character:FindFirstChild("Communicate"):FireServer({{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}})
        end
    end)
end)

if P.Character then
    local H = P.Character:FindFirstChild("Humanoid")
    if H then
        H.AnimationPlayed:Connect(function(T)
            if T.Animation.AnimationId == "rbxassetid://13294471966" then
                task.wait(delay)
                P.Character:FindFirstChild("Communicate"):FireServer({{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}})
            end
        end)
    end
end
