-- change the kill emote to any emote you want(kill emote is optional) and the delay too skibidi

_G.a = not _G.a

local delay = 0.1
local killemote = "Emerge"

local x = {}
for _, y in ipairs({12460977270, 13813099821, 14374357351, 12447247483, 14798608838}) do
    x["rbxassetid://" .. y] = true
end

if _G.a then
    local p = game:GetService("Players").LocalPlayer
    local c = p.Character or p.CharacterAdded:Wait()
    local h = c:WaitForChild("Humanoid")
    local n = h:FindFirstChildOfClass("Animator")

    local function m()
        while _G.a and task.wait(0.1) do
            local s = n:GetPlayingAnimationTracks()
            
            for _, y in ipairs(s) do
                local i = tostring(y.Animation.AnimationId)
                
                if x[i] then
                    y.Stopped:Wait()
                    task.wait(delay)
                    
                    local r = {{
                        Goal = "Emote",
                        Emote = killemote
                    }}
                    
                    local o = c:FindFirstChild("Communicate")
                    if o then
                        o:FireServer(unpack(r))
                    end
                    break
                end
            end
        end
    end

    p.CharacterAdded:Connect(function(z)
        c = z
        h = c:WaitForChild("Humanoid")
        n = h:FindFirstChildOfClass("Animator")
    end)

    spawn(m)
end
