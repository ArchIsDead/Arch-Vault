-- watchu lookin at, js copy the script gang

local P = game:GetService("Players")
local R = game:GetService("RunService")

local p = P.LocalPlayer
local c = {}

_G.N = not _G.N
if _G.N == nil then _G.N = true end

if not _G.N then
    for _, x in pairs(c) do x:Disconnect() end
    table.clear(c)
    return
end

local function e(a)
    if a == p then return end
    
    local b = a.Character
    if not b then return end
    
    local d = R.Stepped:Connect(function()
        for _, x in ipairs(b:GetDescendants()) do
            if x:IsA("BasePart") then
                x.CanCollide = false
            end
        end
    end)
    
    c[a] = d
    
    a.AncestryChanged:Connect(function()
        if not a:IsDescendantOf(P) and c[a] then
            c[a]:Disconnect()
            c[a] = nil
        end
    end)
end

for _, a in ipairs(P:GetPlayers()) do
    if a.Character then e(a) end
    a.CharacterAdded:Connect(function() e(a) end)
end

P.PlayerAdded:Connect(function(a)
    a.CharacterAdded:Connect(function() e(a) end)
end)

script.Destroying:Connect(function()
    for _, x in pairs(c) do x:Disconnect() end
    table.clear(c)
end)
