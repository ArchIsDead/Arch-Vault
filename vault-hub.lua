-- yes fully open source Vault

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["WELCOME"] = "Welcome to Arch-Vault!",
            ["IMAGEBRO"] = "Arch-Vault",
            ["LIB_DESC"] = "Tuff Script",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["JOB"] = "Information",
            ["UI_ELEMENTS"] = "Scripts",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency"
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = "loc:IMAGEBRO",
    Icon = "skull",
    Author = "loc:WELCOME",
    Folder = "malware",
    Size = UDim2.fromOffset(580, 415),
    Theme = "Dark",
    Background = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#151515"), Transparency = 1 },
        ["100"] = { Color = Color3.fromHex("#3E3E3E"), Transparency = 0.9 },
    }, {
         Rotation = 45,
    }),
    Background = "rbxassetid://101866555353434",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:Notify({
                Title = "yo",
                Content = "gurt",
                Duration = 3
            })
        end
    },
    Acrylic = true,
    HideSearchBar = false,
    SideBarWidth = 200,
})

Window:SetBackgroundImage("rbxassetid://101866555353434")

Window:EditOpenButton({
    Title = "Open Arch-Vault",
    Icon = "skull",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("5C5C5C"), 
        Color3.fromHex("A0A0A0")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

WindUI:SetFont("rbxassetid://12187360881")


Window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromHex("#151515")
})
Window:Tag({
    Title = "Beta",
    Color = Color3.fromHex("#3E3E3E")
})
local TimeTag = Window:Tag({
    Title = "--:--",
    Radius = 0,
    Color = Color3.fromHex("#000000"),
    Color = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#151515"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#3E3E3E"), Transparency = 0 },
    }, {
        Rotation = 45,
    }),
})


local hue = 0

task.spawn(function()
	while true do
		local now = os.date("*t")
		local hours = string.format("%02d", now.hour)
		local minutes = string.format("%02d", now.min)
		
		hue = (hue + 0.01) % 1
		local color = Color3.fromHSV(hue, 1, 1)
		
		TimeTag:SetTitle(hours .. ":" .. minutes)

		task.wait(0.06)
	end
end)


Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
end, 990)

local Tabs = {
    Main = Window:Section({ Title = "loc:FEATURES", Opened = true }),
    Stuff = Window:Section({ Title = "loc:SETTINGS", Opened = true }),
}

local TabHandles = {
    Elements = Tabs.Main:Tab({ Title = "loc:UI_ELEMENTS", Icon = "square-library", Desc = "Script Vault" }),
    Appearance = Tabs.Stuff:Tab({ Title = "loc:APPEARANCE", Icon = "brush" }),
    Config = Tabs.Stuff:Tab({ Title = "loc:CONFIGURATION", Icon = "settings" })
}

TabHandles.Elements:Paragraph({
    Title = "Arch-Vault",
    Desc = "Get some script you can use in the strongest battleground or universal (some)!",
    Image = "component",
    ImageSize = 20,
    Color = Color3.fromHex("#30ff6a"),
})

TabHandles.Elements:Divider()

local ElementsSection = TabHandles.Elements:Section({
    Title = "Script",
    Icon = "code",
})

TabHandles.Elements:Divider()

local mangopmo = TabHandles.Elements:Section({
    Title = "Teleport",
    Icon = "navigation-2",
})

TabHandles.Elements:Divider()

local gooner = TabHandles.Elements:Section({
    Title = "LocalPlayer",
    Icon = "user",
})

TabHandles.Elements:Divider()

local sybau = TabHandles.Elements:Section({
    Title = "Server",
    Icon = "server",
})

TabHandles.Elements:Divider()

TabHandles.Elements:Paragraph({
    Title = "Support Me ❤️",
    Desc = "github.com/ArchIsDead/Arch-Vault",
    Image = "github",
    ImageSize = 20,
    Color = "Grey",
    Buttons = {
        {
            Title = "Copy Link",
            Icon = "copy",
            Variant = "Tertiary",
            Callback = function()
                setclipboard("https://github.com/ArchIsDead/Arch-Vault")
                WindUI:Notify({
                    Title = "Copied!",
                    Content = "GitHub link copied to clipboard",
                    Duration = 2
                })
            end
        }
    }
})

local Code = TabHandles.Elements:Code({
    Title = "Code",
    Code = [[print("yt : archthehonoredone")]]
})

