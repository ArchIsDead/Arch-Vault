-- hey uwu, pls like and subskreb to my youtub channel archthehonoredone, and the way to disable or enable this script is to execute it again.

if _G.a then return end _G.a = true

local p = game:GetService("Players")

local i = {
    KJ = "rbxassetid://17140853847",
    Sorcerer = "rbxassetid://15143528348",
    Tech = "rbxassetid://113596928331434"
}
local d = "rbxassetid://12252402662"

local function g(c)
    if i[c] then
        return i[c]
    end
    
    local l = p.LocalPlayer:WaitForChild("PlayerGui")
    local s, m = pcall(function()
        return l.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame[c].IconButton.IconImage.Image
    end)
    
    return s and m or d
end

local function u(pl)
    if not pl.Character then return end
    
    local h = pl.Character:WaitForChild("Head")
    
    local e = h:FindFirstChild("b")
    if e then
        e:Destroy()
    end

    local n = pl:GetAttribute("Character")
    if not n then return end

    local b = Instance.new("BillboardGui")
    b.Name = "b"
    b.Size = UDim2.new(2, 0, 2, 0)
    b.AlwaysOnTop = true
    b.MaxDistance = 50
    b.Adornee = h
    b.Parent = h
    
    b.StudsOffset = Vector3.new(0, 2.5, 0)
    
    local il = Instance.new("ImageLabel")
    il.Size = UDim2.new(1, 0, 1, 0)
    il.BackgroundTransparency = 1
    il.Image = g(n)
    il.Parent = b
end

local function s(pl)
    pl.CharacterAdded:Connect(function()
        u(pl)
    end)
    
    pl:GetAttributeChangedSignal("Character"):Connect(function()
        if pl.Character then
            u(pl)
        end
    end)
    
    if pl.Character then
        u(pl)
    end
end

p.PlayerAdded:Connect(s)
p.PlayerRemoving:Connect(function(pl)
    if pl.Character and pl.Character:FindFirstChild("Head") then
        local b = pl.Character.Head:FindFirstChild("b")
        if b then
            b:Destroy()
        end
    end
end)

for _, pl in ipairs(p:GetPlayers()) do
    s(pl)
end
