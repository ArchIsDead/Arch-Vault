-- go edit yourself, im tired :p

local grass = false
local trashcan = false
local trees = false
local walls = false
local leaderboard = false
local bench = false
local shadow = false
local debris = false

local function delete(obj)
    if obj then
        obj:Destroy()
    end
end

local map = workspace.Map

if grass then
    delete(map.GrassBottom)
    delete(map.GrassTop)
    delete(map.Grass)
end

if trashcan then
    delete(map.Trash)
end

if trees then
    delete(map.Trees)
end

if walls then
    delete(map.Walls)
    delete(map.GrassTop)
    delete(map.Grass)
end

if leaderboard then
    delete(map["Total Kills Leaderboard"])
    delete(map["Total Kills Leaderboard Real"])
    delete(workspace.Thrown["Donation Leaderboard"])
end

if bench then
    delete(map.Benchs)
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
            delete(obj)
        end
    end
end
