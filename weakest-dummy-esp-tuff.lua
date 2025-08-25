-- yes this one is gud but lil laggy, btw execute again to enable / disable

if not getgenv().Ena then
    getgenv().Ena = true
    getgenv().Con = game:GetService("RunService").Heartbeat:Connect(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Highlight") or v.Name == "ESP" then
                local t = math.sin(tick() * 2) * 0.5 + 0.5
                local c = Color3.new(t, t, t)
                if v:IsA("Highlight") then
                    v.FillColor = c
                    v.OutlineColor = Color3.new(1 - c.R, 1 - c.G, 1 - c.B)
                else
                    if v:FindFirstChild("Text") then v.Text.TextColor3 = c end
                    if v:FindFirstChild("HealthBar") then v.HealthBar.BackgroundColor3 = Color3.new(1 - c.R, 1 - c.G, 1 - c.B) end
                end
            end
        end
        
        local t = workspace.Live:FindFirstChild("Weakest Dummy")
        if t and t:FindFirstChildOfClass("Humanoid") and not t:FindFirstChild("ESP") then
            local hum = t:FindFirstChildOfClass("Humanoid")
            hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            
            for _, v in pairs(t:GetDescendants()) do
                if v:IsA("BasePart") and not v:FindFirstChildWhichIsA("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Parent = v
                    h.Adornee = v
                end
            end
            
            local h = t:FindFirstChild("Head") or t.PrimaryPart
            if h and not h:FindFirstChild("ESP") then
                local b = Instance.new("BillboardGui")
                b.Name = "ESP"
                b.Parent = h
                b.Adornee = h
                b.Size = UDim2.new(0, 80, 0, 30)
                b.StudsOffset = Vector3.new(0, 3, 0)
                
                local x = Instance.new("TextLabel")
                x.Name = "Text"
                x.Parent = b
                x.Size = UDim2.new(1, 0, 0.5, 0)
                x.Position = UDim2.new(0, 0, 0, 0)
                x.Text = "Weakest Dummy"
                x.BackgroundTransparency = 1
                x.TextSize = 12
                x.Font = Enum.Font.SciFi
                
                local healthBar = Instance.new("Frame")
                healthBar.Name = "HealthBar"
                healthBar.Parent = b
                healthBar.Size = UDim2.new(0.8, 0, 0.15, 0)
                healthBar.Position = UDim2.new(0.1, 0, 0.6, 0)
                healthBar.BorderSizePixel = 1
                healthBar.BorderColor3 = Color3.new(1, 1, 1)
                
                local healthFill = Instance.new("Frame")
                healthFill.Name = "HealthFill"
                healthFill.Parent = healthBar
                healthFill.Size = UDim2.new(hum.Health / hum.MaxHealth, 0, 1, 0)
                healthFill.BackgroundColor3 = Color3.new(1, 1, 1)
                healthFill.BorderSizePixel = 0
                
                hum.HealthChanged:Connect(function()
                    healthFill.Size = UDim2.new(hum.Health / hum.MaxHealth, 0, 1, 0)
                end)
            end
        end
    end)
else
    getgenv().Ena = false
    getgenv().Con:Disconnect()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") or v.Name == "ESP" then
            v:Destroy()
        end
    end
    local t = workspace.Live:FindFirstChild("Weakest Dummy")
    if t and t:FindFirstChildOfClass("Humanoid") then
        t:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
    end
end
