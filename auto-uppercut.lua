-- very easy bro

if _G.a == nil then
    _G.a = false
end

_G.a = not _G.a

if _G.a then
    function b()
        local c = {
            {
                Goal = "KeyPress",
                Key = Enum.KeyCode.Space
            }
        }
        
        local d = game:GetService("Players").LocalPlayer.Character
        if d and d:FindFirstChild("Communicate") then
            d.Communicate:FireServer(unpack(c))
        end
    end
    
    _G.e = game:GetService("RunService").Heartbeat:Connect(function()
        if _G.a then
            b()
        end
    end)
    
else
    if _G.e then
        _G.e:Disconnect()
        _G.e = nil
    end
    
    local f = game:GetService("VirtualInputManager")
    f:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    wait(0.05)
    f:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end