ElementsSection:Paragraph({
    Title = "Auto Toxic(TSB)",
    Desc = "if your kills gain 1 it will send the message that are set",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Auto Toxic(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/auto-toxic.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Buy Unreleased Emotes(TSB)",
    Desc = "you can buy unreleased or old emote with robux using this!",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Buy Unreleased Emote(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/buy-unreleased-emote.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Ping ESP(TSB)",
    Desc = "you can se other players ping with accuracy of 80-90%(very close)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Ping ESP(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/ping-esp.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Auto Grasp(TSB)",
    Desc = "after you downslam it will automatically use hunter grasp(execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Auto Grasp(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/downslam-grasp.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Char ESP(TSB)",
    Desc = "you can see other players character with icon on top of their head(execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Char ESP(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/tsb-char-esp.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Block ESP(TSB)",
    Desc = "if someone use block it will show a red block icon on their torso(execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Block ESP(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/block-esp.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Dummy ESP(TSB)",
    Desc = "2 variant, basic & animated (execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Basic Dummy ESP(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/weakest-dummy-esp-basic.lua"))()
    end
})

ElementsSection:Button({
    Title = "Animated Dummy ESP(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/weakest-dummy-esp-tuff.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Noclip Players(Universal)",
    Desc = "noclip through players(execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Noclip Players(Universal)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/noclip-players.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Dash CD UI(TSB)",
    Desc = "see the cooldown time after you dash",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Dash CD UI(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/dash-cooldown-ui.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Ping UI(Universal)",
    Desc = "see your current ping",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Ping UI(Universal)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/ping-counter.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "No Anims(Universal)",
    Desc = "remove your animation",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "No Anims(Universal)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/no-anims.lua"))()
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "Camlock(Universal)",
    Desc = "Some kind of aimbot and gud",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Camlock(Universal)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/camlock-tuff.lua"))()
    end
})

ElementsSection:Divider()

local Dropdown = mangopmo:Dropdown({
    Title = "Teleport Locations",
    Values = { "Death Counter Room", "Atomic Room", "Baseplate", "Mountain 1", "Mountain 2", "Mountain 3" },
    Value = "Select Location",
    Callback = function(option) 
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        if option == "Death Counter Room" then
            humanoidRootPart.CFrame = CFrame.new(-92, 29, 20347)
        elseif option == "Atomic Room" then
            humanoidRootPart.CFrame = CFrame.new(1079, 155, 23003)
        elseif option == "Baseplate" then
            humanoidRootPart.CFrame = CFrame.new(968, 20, 23088)
        elseif option == "Mountain 1" then
            humanoidRootPart.CFrame = CFrame.new(266, 699, 458)
        elseif option == "Mountain 2" then
            humanoidRootPart.CFrame = CFrame.new(551, 630, -265)
        elseif option == "Mountain 3" then
            humanoidRootPart.CFrame = CFrame.new(-107, 642, -328)
        end
        
    end
})

local Dropdown67 = mangopmo:Dropdown({
    Title = "Teleport to Player",
    Values = {"No players available"},
    Value = "Select a player",
    Callback = function(selectedPlayer)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        local targetPlayer = Players:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character and LocalPlayer.Character then
            local targetChar = targetPlayer.Character
            local humanoidRootPart = targetChar:FindFirstChild("HumanoidRootPart")
            local localRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart and localRootPart then
                localRootPart.CFrame = humanoidRootPart.CFrame
            end
        end
    end
})

mangopmo:Divider()

local function gurt()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local playerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    if #playerList == 0 then
        playerList = {"No players available"}
    end
    Dropdown67:Refresh(playerList)
end

game:GetService("Players").PlayerAdded:Connect(gurt)
game:GetService("Players").PlayerRemoving:Connect(gurt)

gurt()

local input = gooner:Input({
    Title = "Jump Power",
    Desc = "Set your jump power",
    Value = "50",
    InputIcon = "arrow-up-from-line",
    Type = "Input",
    Placeholder = "Enter jump power...",
    Callback = function(input)
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpPower = tonumber(input) or 50
        end
    end
})

local input2 = gooner:Input({
    Title = "Walk Speed",
    Desc = "Set your walk speed", 
    Value = "16",
    InputIcon = "chevrons-up",
    Type = "Input",
    Placeholder = "Enter walk speed...",
    Callback = function(input)
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = tonumber(input) or 16
        end
    end
})

local input3 = gooner:Input({
    Title = "Gravity",
    Desc = "Set gravity",
    Value = "196.2",
    InputIcon = "circle-fading-arrow-up",
    Type = "Input",
    Placeholder = "Enter gravity...",
    Callback = function(input)
        workspace.Gravity = tonumber(input) or 196.2
    end
})

local input4 = gooner:Input({
    Title = "FOV",
    Desc = "Set FOV",
    Value = "70",
    InputIcon = "camera",
    Type = "Input",
    Placeholder = "Enter FOV...",
    Callback = function(input)
        game.Workspace.CurrentCamera.FieldOfView = tonumber(input) or 70
    end
})

gooner:Divider()

local togglemustard = gooner:Toggle({
    Title = "No Fatigue",
    Desc = "Disable fatigue",
    Icon = "zap-off",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        workspace:SetAttribute("NoFatigue", state)
    end
})

