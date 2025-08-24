-- go edit yourself, im tired :p

local grass = false
local trashcan = false
local trees = false
local walls = false
local leaderboard = false
local bench = false
local shadow = false
local debris = false

local function destroy(obj)
    if obj then
        obj:Destroy()
    end
end

local map = workspace.Map

if grass then
    destroy(map.GrassBottom)
    destroy(map.GrassTop)
    destroy(map.Grass)
end

if trashcan then
    destroy(map.Trash)
end

if trees then
    destroy(map.Trees)
end

if walls then
    destroy(map.Walls)
    destroy(map.GrassTop)
    destroy(map.Grass)
end

if leaderboard then
    destroy(map["Total Kills Leaderboard"])
    destroy(map["Total Kills Leaderboard Real"])
    destroy(workspace.Thrown["Donation Leaderboard"])
end

if bench then
    destroy(map.Benchs)
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
            destroy(obj)
        end
    end
end
