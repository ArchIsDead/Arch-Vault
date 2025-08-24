local grass = false
local trashcan = false
local trees = false
local shadow = false
local bench = false
local leaderboard = false
local walls = false

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

local trees = false
if trees then
    delete(map.Trees)
end

local walls = false
if walls then
    delete(map.Walls)
    delete(map.GrassTop)
    delete(map.Grass)
end

local leaderboard = false
if leaderboard then
    delete(map["Total Kills Leaderboard"])
    delete(map["Total Kills Leaderboard Real"])
    delete(workspace.Thrown["Donation Leaderboard"])
end

local bench = false
if bench then
    delete(map.Benchs)
end

local shadow = false
if shadow then
    while true do
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("shadow") then
                delete(obj)
            end
        end
        wait(0.1)
    end
end
