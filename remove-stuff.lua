-- go edit yourself, im tired :p

local grass = false
local trashcan = false
local trees = true
local walls = false
local leaderboard = false
local bench = false
local shadow = true
local debris = true

local map = workspace.Map

if grass then
    if map:FindFirstChild("GrassBottom") then map.GrassBottom:Destroy() end
    if map:FindFirstChild("GrassTop") then map.GrassTop:Destroy() end
    if map:FindFirstChild("Grass") then map.Grass:Destroy() end
end

if trashcan then
    if map:FindFirstChild("Trash") then map.Trash:Destroy() end
end

if trees then
    if map:FindFirstChild("Trees") then map.Trees:Destroy() end
end

if walls then
    if map:FindFirstChild("Walls") then map.Walls:Destroy() end
    if map:FindFirstChild("GrassTop") then map.GrassTop:Destroy() end
    if map:FindFirstChild("Grass") then map.Grass:Destroy() end
end

if leaderboard then
    if map:FindFirstChild("Total Kills Leaderboard") then map["Total Kills Leaderboard"]:Destroy() end
    if map:FindFirstChild("Total Kills Leaderboard Real") then map["Total Kills Leaderboard Real"]:Destroy() end
    if workspace.Thrown:FindFirstChild("Donation Leaderboard") then workspace.Thrown["Donation Leaderboard"]:Destroy() end
end

if bench then
    if map:FindFirstChild("Benchs") then map.Benchs:Destroy() end
end

if shadow then
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CastShadow = false
        end
    end
end

if debris then
    for _, obj in pairs(workspace.Thrown:GetChildren()) do
        if obj.Name ~= "Aurora" and obj.Name ~= "Donation Leaderboard" then
            obj:Destroy()
        end
    end
end
