-- meh btw this detects animation so it doesnt work on invisible block

if _G.A == nil then
    _G.A = true
else
    _G.A = not _G.A
end

if not _G.A then
    return
end

game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(c)
        local h = c:WaitForChild("Humanoid")
        
        h.AnimationPlayed:Connect(function(t)
            if not _G.A then return end
            if t.Animation.AnimationId == "rbxassetid://10470389827" then
                
                local x = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                if not x then return end
                
                local b = Instance.new("BillboardGui")
                b.Adornee = x
                b.Size = UDim2.new(2, 0, 2, 0)
                b.StudsOffset = Vector3.new(0, 1, 0)
                b.AlwaysOnTop = true
                b.Parent = x
                
                local i = Instance.new("ImageLabel")
                i.Size = UDim2.new(1, 0, 1, 0)
                i.BackgroundTransparency = 1
                i.Image = "rbxassetid://12252418253"
                i.Parent = b
                
                spawn(function()
                    while b and b.Parent do
                        for n = 0, 1, 0.05 do
                            if not b or not b.Parent then break end
                            i.ImageColor3 = Color3.new(1, 0, 0):Lerp(Color3.new(0.5, 0, 0), math.sin(n * math.pi))
                            wait(0.1)
                        end
                    end
                end)
                
                t.Stopped:Connect(function()
                    if b then
                        b:Destroy()
                    end
                end)
            end
        end)
    end)
end)

for _, p in ipairs(game.Players:GetPlayers()) do
    if p.Character then
        local h = p.Character:FindFirstChild("Humanoid")
        if h then
            h.AnimationPlayed:Connect(function(t)
                if not _G.A then return end
                if t.Animation.AnimationId == "rbxassetid://10470389827" then
                    
                    local c = p.Character
                    local x = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                    if not x then return end
                    
                    local b = Instance.new("BillboardGui")
                    b.Adornee = x
                    b.Size = UDim2.new(2, 0, 2, 0)
                    b.StudsOffset = Vector3.new(0, 1, 0)
                    b.AlwaysOnTop = true
                    b.Parent = x
                    
                    local i = Instance.new("ImageLabel")
                    i.Size = UDim2.new(1, 0, 1, 0)
                    i.BackgroundTransparency = 1
                    i.Image = "rbxassetid://12252418253"
                    i.Parent = b
                    
                    spawn(function()
                        while b and b.Parent do
                            for n = 0, 1, 0.05 do
                                if not b or not b.Parent then break end
                                i.ImageColor3 = Color3.new(1, 0, 0):Lerp(Color3.new(0.5, 0, 0), math.sin(n * math.pi))
                                wait(0.1)
                            end
                        end
                    end)
                    
                    t.Stopped:Connect(function()
                        if b then
                            b:Destroy()
                        end
                    end)
                end
            end)
        end
    end
end
