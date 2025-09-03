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
    Elements = Tabs.Main:Tab({ Title = "loc:JOB", Icon = "info", Desc = "Information you need to know" }),
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
    Title = "Free Extra Slots(TSB)",
    Desc = "get Extra Slots without buying it",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Free Extra Slots(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        game.Players.LocalPlayer:SetAttribute("ExtraSlots", true)
    end
})

ElementsSection:Divider()

ElementsSection:Paragraph({
    Title = "No Slide Dash CD(TSB)",
    Desc = "no Cooldown for slide dash(execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "No Slide Dash CD(TSB)",
    Icon = "code",
    Callback = function()
        WindUI:Notify({
            Title = "Info",
            Content = "use at your own risk!",
            Icon = "bell",
            Duration = 3
        })
        workspace:SetAttribute("VIPServer", tostring(game.Players.LocalPlayer.UserId))
        workspace:SetAttribute("VIPServerOwner", game.Players.LocalPlayer.Name)
        
        gurt = not workspace:GetAttribute("NoDashCooldown")
        workspace:SetAttribute("NoDashCooldown", gurt)
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
    Title = "Noclip Players(TSB)",
    Desc = "noclip through players(execute again to disable)",
    Image = "info",
    ImageSize = 20,
    Color = "White"
})

ElementsSection:Button({
    Title = "Noclip Players(TSB)",
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


WindUI:AddTheme({
    Name = "Deep Ocean",
    Accent = "#0a0a23",
    Dialog = "#0f0f2d",
    Outline = "#4cc9f0",
    Text = "#e0f7ff",
    Placeholder = "#5d8aa8",
    Background = "#050518",
    Button = "#1e3a5f",
    Icon = "#72ddf7",
})
WindUI:AddTheme({
    Name = "Midnight Purple",
    Accent = "#1a1a2e",
    Dialog = "#22223b",
    Outline = "#9d4edd",
    Text = "#f5f3f4",
    Placeholder = "#7b2cbf",
    Background = "#0d0d1a",
    Button = "#4a4e69",
    Icon = "#c77dff",
})
WindUI:AddTheme({
    Name = "Forest Green",
    Accent = "#132a13",
    Dialog = "#1b4332",
    Outline = "#52b788",
    Text = "#f8f9fa",
    Placeholder = "#40916c",
    Background = "#0d1b12",
    Button = "#2d6a4f",
    Icon = "#95d5b2",
})
WindUI:AddTheme({
    Name = "Crimson Red",
    Accent = "#2b0707",
    Dialog = "#3d0c0c",
    Outline = "#e5383b",
    Text = "#f8f9fa",
    Placeholder = "#ba181b",
    Background = "#1a0404",
    Button = "#660708",
    Icon = "#e5383b",
})
WindUI:AddTheme({
    Name = "Amber Gold",
    Accent = "#332701",
    Dialog = "#4d3800",
    Outline = "#ffaa00",
    Text = "#fff9db",
    Placeholder = "#ffb700",
    Background = "#1a1400",
    Button = "#665200",
    Icon = "#ffd166",
})
WindUI:AddTheme({
    Name = "Arctic Blue",
    Accent = "#011f4b",
    Dialog = "#03396c",
    Outline = "#b9d6f2",
    Text = "#f1f9ff",
    Placeholder = "#5fa8d3",
    Background = "#001429",
    Button = "#0353a4",
    Icon = "#90e0ef",
})
WindUI:AddTheme({
    Name = "Lavender Dream",
    Accent = "#2d2039",
    Dialog = "#3c2a4d",
    Outline = "#d8bfd8",
    Text = "#f5f3ff",
    Placeholder = "#9f86c0",
    Background = "#1e1526",
    Button = "#5a4a7a",
    Icon = "#e6ccff",
})
WindUI:AddTheme({
    Name = "Sunset Orange",
    Accent = "#331800",
    Dialog = "#4d2600",
    Outline = "#ff8c42",
    Text = "#fff3e6",
    Placeholder = "#ff6b35",
    Background = "#1a0c00",
    Button = "#663c00",
    Icon = "#ff9f5a",
})
WindUI:AddTheme({
    Name = "Emerald City",
    Accent = "#00251a",
    Dialog = "#004d33",
    Outline = "#38b000",
    Text = "#e6fff2",
    Placeholder = "#008000",
    Background = "#00130d",
    Button = "#006633",
    Icon = "#70e000",
})
WindUI:AddTheme({
    Name = "Rose Quartz",
    Accent = "#3a0c2e",
    Dialog = "#4a113a",
    Outline = "#ffacc7",
    Text = "#ffe5ec",
    Placeholder = "#ff85a1",
    Background = "#250820",
    Button = "#6d2c4d",
    Icon = "#ffc2d1",
})
WindUI:AddTheme({
    Name = "Steel Gray",
    Accent = "#1a1a1a",
    Dialog = "#262626",
    Outline = "#cccccc",
    Text = "#f2f2f2",
    Placeholder = "#8c8c8c",
    Background = "#0d0d0d",
    Button = "#404040",
    Icon = "#bfbfbf",
})
WindUI:AddTheme({
    Name = "Tropical Teal",
    Accent = "#003f3f",
    Dialog = "#005757",
    Outline = "#00c9c9",
    Text = "#e0ffff",
    Placeholder = "#009696",
    Background = "#002626",
    Button = "#008080",
    Icon = "#00e6e6",
})
WindUI:AddTheme({
    Name = "Cherry Blossom",
    Accent = "#3d0026",
    Dialog = "#4d0033",
    Outline = "#ffb3c6",
    Text = "#ffe8f0",
    Placeholder = "#ff85a1",
    Background = "#260019",
    Button = "#660040",
    Icon = "#ffccd5",
})
WindUI:AddTheme({
    Name = "Electric Blue",
    Accent = "#000e33",
    Dialog = "#001a4d",
    Outline = "#00b4d8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#00071a",
    Button = "#003366",
    Icon = "#90e0ef",
})
WindUI:AddTheme({
    Name = "Desert Sand",
    Accent = "#332211",
    Dialog = "#4d3319",
    Outline = "#e6be8a",
    Text = "#fff5e6",
    Placeholder = "#cc9966",
    Background = "#1a1108",
    Button = "#665533",
    Icon = "#f2d0a4",
})
WindUI:AddTheme({
    Name = "Plum Purple",
    Accent = "#1e0f33",
    Dialog = "#2d1a4d",
    Outline = "#c77dff",
    Text = "#f2e6ff",
    Placeholder = "#9d4edd",
    Background = "#140a26",
    Button = "#4a2c80",
    Icon = "#d9b8ff",
})
WindUI:AddTheme({
    Name = "Mint Fresh",
    Accent = "#00251a",
    Dialog = "#004d33",
    Outline = "#80ffdb",
    Text = "#e6fff7",
    Placeholder = "#48bf84",
    Background = "#00130d",
    Button = "#00664d",
    Icon = "#99ffdd",
})
WindUI:AddTheme({
    Name = "Blood Moon",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Ocean Depth",
    Accent = "#000d33",
    Dialog = "#001a4d",
    Outline = "#0077b6",
    Text = "#e6f2ff",
    Placeholder = "#005c99",
    Background = "#00071a",
    Button = "#003366",
    Icon = "#0096c7",
})
WindUI:AddTheme({
    Name = "Golden Hour",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd166",
    Text = "#fff9e6",
    Placeholder = "#ffb700",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe08c",
})
WindUI:AddTheme({
    Name = "Twilight Blue",
    Accent = "#001433",
    Dialog = "#00264d",
    Outline = "#90e0ef",
    Text = "#e6f7ff",
    Placeholder = "#48cae4",
    Background = "#000a1a",
    Button = "#003a66",
    Icon = "#ade8f4",
})
WindUI:AddTheme({
    Name = "Berry Red",
    Accent = "#330a0a",
    Dialog = "#4d0f0f",
    Outline = "#ff6b6b",
    Text = "#ffe6e6",
    Placeholder = "#dc143c",
    Background = "#1a0505",
    Button = "#661414",
    Icon = "#ff8fa3",
})
WindUI:AddTheme({
    Name = "Moss Green",
    Accent = "#1a291a",
    Dialog = "#263826",
    Outline = "#8db600",
    Text = "#f2ffe6",
    Placeholder = "#6a994e",
    Background = "#0d140d",
    Button = "#405340",
    Icon = "#aacc00",
})
WindUI:AddTheme({
    Name = "Royal Purple",
    Accent = "#1a1033",
    Dialog = "#26194d",
    Outline = "#7209b7",
    Text = "#f2e6ff",
    Placeholder = "#560bad",
    Background = "#0d0826",
    Button = "#3a0ca3",
    Icon = "#9d4edd",
})
WindUI:AddTheme({
    Name = "Coral Reef",
    Accent = "#331914",
    Dialog = "#4d241c",
    Outline = "#ff8c61",
    Text = "#fff0eb",
    Placeholder = "#ff6b4a",
    Background = "#1a0d0a",
    Button = "#663c33",
    Icon = "#ffaa8a",
})
WindUI:AddTheme({
    Name = "Space Gray",
    Accent = "#0d0d0d",
    Dialog = "#1a1a1a",
    Outline = "#d9d9d9",
    Text = "#f2f2f2",
    Placeholder = "#8c8c8c",
    Background = "#050505",
    Button = "#333333",
    Icon = "#bfbfbf",
})
WindUI:AddTheme({
    Name = "Lemon Lime",
    Accent = "#233300",
    Dialog = "#354d00",
    Outline = "#ccff33",
    Text = "#f9ffe6",
    Placeholder = "#aacc00",
    Background = "#111a00",
    Button = "#556600",
    Icon = "#ddff77",
})
WindUI:AddTheme({
    Name = "Deep Wine",
    Accent = "#2d0a14",
    Dialog = "#3d0f1c",
    Outline = "#c81d4e",
    Text = "#ffe6eb",
    Placeholder = "#9d174d",
    Background = "#1a050a",
    Button = "#5a1423",
    Icon = "#e63946",
})
WindUI:AddTheme({
    Name = "Sky Blue",
    Accent = "#00264d",
    Dialog = "#004080",
    Outline = "#90cdf4",
    Text = "#e6f2ff",
    Placeholder = "#4299e1",
    Background = "#001a33",
    Button = "#0066cc",
    Icon = "#a3d5ff",
})
WindUI:AddTheme({
    Name = "Chocolate Brown",
    Accent = "#261a0d",
    Dialog = "#332213",
    Outline = "#d9b38c",
    Text = "#fff2e6",
    Placeholder = "#bf8c60",
    Background = "#130d06",
    Button = "#4d3319",
    Icon = "#e6ccb3",
})
WindUI:AddTheme({
    Name = "Iceberg Blue",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#a8d5e2",
    Text = "#e6f7ff",
    Placeholder = "#6bb5cc",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#c2e7ff",
})
WindUI:AddTheme({
    Name = "Pumpkin Orange",
    Accent = "#331900",
    Dialog = "#4d2600",
    Outline = "#ff8c42",
    Text = "#fff0e6",
    Placeholder = "#ff6b35",
    Background = "#1a0c00",
    Button = "#663300",
    Icon = "#ffaa70",
})
WindUI:AddTheme({
    Name = "Slate Gray",
    Accent = "#1a1a1a",
    Dialog = "#262626",
    Outline = "#a6a6a6",
    Text = "#f2f2f2",
    Placeholder = "#737373",
    Background = "#0d0d0d",
    Button = "#404040",
    Icon = "#bfbfbf",
})
WindUI:AddTheme({
    Name = "Mint Chocolate",
    Accent = "#1a291a",
    Dialog = "#263826",
    Outline = "#80ed99",
    Text = "#e6ffe6",
    Placeholder = "#57cc99",
    Background = "#0d140d",
    Button = "#405340",
    Icon = "#a7f3d0",
})
WindUI:AddTheme({
    Name = "Deep Sea",
    Accent = "#001f33",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#000f1a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Raspberry Red",
    Accent = "#330a14",
    Dialog = "#4d0f1f",
    Outline = "#ff4d6d",
    Text = "#ffe6eb",
    Placeholder = "#c9184a",
    Background = "#1a050a",
    Button = "#661426",
    Icon = "#ff8fa3",
})
WindUI:AddTheme({
    Name = "Olive Green",
    Accent = "#1a1f0d",
    Dialog = "#262e14",
    Outline = "#aacc00",
    Text = "#f9ffe6",
    Placeholder = "#8db600",
    Background = "#0d0f06",
    Button = "#404526",
    Icon = "#c0d904",
})
WindUI:AddTheme({
    Name = "Lavender Mist",
    Accent = "#2d2039",
    Dialog = "#3c2a4d",
    Outline = "#d8bfd8",
    Text = "#f5f3ff",
    Placeholder = "#9f86c0",
    Background = "#1e1526",
    Button = "#5a4a7a",
    Icon = "#e6e6fa",
})
WindUI:AddTheme({
    Name = "Sunset Pink",
    Accent = "#331a1a",
    Dialog = "#4d2626",
    Outline = "#ff8fa3",
    Text = "#ffe6eb",
    Placeholder = "#ff6b8b",
    Background = "#1a0d0d",
    Button = "#663333",
    Icon = "#ffb3c1",
})
WindUI:AddTheme({
    Name = "Electric Purple",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b5179e",
    Text = "#f2e6ff",
    Placeholder = "#7209b7",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#d16eff",
})
WindUI:AddTheme({
    Name = "Coffee Brown",
    Accent = "#261a0d",
    Dialog = "#332213",
    Outline = "#d9b38c",
    Text = "#fff2e6",
    Placeholder = "#bf8c60",
    Background = "#130d06",
    Button = "#4d3319",
    Icon = "#e6ccb3",
})
WindUI:AddTheme({
    Name = "Arctic White",
    Accent = "#0d0d0d",
    Dialog = "#1a1a1a",
    Outline = "#f0f0f0",
    Text = "#ffffff",
    Placeholder = "#b3b3b3",
    Background = "#050505",
    Button = "#333333",
    Icon = "#e6e6e6",
})
WindUI:AddTheme({
    Name = "Forest Night",
    Accent = "#0d1a0d",
    Dialog = "#142614",
    Outline = "#52b788",
    Text = "#e6ffe6",
    Placeholder = "#40916c",
    Background = "#050d05",
    Button = "#264026",
    Icon = "#95d5b2",
})
WindUI:AddTheme({
    Name = "Deep Magenta",
    Accent = "#2d0a2d",
    Dialog = "#3d0f3d",
    Outline = "#d16eff",
    Text = "#ffe6ff",
    Placeholder = "#9d4edd",
    Background = "#1a051a",
    Button = "#5a145a",
    Icon = "#e6b3ff",
})
WindUI:AddTheme({
    Name = "Ocean Blue",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#0077b6",
    Text = "#e6f7ff",
    Placeholder = "#005c99",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#0096c7",
})
WindUI:AddTheme({
    Name = "Crimson Rose",
    Accent = "#330a14",
    Dialog = "#4d0f1f",
    Outline = "#ff4d6d",
    Text = "#ffe6eb",
    Placeholder = "#c9184a",
    Background = "#1a050a",
    Button = "#661426",
    Icon = "#ff8fa3",
})
WindUI:AddTheme({
    Name = "Mint Tea",
    Accent = "#0d1a0d",
    Dialog = "#142614",
    Outline = "#80ed99",
    Text = "#e6ffe6",
    Placeholder = "#57cc99",
    Background = "#050d05",
    Button = "#264026",
    Icon = "#a7f3d0",
})
WindUI:AddTheme({
    Name = "Deep Violet",
    Accent = "#1a0d33",
    Dialog = "#26144d",
    Outline = "#9d4edd",
    Text = "#f2e6ff",
    Placeholder = "#7b2cbf",
    Background = "#0d0826",
    Button = "#331a66",
    Icon = "#c77dff",
})
WindUI:AddTheme({
    Name = "Sandstone",
    Accent = "#332211",
    Dialog = "#4d3319",
    Outline = "#e6be8a",
    Text = "#fff5e6",
    Placeholder = "#cc9966",
    Background = "#1a1108",
    Button = "#665533",
    Icon = "#f2d0a4",
})
WindUI:AddTheme({
    Name = "Midnight Blue",
    Accent = "#000d33",
    Dialog = "#001a4d",
    Outline = "#4cc9f0",
    Text = "#e0f7ff",
    Placeholder = "#5d8aa8",
    Background = "#00071a",
    Button = "#003366",
    Icon = "#90e0ef",
})

WindUI:AddTheme({
    Name = "Cyber Blue",
    Accent = "#001933",
    Dialog = "#00264d",
    Outline = "#00ffff",
    Text = "#e6ffff",
    Placeholder = "#00cccc",
    Background = "#000d1a",
    Button = "#004d66",
    Icon = "#00e6e6",
})
WindUI:AddTheme({
    Name = "Neon Pink",
    Accent = "#33001a",
    Dialog = "#4d0026",
    Outline = "#ff00aa",
    Text = "#ffe6f2",
    Placeholder = "#cc0088",
    Background = "#1a000d",
    Button = "#660033",
    Icon = "#ff33bb",
})
WindUI:AddTheme({
    Name = "Matrix Green",
    Accent = "#003300",
    Dialog = "#004d00",
    Outline = "#00ff00",
    Text = "#e6ffe6",
    Placeholder = "#00cc00",
    Background = "#001a00",
    Button = "#006600",
    Icon = "#33ff33",
})
WindUI:AddTheme({
    Name = "Sunset Gradient",
    Accent = "#331a00",
    Dialog = "#4d2600",
    Outline = "#ff8c42",
    Text = "#fff0e6",
    Placeholder = "#ff6b35",
    Background = "#1a0d00",
    Button = "#663300",
    Icon = "#ffaa70",
})
WindUI:AddTheme({
    Name = "Arctic Frost",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#b3e0ff",
    Text = "#f0f8ff",
    Placeholder = "#66b3ff",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#99ccff",
})
WindUI:AddTheme({
    Name = "Crimson Shadow",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Emerald Dream",
    Accent = "#002200",
    Dialog = "#003300",
    Outline = "#00cc66",
    Text = "#e6fff0",
    Placeholder = "#00994d",
    Background = "#001100",
    Button = "#005500",
    Icon = "#33ff99",
})
WindUI:AddTheme({
    Name = "Purple Haze",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#cc33ff",
    Text = "#f2e6ff",
    Placeholder = "#9900cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#d96eff",
})
WindUI:AddTheme({
    Name = "Gold Rush",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd700",
    Text = "#fff9e6",
    Placeholder = "#ccac00",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe066",
})
WindUI:AddTheme({
    Name = "Ocean Wave",
    Accent = "#002233",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#00111a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Blood Orange",
    Accent = "#331400",
    Dialog = "#4d1e00",
    Outline = "#ff6b35",
    Text = "#fff0e6",
    Placeholder = "#ff4d00",
    Background = "#1a0a00",
    Button = "#663800",
    Icon = "#ff8c5a",
})
WindUI:AddTheme({
    Name = "Midnight Forest",
    Accent = "#0d1a0d",
    Dialog = "#142614",
    Outline = "#52b788",
    Text = "#e6ffe6",
    Placeholder = "#40916c",
    Background = "#050d05",
    Button = "#264026",
    Icon = "#95d5b2",
})
WindUI:AddTheme({
    Name = "Electric Lime",
    Accent = "#1a3300",
    Dialog = "#264d00",
    Outline = "#ccff00",
    Text = "#f9ffe6",
    Placeholder = "#99cc00",
    Background = "#0d1a00",
    Button = "#406600",
    Icon = "#e6ff33",
})
WindUI:AddTheme({
    Name = "Deep Space",
    Accent = "#000033",
    Dialog = "#00004d",
    Outline = "#6666ff",
    Text = "#e6e6ff",
    Placeholder = "#3333cc",
    Background = "#00001a",
    Button = "#000066",
    Icon = "#9999ff",
})
WindUI:AddTheme({
    Name = "Rose Gold",
    Accent = "#331a1a",
    Dialog = "#4d2626",
    Outline = "#ffb3c1",
    Text = "#ffe6eb",
    Placeholder = "#ff8fa3",
    Background = "#1a0d0d",
    Button = "#663333",
    Icon = "#ffccd5",
})
WindUI:AddTheme({
    Name = "Aqua Marine",
    Accent = "#003333",
    Dialog = "#004d4d",
    Outline = "#00cccc",
    Text = "#e6ffff",
    Placeholder = "#009999",
    Background = "#001a1a",
    Button = "#006666",
    Icon = "#00e6e6",
})
WindUI:AddTheme({
    Name = "Dark Chocolate",
    Accent = "#1a0d00",
    Dialog = "#261400",
    Outline = "#bf8c60",
    Text = "#fff2e6",
    Placeholder = "#996640",
    Background = "#0d0600",
    Button = "#402000",
    Icon = "#d9b38c",
})
WindUI:AddTheme({
    Name = "Purple Rain",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b319e6",
    Text = "#f2e6ff",
    Placeholder = "#8c00cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#cc66ff",
})
WindUI:AddTheme({
    Name = "Lemon Zest",
    Accent = "#333300",
    Dialog = "#4d4d00",
    Outline = "#ffff00",
    Text = "#ffffe6",
    Placeholder = "#cccc00",
    Background = "#1a1a00",
    Button = "#666600",
    Icon = "#ffff33",
})
WindUI:AddTheme({
    Name = "Deep Coral",
    Accent = "#331914",
    Dialog = "#4d241c",
    Outline = "#ff8c61",
    Text = "#fff0eb",
    Placeholder = "#ff6b4a",
    Background = "#1a0d0a",
    Button = "#663c33",
    Icon = "#ffaa8a",
})
WindUI:AddTheme({
    Name = "Midnight Purple",
    Accent = "#0d0d33",
    Dialog = "#14144d",
    Outline = "#6666cc",
    Text = "#e6e6ff",
    Placeholder = "#4d4d99",
    Background = "#06061a",
    Button = "#262666",
    Icon = "#9999cc",
})
WindUI:AddTheme({
    Name = "Forest Moss",
    Accent = "#1a291a",
    Dialog = "#263826",
    Outline = "#8db600",
    Text = "#f2ffe6",
    Placeholder = "#6a994e",
    Background = "#0d140d",
    Button = "#405340",
    Icon = "#aacc00",
})
WindUI:AddTheme({
    Name = "Electric Cyan",
    Accent = "#003333",
    Dialog = "#004d4d",
    Outline = "#00ffff",
    Text = "#e6ffff",
    Placeholder = "#00cccc",
    Background = "#001a1a",
    Button = "#006666",
    Icon = "#00e6e6",
})
WindUI:AddTheme({
    Name = "Ruby Red",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Ocean Depth",
    Accent = "#001f33",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#000f1a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Amber Glow",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd166",
    Text = "#fff9e6",
    Placeholder = "#ffb700",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe08c",
})
WindUI:AddTheme({
    Name = "Deep Violet",
    Accent = "#1a0d33",
    Dialog = "#26144d",
    Outline = "#9d4edd",
    Text = "#f2e6ff",
    Placeholder = "#7b2cbf",
    Background = "#0d0826",
    Button = "#331a66",
    Icon = "#c77dff",
})
WindUI:AddTheme({
    Name = "Mossy Stone",
    Accent = "#1a291a",
    Dialog = "#263826",
    Outline = "#8db600",
    Text = "#f2ffe6",
    Placeholder = "#6a994e",
    Background = "#0d140d",
    Button = "#405340",
    Icon = "#aacc00",
})
WindUI:AddTheme({
    Name = "Sunset Orange",
    Accent = "#331800",
    Dialog = "#4d2600",
    Outline = "#ff8c42",
    Text = "#fff3e6",
    Placeholder = "#ff6b35",
    Background = "#1a0c00",
    Button = "#663c00",
    Icon = "#ff9f5a",
})
WindUI:AddTheme({
    Name = "Deep Blue Sea",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#0077b6",
    Text = "#e6f7ff",
    Placeholder = "#005c99",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#0096c7",
})
WindUI:AddTheme({
    Name = "Crimson Blood",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Emerald City",
    Accent = "#00251a",
    Dialog = "#004d33",
    Outline = "#38b000",
    Text = "#e6fff2",
    Placeholder = "#008000",
    Background = "#00130d",
    Button = "#006633",
    Icon = "#70e000",
})
WindUI:AddTheme({
    Name = "Purple Majesty",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b319e6",
    Text = "#f2e6ff",
    Placeholder = "#8c00cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#cc66ff",
})
WindUI:AddTheme({
    Name = "Golden Sun",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd700",
    Text = "#fff9e6",
    Placeholder = "#ccac00",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe066",
})
WindUI:AddTheme({
    Name = "Ocean Breeze",
    Accent = "#002233",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#00111a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Blood Red",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Forest Green",
    Accent = "#002200",
    Dialog = "#003300",
    Outline = "#00cc66",
    Text = "#e6fff0",
    Placeholder = "#00994d",
    Background = "#001100",
    Button = "#005500",
    Icon = "#33ff99",
})
WindUI:AddTheme({
    Name = "Purple Dream",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#cc33ff",
    Text = "#f2e6ff",
    Placeholder = "#9900cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#d96eff",
})
WindUI:AddTheme({
    Name = "Gold Leaf",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd700",
    Text = "#fff9e6",
    Placeholder = "#ccac00",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe066",
})
WindUI:AddTheme({
    Name = "Ocean Depth",
    Accent = "#001f33",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#000f1a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Crimson Rose",
    Accent = "#330a14",
    Dialog = "#4d0f1f",
    Outline = "#ff4d6d",
    Text = "#ffe6eb",
    Placeholder = "#c9184a",
    Background = "#1a050a",
    Button = "#661426",
    Icon = "#ff8fa3",
})
WindUI:AddTheme({
    Name = "Mint Fresh",
    Accent = "#00251a",
    Dialog = "#004d33",
    Outline = "#80ffdb",
    Text = "#e6fff7",
    Placeholder = "#48bf84",
    Background = "#00130d",
    Button = "#00664d",
    Icon = "#99ffdd",
})
WindUI:AddTheme({
    Name = "Deep Violet",
    Accent = "#1a0d33",
    Dialog = "#26144d",
    Outline = "#9d4edd",
    Text = "#f2e6ff",
    Placeholder = "#7b2cbf",
    Background = "#0d0826",
    Button = "#331a66",
    Icon = "#c77dff",
})
WindUI:AddTheme({
    Name = "Sandstone",
    Accent = "#332211",
    Dialog = "#4d3319",
    Outline = "#e6be8a",
    Text = "#fff5e6",
    Placeholder = "#cc9966",
    Background = "#1a1108",
    Button = "#665533",
    Icon = "#f2d0a4",
})
WindUI:AddTheme({
    Name = "Midnight Blue",
    Accent = "#000d33",
    Dialog = "#001a4d",
    Outline = "#4cc9f0",
    Text = "#e0f7ff",
    Placeholder = "#5d8aa8",
    Background = "#00071a",
    Button = "#003366",
    Icon = "#90e0ef",
})
WindUI:AddTheme({
    Name = "Cyber Green",
    Accent = "#003300",
    Dialog = "#004d00",
    Outline = "#00ff00",
    Text = "#e6ffe6",
    Placeholder = "#00cc00",
    Background = "#001a00",
    Button = "#006600",
    Icon = "#33ff33",
})
WindUI:AddTheme({
    Name = "Neon Blue",
    Accent = "#000033",
    Dialog = "#00004d",
    Outline = "#0066ff",
    Text = "#e6f0ff",
    Placeholder = "#0044cc",
    Background = "#00001a",
    Button = "#000066",
    Icon = "#3388ff",
})
WindUI:AddTheme({
    Name = "Sunset Red",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Forest Deep",
    Accent = "#002200",
    Dialog = "#003300",
    Outline = "#00cc66",
    Text = "#e6fff0",
    Placeholder = "#00994d",
    Background = "#001100",
    Button = "#005500",
    Icon = "#33ff99",
})
WindUI:AddTheme({
    Name = "Purple Night",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b319e6",
    Text = "#f2e6ff",
    Placeholder = "#8c00cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#cc66ff",
})
WindUI:AddTheme({
    Name = "Golden Hour",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd166",
    Text = "#fff9e6",
    Placeholder = "#ffb700",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe08c",
})
WindUI:AddTheme({
    Name = "Ocean Blue",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#0077b6",
    Text = "#e6f7ff",
    Placeholder = "#005c99",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#0096c7",
})
WindUI:AddTheme({
    Name = "Crimson Shadow",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Emerald Dream",
    Accent = "#002200",
    Dialog = "#003300",
    Outline = "#00cc66",
    Text = "#e6fff0",
    Placeholder = "#00994d",
    Background = "#001100",
    Button = "#005500",
    Icon = "#33ff99",
})
WindUI:AddTheme({
    Name = "Purple Haze",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#cc33ff",
    Text = "#f2e6ff",
    Placeholder = "#9900cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#d96eff",
})
WindUI:AddTheme({
    Name = "Gold Rush",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd700",
    Text = "#fff9e6",
    Placeholder = "#ccac00",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe066",
})
WindUI:AddTheme({
    Name = "Ocean Wave",
    Accent = "#002233",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#00111a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Blood Orange",
    Accent = "#331400",
    Dialog = "#4d1e00",
    Outline = "#ff6b35",
    Text = "#fff0e6",
    Placeholder = "#ff4d00",
    Background = "#1a0a00",
    Button = "#663800",
    Icon = "#ff8c5a",
})
WindUI:AddTheme({
    Name = "Midnight Forest",
    Accent = "#0d1a0d",
    Dialog = "#142614",
    Outline = "#52b788",
    Text = "#e6ffe6",
    Placeholder = "#40916c",
    Background = "#050d05",
    Button = "#264026",
    Icon = "#95d5b2",
})
WindUI:AddTheme({
    Name = "Electric Lime",
    Accent = "#1a3300",
    Dialog = "#264d00",
    Outline = "#ccff00",
    Text = "#f9ffe6",
    Placeholder = "#99cc00",
    Background = "#0d1a00",
    Button = "#406600",
    Icon = "#e6ff33",
})
WindUI:AddTheme({
    Name = "Deep Space",
    Accent = "#000033",
    Dialog = "#00004d",
    Outline = "#6666ff",
    Text = "#e6e6ff",
    Placeholder = "#3333cc",
    Background = "#00001a",
    Button = "#000066",
    Icon = "#9999ff",
})
WindUI:AddTheme({
    Name = "Rose Gold",
    Accent = "#331a1a",
    Dialog = "#4d2626",
    Outline = "#ffb3c1",
    Text = "#ffe6eb",
    Placeholder = "#ff8fa3",
    Background = "#1a0d0d",
    Button = "#663333",
    Icon = "#ffccd5",
})
WindUI:AddTheme({
    Name = "Aqua Marine",
    Accent = "#003333",
    Dialog = "#004d4d",
    Outline = "#00cccc",
    Text = "#e6ffff",
    Placeholder = "#009999",
    Background = "#001a1a",
    Button = "#006666",
    Icon = "#00e6e6",
})
WindUI:AddTheme({
    Name = "Dark Chocolate",
    Accent = "#1a0d00",
    Dialog = "#261400",
    Outline = "#bf8c60",
    Text = "#fff2e6",
    Placeholder = "#996640",
    Background = "#0d0600",
    Button = "#402000",
    Icon = "#d9b38c",
})
WindUI:AddTheme({
    Name = "Purple Rain",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b319e6",
    Text = "#f2e6ff",
    Placeholder = "#8c00cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#cc66ff",
})
WindUI:AddTheme({
    Name = "Lemon Zest",
    Accent = "#333300",
    Dialog = "#4d4d00",
    Outline = "#ffff00",
    Text = "#ffffe6",
    Placeholder = "#cccc00",
    Background = "#1a1a00",
    Button = "#666600",
    Icon = "#ffff33",
})
WindUI:AddTheme({
    Name = "Deep Coral",
    Accent = "#331914",
    Dialog = "#4d241c",
    Outline = "#ff8c61",
    Text = "#fff0eb",
    Placeholder = "#ff6b4a",
    Background = "#1a0d0a",
    Button = "#663c33",
    Icon = "#ffaa8a",
})
WindUI:AddTheme({
    Name = "Midnight Purple",
    Accent = "#0d0d33",
    Dialog = "#14144d",
    Outline = "#6666cc",
    Text = "#e6e6ff",
    Placeholder = "#4d4d99",
    Background = "#06061a",
    Button = "#262666",
    Icon = "#9999cc",
})
WindUI:AddTheme({
    Name = "Forest Moss",
    Accent = "#1a291a",
    Dialog = "#263826",
    Outline = "#8db600",
    Text = "#f2ffe6",
    Placeholder = "#6a994e",
    Background = "#0d140d",
    Button = "#405340",
    Icon = "#aacc00",
})
WindUI:AddTheme({
    Name = "Electric Cyan",
    Accent = "#003333",
    Dialog = "#004d4d",
    Outline = "#00ffff",
    Text = "#e6ffff",
    Placeholder = "#00cccc",
    Background = "#001a1a",
    Button = "#006666",
    Icon = "#00e6e6",
})
WindUI:AddTheme({
    Name = "Ruby Red",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Ocean Depth",
    Accent = "#001f33",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#000f1a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Amber Glow",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd166",
    Text = "#fff9e6",
    Placeholder = "#ffb700",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe08c",
})
WindUI:AddTheme({
    Name = "Deep Violet",
    Accent = "#1a0d33",
    Dialog = "#26144d",
    Outline = "#9d4edd",
    Text = "#f2e6ff",
    Placeholder = "#7b2cbf",
    Background = "#0d0826",
    Button = "#331a66",
    Icon = "#c77dff",
})
WindUI:AddTheme({
    Name = "Mossy Stone",
    Accent = "#1a291a",
    Dialog = "#263826",
    Outline = "#8db600",
    Text = "#f2ffe6",
    Placeholder = "#6a994e",
    Background = "#0d140d",
    Button = "#405340",
    Icon = "#aacc00",
})
WindUI:AddTheme({
    Name = "Sunset Orange",
    Accent = "#331800",
    Dialog = "#4d2600",
    Outline = "#ff8c42",
    Text = "#fff3e6",
    Placeholder = "#ff6b35",
    Background = "#1a0c00",
    Button = "#663c00",
    Icon = "#ff9f5a",
})
WindUI:AddTheme({
    Name = "Deep Blue Sea",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#0077b6",
    Text = "#e6f7ff",
    Placeholder = "#005c99",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#0096c7",
})
WindUI:AddTheme({
    Name = "Crimson Blood",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Emerald City",
    Accent = "#00251a",
    Dialog = "#004d33",
    Outline = "#38b000",
    Text = "#e6fff2",
    Placeholder = "#008000",
    Background = "#00130d",
    Button = "#006633",
    Icon = "#70e000",
})
WindUI:AddTheme({
    Name = "Purple Majesty",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b319e6",
    Text = "#f2e6ff",
    Placeholder = "#8c00cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#cc66ff",
})
WindUI:AddTheme({
    Name = "Golden Sun",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd700",
    Text = "#fff9e6",
    Placeholder = "#ccac00",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe066",
})
WindUI:AddTheme({
    Name = "Ocean Breeze",
    Accent = "#002233",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#00111a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Blood Red",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Forest Green",
    Accent = "#002200",
    Dialog = "#003300",
    Outline = "#00cc66",
    Text = "#e6fff0",
    Placeholder = "#00994d",
    Background = "#001100",
    Button = "#005500",
    Icon = "#33ff99",
})
WindUI:AddTheme({
    Name = "Purple Dream",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#cc33ff",
    Text = "#f2e6ff",
    Placeholder = "#9900cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#d96eff",
})
WindUI:AddTheme({
    Name = "Gold Leaf",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd700",
    Text = "#fff9e6",
    Placeholder = "#ccac00",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe066",
})
WindUI:AddTheme({
    Name = "Ocean Depth",
    Accent = "#001f33",
    Dialog = "#00334d",
    Outline = "#00a8e8",
    Text = "#e6f7ff",
    Placeholder = "#0077b6",
    Background = "#000f1a",
    Button = "#004d66",
    Icon = "#48cae4",
})
WindUI:AddTheme({
    Name = "Crimson Rose",
    Accent = "#330a14",
    Dialog = "#4d0f1f",
    Outline = "#ff4d6d",
    Text = "#ffe6eb",
    Placeholder = "#c9184a",
    Background = "#1a050a",
    Button = "#661426",
    Icon = "#ff8fa3",
})
WindUI:AddTheme({
    Name = "Mint Fresh",
    Accent = "#00251a",
    Dialog = "#004d33",
    Outline = "#80ffdb",
    Text = "#e6fff7",
    Placeholder = "#48bf84",
    Background = "#00130d",
    Button = "#00664d",
    Icon = "#99ffdd",
})
WindUI:AddTheme({
    Name = "Deep Violet",
    Accent = "#1a0d33",
    Dialog = "#26144d",
    Outline = "#9d4edd",
    Text = "#f2e6ff",
    Placeholder = "#7b2cbf",
    Background = "#0d0826",
    Button = "#331a66",
    Icon = "#c77dff",
})
WindUI:AddTheme({
    Name = "Sandstone",
    Accent = "#332211",
    Dialog = "#4d3319",
    Outline = "#e6be8a",
    Text = "#fff5e6",
    Placeholder = "#cc9966",
    Background = "#1a1108",
    Button = "#665533",
    Icon = "#f2d0a4",
})
WindUI:AddTheme({
    Name = "Midnight Blue",
    Accent = "#000d33",
    Dialog = "#001a4d",
    Outline = "#4cc9f0",
    Text = "#e0f7ff",
    Placeholder = "#5d8aa8",
    Background = "#00071a",
    Button = "#003366",
    Icon = "#90e0ef",
})
WindUI:AddTheme({
    Name = "Cyber Green",
    Accent = "#003300",
    Dialog = "#004d00",
    Outline = "#00ff00",
    Text = "#e6ffe6",
    Placeholder = "#00cc00",
    Background = "#001a00",
    Button = "#006600",
    Icon = "#33ff33",
})
WindUI:AddTheme({
    Name = "Neon Blue",
    Accent = "#000033",
    Dialog = "#00004d",
    Outline = "#0066ff",
    Text = "#e6f0ff",
    Placeholder = "#0044cc",
    Background = "#00001a",
    Button = "#000066",
    Icon = "#3388ff",
})
WindUI:AddTheme({
    Name = "Sunset Red",
    Accent = "#330000",
    Dialog = "#4d0000",
    Outline = "#ff3333",
    Text = "#ffe6e6",
    Placeholder = "#cc0000",
    Background = "#1a0000",
    Button = "#660000",
    Icon = "#ff6666",
})
WindUI:AddTheme({
    Name = "Forest Deep",
    Accent = "#002200",
    Dialog = "#003300",
    Outline = "#00cc66",
    Text = "#e6fff0",
    Placeholder = "#00994d",
    Background = "#001100",
    Button = "#005500",
    Icon = "#33ff99",
})
WindUI:AddTheme({
    Name = "Purple Night",
    Accent = "#1a0033",
    Dialog = "#26004d",
    Outline = "#b319e6",
    Text = "#f2e6ff",
    Placeholder = "#8c00cc",
    Background = "#0d001a",
    Button = "#400066",
    Icon = "#cc66ff",
})
WindUI:AddTheme({
    Name = "Golden Hour",
    Accent = "#332600",
    Dialog = "#4d3800",
    Outline = "#ffd166",
    Text = "#fff9e6",
    Placeholder = "#ffb700",
    Background = "#1a1300",
    Button = "#665200",
    Icon = "#ffe08c",
})
WindUI:AddTheme({
    Name = "Ocean Blue",
    Accent = "#001a33",
    Dialog = "#003366",
    Outline = "#0077b6",
    Text = "#e6f7ff",
    Placeholder = "#005c99",
    Background = "#000d1a",
    Button = "#004d80",
    Icon = "#0096c7",
})
WindUI:AddTheme({
    Name = "Aurora",
    Accent = "#0a0a23",
    Dialog = "#0f0f2d",
    Outline = "#4cc9f0",
    Text = "#e0f7ff",
    Placeholder = "#5d8aa8",
    Background = "#050518",
    Button = "#1e3a5f",
    Icon = "#72ddf7",
})

local themes = {
    "Deep Ocean",
    "Midnight Purple",
    "Forest Green",
    "Crimson Red",
    "Amber Gold",
    "Arctic Blue",
    "Lavender Dream",
    "Sunset Orange",
    "Emerald City",
    "Rose Quartz",
    "Steel Gray",
    "Tropical Teal",
    "Cherry Blossom",
    "Electric Blue",
    "Desert Sand",
    "Plum Purple",
    "Mint Fresh",
    "Blood Moon",
    "Ocean Depth",
    "Golden Hour",
    "Twilight Blue",
    "Berry Red",
    "Moss Green",
    "Royal Purple",
    "Coral Reef",
    "Space Gray",
    "Lemon Lime",
    "Deep Wine",
    "Sky Blue",
    "Chocolate Brown",
    "Iceberg Blue",
    "Pumpkin Orange",
    "Slate Gray",
    "Mint Chocolate",
    "Deep Sea",
    "Raspberry Red",
    "Olive Green",
    "Lavender Mist",
    "Sunset Pink",
    "Electric Purple",
    "Coffee Brown",
    "Arctic White",
    "Forest Night",
    "Deep Magenta",
    "Ocean Blue",
    "Crimson Rose",
    "Mint Tea",
    "Deep Violet",
    "Sandstone",
    "Midnight Blue",
    "Cyber Blue",
    "Neon Pink",
    "Matrix Green",
    "Sunset Gradient",
    "Arctic Frost",
    "Crimson Shadow",
    "Emerald Dream",
    "Purple Haze",
    "Gold Rush",
    "Ocean Wave",
    "Blood Orange",
    "Midnight Forest",
    "Electric Lime",
    "Deep Space",
    "Rose Gold",
    "Aqua Marine",
    "Dark Chocolate",
    "Purple Rain",
    "Lemon Zest",
    "Deep Coral",
    "Midnight Purple",
    "Forest Moss",
    "Electric Cyan",
    "Ruby Red",
    "Ocean Depth",
    "Amber Glow",
    "Deep Violet",
    "Mossy Stone",
    "Sunset Orange",
    "Deep Blue Sea",
    "Crimson Blood",
    "Emerald City",
    "Purple Majesty",
    "Golden Sun",
    "Ocean Breeze",
    "Blood Red",
    "Forest Green",
    "Purple Dream",
    "Gold Leaf",
    "Ocean Depth",
    "Crimson Rose",
    "Mint Fresh",
    "Deep Violet",
    "Sandstone",
    "Midnight Blue",
    "Cyber Green",
    "Neon Blue",
    "Sunset Red",
    "Forest Deep",
    "Purple Night",
    "Golden Hour",
    "Ocean Blue",
    "Aurora"
}

local RandomThemeButton = TabHandles.Appearance:Button({
    Title = "Set Random Theme",
    Desc = "apply a random theme from the vault",
    Locked = false,
    Callback = function()
        local randomTheme = themes[math.random(1, #themes)]
        WindUI:SetTheme(randomTheme)
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
