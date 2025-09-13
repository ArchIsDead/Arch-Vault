getgenv().T = 1

getgenv().H = {
    215718515,
    1744060292
}

local function w(p0, p1, c0, c1)
    local w = Instance.new("Weld")
    w.Part0, w.Part1, w.C0, w.C1 = p0, p1, c0, c1
    w.Parent = p0
    return w
end

local function a(i, p)
    local a = game:GetObjects("rbxassetid://" .. i)[1]
    local h = a:FindFirstChild("Handle")
    if not h then return end
    
    for _, x in pairs(h:GetChildren()) do
        if x:IsA("Attachment") then
            local y = p:FindFirstChild(x.Name, true)
            if y then
                w(p, h, y.CFrame, x.CFrame)
                break
            end
        end
    end
    
    a.Parent = game.Players.LocalPlayer.Character
end

local function o(c)
    wait(getgenv().T)
    
    local h = c:FindFirstChild("Head")
    
    if h then
        for _, i in ipairs(getgenv().H) do
            a(i, h)
        end
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(o)

if game.Players.LocalPlayer.Character then
    o(game.Players.LocalPlayer.Character)
end