local togglemango = gooner:Toggle({
    Title = "No Slide Dash Cooldown",
    Desc = "Remove slide dash cooldown ",
    Icon = "refresh-ccw",
    Type = "package-open",
    Default = false,
    Callback = function(state)
        workspace:SetAttribute("NoDashCooldown", state)
    end
})

local togglesybau = gooner:Toggle({
    Title = "Extra Slots",
    Desc = "Gives free extra slots",
    Icon = "plus-square",
    Type = "package-open",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        localPlayer:SetAttribute("ExtraSlots", state)
    end
})

local togglepmo = gooner:Toggle({
    Title = "Emote Search Bar",
    Desc = "Gives free emote search bar",
    Icon = "search",
    Type = "package-open",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        localPlayer:SetAttribute("EmoteSearchBar", state)
    end
})

gooner:Divider()

local buttonmaybe = sybau:Button({
    Title = "Server Hop",
    Desc = "Teleport you to the other server",
    Locked = false,
    Callback = function()
        local skibidi = game.PlaceId
        local mustarded = game.Players.MaxPlayers
        
        local gooned = false
        
        pcall(function()
            local mangoed = game:HttpGet("https://games.roblox.com/v1/games/"..skibidi.."/servers/Public?limit=100")
            mangoed = game:GetService("HttpService"):JSONDecode(mangoed)
            
            local skibied = {}
            local mustard = {}
            
            for _, server in pairs(mangoed.data) do
                if server.id ~= game.JobId then
                    local goon = server.playing
                    
                    if goon >= 5 and goon <= mustarded * 0.8 then
                        table.insert(skibied, server.id)
                    elseif goon < mustarded then
                        table.insert(mustard, server.id)
                    end
                end
            end
            
            if #skibied > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(skibidi, skibied[math.random(#skibied)])
                gooned = true
            elseif #mustard > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(skibidi, mustard[math.random(#mustard)])
                gooned = true
            end
        end)
        
        if not gooned then
            game:GetService("TeleportService"):Teleport(skibidi)
        end
    end
})

sybau:Divider()










































TabHandles.Appearance:Paragraph({
    Title = "Customize Interface",
    Desc = "Personalize your experience",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local canchangetheme = true
local canchangedropdown = true



local themeDropdown = TabHandles.Appearance:Dropdown({
    Title = "loc:THEME_SELECT",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        canchangedropdown = false
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "Theme Applied",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
        canchangedropdown = true
    end
})

local transparencySlider = TabHandles.Appearance:Slider({
    Title = "loc:TRANSPARENCY",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        WindUI.TransparencyValue = tonumber(value)
        Window:ToggleTransparency(tonumber(value) > 0)
    end
})













WindUI:OnThemeChange(function(theme)
    canchangetheme = false
    ThemeToggle:Set(theme == "Dark")
    canchangetheme = true
end)

local configName = "default"
local configFile = nil

TabHandles.Config:Input({
    Title = "Config Name",
    Value = configName,
    Callback = function(value)
        configName = value or "default"
    end
})

local ConfigManager = Window.ConfigManager
if ConfigManager then
    ConfigManager:Init(Window)
    
    TabHandles.Config:Button({
        Title = "loc:SAVE_CONFIG",
        Icon = "save",
        Variant = "Primary",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            
            configFile:Register("featureToggle", featureToggle)
            configFile:Register("intensitySlider", intensitySlider)
            configFile:Register("modeDropdown", modeDropdown)
            configFile:Register("themeDropdown", themeDropdown)
            configFile:Register("transparencySlider", transparencySlider)
            
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            
            if configFile:Save() then
                WindUI:Notify({ 
                    Title = "loc:SAVE_CONFIG", 
                    Content = "Saved as: "..configName,
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({ 
                    Title = "Error", 
                    Content = "Failed to save config",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    TabHandles.Config:Button({
        Title = "loc:LOAD_CONFIG",
        Icon = "folder",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            local loadedData = configFile:Load()
            
            if loadedData then
                if loadedData.playerData then
                    MyPlayerData = loadedData.playerData
                end
                
                local lastSave = loadedData.lastSave or "Unknown"
                WindUI:Notify({ 
                    Title = "loc:LOAD_CONFIG", 
                    Content = "Loaded: "..configName.."\nLast save: "..lastSave,
                    Icon = "refresh-cw",
                    Duration = 5
                })
            else
                WindUI:Notify({ 
                    Title = "Error", 
                    Content = "Failed to load config",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
else
    TabHandles.Config:Paragraph({
        Title = "Config Manager Not Available",
        Desc = "This feature requires ConfigManager",
        Image = "alert-triangle",
        ImageSize = 20,
        Color = "White"
    })
end


local footerSection = Window:Section({ Title = "Arch-Vault Open Source"})

Window:OnClose(function()
    if ConfigManager and configFile then
        configFile:Set("playerData", MyPlayerData)
        configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
        configFile:Save()
    end
end)

Window:OnDestroy(function()
    print("idk boy like me")
end)
