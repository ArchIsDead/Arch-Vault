-- ts is peak gng can you pls star this repository pls uwu

_G.t = not _G.t

if _G.t then
    local p = game.Players.LocalPlayer
    local c = p.Character or p.CharacterAdded:Wait()
    local h = c:WaitForChild("Humanoid")
    
    local function a(t)
        local i = tostring(t.Animation.AnimationId)
        if i:find("10470104242") then
            wait(0.25)
            local b = p.Backpack:WaitForChild("Hunter's Grasp")
            local x = {{
                Goal = "Auto Use End",
                Tool = b
            }}
            local y = {{
                Tool = b,
                Goal = "Console Move"
            }}
            c:WaitForChild("Communicate"):FireServer(unpack(x))
            c:WaitForChild("Communicate"):FireServer(unpack(y))
        end
    end
    
    h.AnimationPlayed:Connect(a)
    p.CharacterAdded:Connect(function(z)
        z:WaitForChild("Humanoid").AnimationPlayed:Connect(a)
    end)
end
