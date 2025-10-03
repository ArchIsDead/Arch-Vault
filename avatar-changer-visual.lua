local UI1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()

local Win1 = UI1:Window({
    Title = "Gurt",
    Desc = "Skibidi Mangoes Mustard",
    Icon = 96482086458333,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Gurt"
    }
})

local Plr1 = game:GetService("Players")
local Me1 = Plr1.LocalPlayer

local function Mor1(ID1)
    local Suc1, App1 = pcall(function()
        return Plr1:GetCharacterAppearanceAsync(ID1)
    end)
    
    if not Suc1 then
        Win1:Notify({
            Title = "Error",
            Desc = "can't turn yo into target avatar vro",
            Time = 3
        })
        return false
    end
    
    local Pl2 = Me1
    local Chr1 = Pl2.Character
    if not Chr1 then 
        Win1:Notify({
            Title = "Error",
            Desc = "I can't find yo character vro",
            Time = 3
        })
        return false
    end

    local Hum1 = Chr1:WaitForChild("Humanoid")
    
    for _, Itm1 in pairs(Chr1:GetChildren()) do
        if Itm1:IsA("Accessory") or Itm1:IsA("Shirt") or Itm1:IsA("Pants") or Itm1:IsA("CharacterMesh") or Itm1:IsA("BodyColors") then
            Itm1:Destroy()
        end
    end
    
    if Chr1:FindFirstChild("Head") and Chr1.Head:FindFirstChild("face") then
        Chr1.Head.face:Destroy()
    end

    for _, Itm2 in pairs(App1:GetChildren()) do
        if Itm2:IsA("Accessory") then
            local Acc1 = Itm2:Clone()
            if Acc1:FindFirstChild("Handle") then
                for _, Acc2 in pairs(Chr1:GetChildren()) do
                    if Acc2:IsA("Accessory") and Acc2.Name == Acc1.Name then
                        Acc2:Destroy()
                    end
                end
                Hum1:AddAccessory(Acc1)
            end
        end
    end

    for _, Itm3 in pairs(App1:GetChildren()) do
        if Itm3:IsA("Shirt") or Itm3:IsA("Pants") or Itm3:IsA("BodyColors") then
            Itm3:Clone().Parent = Chr1
        elseif Itm3:IsA("CharacterMesh") then
            if Hum1.RigType == Enum.HumanoidRigType.R15 then
                Itm3:Clone().Parent = Chr1
            end
        elseif Itm3.Name == "R15" then
            if Hum1.RigType == Enum.HumanoidRigType.R15 then
                local Msh1 = Itm3:FindFirstChildOfClass("CharacterMesh")
                if Msh1 then
                    Msh1:Clone().Parent = Chr1
                end
            end
        end
    end

    if Chr1:FindFirstChild("Head") then
        if App1:FindFirstChild("face") then
            App1.face:Clone().Parent = Chr1.Head
        else
            local Fac1 = Instance.new("Decal")
            Fac1.Face = Enum.NormalId.Front
            Fac1.Name = "face"
            Fac1.Texture = "rbxasset://textures/face.png"
            Fac1.Transparency = 0
            Fac1.Parent = Chr1.Head
        end
    end

    task.wait(0.1)
    local Par1 = Chr1.Parent
    Chr1.Parent = nil
    Chr1.Parent = Par1

    Win1:Notify({
        Title = "Success",
        Desc = "Yes vro",
        Time = 3
    })
    return true
end

local function Rst1()
    local Chr2 = Me1.Character
    if Chr2 then
        Chr2:BreakJoints()
    end
end

local Inp1 = ""
local Tab1 = Win1:Tab({Title = "Stuffs", Icon = "user"})

Tab1:Section({Title = "Tuff"})

Tab1:Textbox({
    Title = "Set target username or userid",
    Desc = "Enter any player username or UserID",
    Placeholder = "kaiton_280",
    Value = "",
    ClearTextOnFocus = false,
    Callback = function(Txt1)
        Inp1 = Txt1
    end
})

Tab1:Button({
    Title = "Set Avatar",
    Desc = "Turn you into the target blud",
    Callback = function()
        if Inp1 and Inp1 ~= "" then
            local Num1 = tonumber(Inp1)
            if Num1 then
                Mor1(Num1)
            else
                local Pl3 = Plr1:FindFirstChild(Inp1)
                if Pl3 then
                    Mor1(Pl3.UserId)
                else
                    local Suc2, Res1 = pcall(function()
                        return Plr1:GetUserIdFromNameAsync(Inp1)
                    end)
                    
                    if Suc2 then
                        Mor1(Res1)
                    else
                        Win1:Notify({
                            Title = "Error",
                            Desc = "Player not found",
                            Time = 3
                        })
                    end
                end
            end
        else
            Win1:Notify({
                Title = "Error",
                Desc = "Enter username or UserID",
                Time = 3
            })
        end
    end
})

Tab1:Section({Title = "Gurt"})

Tab1:Button({
    Title = "Reset Character",
    Desc = "Reset your character",
    Callback = Rst1
})


Win1:Notify({
    Title = "Gurt",
    Desc = "Yes arch sigma",
    Time = 4
})
