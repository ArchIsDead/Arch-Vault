local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local ViewportSize = Camera.ViewportSize
local Container = Instance.new("Folder", gethui and gethui() or game:GetService("CoreGui"))

local Floor = math.floor
local Round = math.round
local Sin = math.sin
local Cos = math.cos
local Clear = table.clear
local Unpack = table.unpack
local Find = table.find
local Create = table.create
local FromMatrix = CFrame.fromMatrix

local WorldToViewportPoint = Camera.WorldToViewportPoint
local IsA = Workspace.IsA
local GetPivot = Workspace.GetPivot
local FindFirstChild = Workspace.FindFirstChild
local FindFirstChildOfClass = Workspace.FindFirstChildOfClass
local GetChildren = Workspace.GetChildren
local ToOrientation = CFrame.identity.ToOrientation
local PointToObjectSpace = CFrame.identity.PointToObjectSpace
local LerpColor = Color3.new().Lerp
local Min2 = Vector2.zero.Min
local Max2 = Vector2.zero.Max
local Lerp2 = Vector2.zero.Lerp
local Min3 = Vector3.zero.Min
local Max3 = Vector3.zero.Max

local HealthBarOffset = Vector2.new(5, 0)
local HealthTextOffset = Vector2.new(3, 0)
local HealthBarOutlineOffset = Vector2.new(0, 1)
local NameOffset = Vector2.new(0, 2)
local DistanceOffset = Vector2.new(0, 2)
local PingOffset = Vector2.new(0, 2)
local Vertices = {
    Vector3.new(-1, -1, -1),
    Vector3.new(-1, 1, -1),
    Vector3.new(-1, 1, 1),
    Vector3.new(-1, -1, 1),
    Vector3.new(1, -1, -1),
    Vector3.new(1, 1, -1),
    Vector3.new(1, 1, 1),
    Vector3.new(1, -1, 1)
}

local function IsBodyPart(Name)
    return Name == "Head" or Name:find("Torso") or Name:find("Leg") or Name:find("Arm")
end

local function GetBoundingBox(Parts)
    local Min, Max
    for i = 1, #Parts do
        local Part = Parts[i]
        local CFrame, Size = Part.CFrame, Part.Size
        Min = Min3(Min or CFrame.Position, (CFrame - Size*0.5).Position)
        Max = Max3(Max or CFrame.Position, (CFrame + Size*0.5).Position)
    end
    local Center = (Min + Max)*0.5
    local Front = Vector3.new(Center.X, Center.Y, Max.Z)
    return CFrame.new(Center, Front), Max - Min
end

local function WorldToScreen(World)
    local Screen, InBounds = WorldToViewportPoint(Camera, World)
    return Vector2.new(Screen.X, Screen.Y), InBounds, Screen.Z
end

local function CalculateCorners(CFrame, Size)
    local Corners = Create(#Vertices)
    for i = 1, #Vertices do
        Corners[i] = WorldToScreen((CFrame + Size*0.5*Vertices[i]).Position)
    end
    local Min = Min2(ViewportSize, Unpack(Corners))
    local Max = Max2(Vector2.zero, Unpack(Corners))
    return {
        corners = Corners,
        topLeft = Vector2.new(Floor(Min.X), Floor(Min.Y)),
        topRight = Vector2.new(Floor(Max.X), Floor(Min.Y)),
        bottomLeft = Vector2.new(Floor(Min.X), Floor(Max.Y)),
        bottomRight = Vector2.new(Floor(Max.X), Floor(Max.Y))
    }
end

local function RotateVector(Vector, Radians)
    local X, Y = Vector.X, Vector.Y
    local C, S = Cos(Radians), Sin(Radians)
    return Vector2.new(X*C - Y*S, X*S + Y*C)
end

local function ParseColor(Self, Color, IsOutline)
    if Color == "Team Color" or (Self.interface.sharedSettings.useTeamColor and not IsOutline) then
        return Self.interface.getTeamColor(Self.player) or Color3.new(1,1,1)
    end
    return Color
end

local PlayerPings = {}

local function UpdatePlayerPings()
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            local Success, Ping = pcall(function()
                return Player:GetNetworkPing() * 1000
            end)
            PlayerPings[Player] = Success and math.floor(Ping) or "N/A"
        end
    end
end

RunService.Heartbeat:Connect(UpdatePlayerPings)

local EspObject = {}
EspObject.__index = EspObject

function EspObject.new(Player, Interface)
    local Self = setmetatable({}, EspObject)
    Self.player = Player
    Self.interface = Interface
    Self:Construct()
    return Self
end

function EspObject:_create(Class, Properties)
    local Drawing = Drawing.new(Class)
    for Property, Value in next, Properties do
        pcall(function() Drawing[Property] = Value end)
    end
    Self.bin[#Self.bin + 1] = Drawing
    return Drawing
end

function EspObject:Construct()
    Self.charCache = {}
    Self.childCount = 0
    Self.bin = {}
    Self.drawings = {
        visible = {
            tracerOutline = Self:_create("Line", { Thickness = 3, Visible = false }),
            tracer = Self:_create("Line", { Thickness = 1, Visible = false }),
            healthBarOutline = Self:_create("Line", { Thickness = 3, Visible = false }),
            healthBar = Self:_create("Line", { Thickness = 1, Visible = false }),
            healthText = Self:_create("Text", { Center = true, Visible = false }),
            name = Self:_create("Text", { Text = Self.player.DisplayName, Center = true, Visible = false }),
            distance = Self:_create("Text", { Center = true, Visible = false }),
            ping = Self:_create("Text", { Center = true, Visible = false }),
        },
        hidden = {
            arrowOutline = Self:_create("Triangle", { Thickness = 3, Visible = false }),
            arrow = Self:_create("Triangle", { Filled = true, Visible = false })
        }
    }

    Self.renderConnection = RunService.Heartbeat:Connect(function(DeltaTime)
        Self:Update(DeltaTime)
        Self:Render(DeltaTime)
    end)
end

function EspObject:Destruct()
    if Self.renderConnection then
        Self.renderConnection:Disconnect()
    end
    if Self.bin then
        for i = 1, #Self.bin do
            if Self.bin[i] then
                Self.bin[i]:Remove()
            end
        end
    end
    Self.charCache = nil
    Self.bin = nil
    Self.drawings = nil
end

function EspObject:Update()
    local Interface = Self.interface
    Self.options = Interface.teamSettings[Interface.isFriendly(Self.player) and "friendly" or "enemy"]
    Self.character = Interface.getCharacter(Self.player)
    Self.health, Self.maxHealth = Interface.getHealth(Self.player)
    Self.ping = PlayerPings[Self.player] or "N/A"
    Self.enabled = Self.options.enabled and Self.character and not
        (#Interface.whitelist > 0 and not Find(Interface.whitelist, Self.player.UserId))

    local Head = Self.enabled and FindFirstChild(Self.character, "Head")
    if not Head then
        Self.charCache = {}
        Self.onScreen = false
        return
    end

    local _, OnScreen, Depth = WorldToScreen(Head.Position)
    Self.onScreen = OnScreen
    Self.distance = Depth

    if Interface.sharedSettings.limitDistance and Depth > Interface.sharedSettings.maxDistance then
        Self.onScreen = false
    end

    if Self.onScreen then
        local Cache = Self.charCache
        local Children = GetChildren(Self.character)
        if not Cache[1] or Self.childCount ~= #Children then
            Self.charCache = {}
            for i = 1, #Children do
                local Part = Children[i]
                if IsA(Part, "BasePart") and IsBodyPart(Part.Name) then
                    table.insert(Self.charCache, Part)
                end
            end
            Self.childCount = #Children
        end
        Self.corners = CalculateCorners(GetBoundingBox(Self.charCache))
    elseif Self.options.offScreenArrow then
        local CFrame = Camera.CFrame
        local Flat = FromMatrix(CFrame.Position, CFrame.RightVector, Vector3.yAxis)
        local ObjectSpace = PointToObjectSpace(Flat, Head.Position)
        Self.direction = Vector2.new(ObjectSpace.X, ObjectSpace.Z).Unit
    end
end

function EspObject:Render()
    if not Self.enabled then return end
    if not Self.drawings then return end
    
    local OnScreen = Self.onScreen or false
    local Enabled = Self.enabled or false
    local Visible = Self.drawings.visible
    local Hidden = Self.drawings.hidden
    local Interface = Self.interface
    local Options = Self.options
    local Corners = Self.corners

    if not Visible then return end

    Visible.healthBar.Visible = Enabled and OnScreen and Options.healthBar
    Visible.healthBarOutline.Visible = Visible.healthBar.Visible and Options.healthBarOutline
    if Visible.healthBar.Visible and Corners then
        local BarFrom = Corners.topLeft - HealthBarOffset
        local BarTo = Corners.bottomLeft - HealthBarOffset
        local HealthBar = Visible.healthBar
        HealthBar.To = BarTo
        HealthBar.From = Lerp2(BarTo, BarFrom, Self.health/Self.maxHealth)
        HealthBar.Color = LerpColor(Options.dyingColor, Options.healthyColor, Self.health/Self.maxHealth)
        local HealthBarOutline = Visible.healthBarOutline
        HealthBarOutline.To = BarTo + HealthBarOutlineOffset
        HealthBarOutline.From = BarFrom - HealthBarOutlineOffset
        HealthBarOutline.Color = ParseColor(Self, Options.healthBarOutlineColor[1], true)
        HealthBarOutline.Transparency = Options.healthBarOutlineColor[2]
    end

    Visible.healthText.Visible = Enabled and OnScreen and Options.healthText
    if Visible.healthText.Visible and Corners then
        local BarFrom = Corners.topLeft - HealthBarOffset
        local BarTo = Corners.bottomLeft - HealthBarOffset
        local HealthText = Visible.healthText
        HealthText.Text = Round(Self.health) .. "hp"
        HealthText.Size = Interface.sharedSettings.textSize
        HealthText.Font = Interface.sharedSettings.textFont
        HealthText.Color = ParseColor(Self, Options.healthTextColor[1])
        HealthText.Transparency = Options.healthTextColor[2]
        HealthText.Outline = Options.healthTextOutline
        HealthText.OutlineColor = ParseColor(Self, Options.healthTextOutlineColor, true)
        HealthText.Position = Lerp2(BarTo, BarFrom, Self.health/Self.maxHealth) - HealthText.TextBounds*0.5 - HealthTextOffset
    end

    Visible.name.Visible = Enabled and OnScreen and Options.name
    if Visible.name.Visible and Corners then
        local Name = Visible.name
        Name.Size = Interface.sharedSettings.textSize
        Name.Font = Interface.sharedSettings.textFont
        Name.Color = ParseColor(Self, Options.nameColor[1])
        Name.Transparency = Options.nameColor[2]
        Name.Outline = Options.nameOutline
        Name.OutlineColor = ParseColor(Self, Options.nameOutlineColor, true)
        Name.Position = (Corners.topLeft + Corners.topRight)*0.5 - Vector2.yAxis*Name.TextBounds.Y - NameOffset
    end

    Visible.distance.Visible = Enabled and OnScreen and Self.distance and Options.distance
    if Visible.distance.Visible and Corners then
        local Distance = Visible.distance
        Distance.Text = Round(Self.distance) .. " studs"
        Distance.Size = Interface.sharedSettings.textSize
        Distance.Font = Interface.sharedSettings.textFont
        Distance.Color = ParseColor(Self, Options.distanceColor[1])
        Distance.Transparency = Options.distanceColor[2]
        Distance.Outline = Options.distanceOutline
        Distance.OutlineColor = ParseColor(Self, Options.distanceOutlineColor, true)
        Distance.Position = (Corners.bottomLeft + Corners.bottomRight)*0.5 + DistanceOffset
    end

    Visible.ping.Visible = Enabled and OnScreen and Options.ping and Self.ping ~= "N/A"
    if Visible.ping.Visible and Corners then
        local Ping = Visible.ping
        Ping.Text = Self.ping .. "ms"
        Ping.Size = Interface.sharedSettings.textSize
        Ping.Font = Interface.sharedSettings.textFont
        Ping.Color = ParseColor(Self, Options.pingColor[1])
        Ping.Transparency = Options.pingColor[2]
        Ping.Outline = Options.pingOutline
        Ping.OutlineColor = ParseColor(Self, Options.pingOutlineColor, true)
        local BasePosition
        if Visible.distance.Visible then
            BasePosition = Visible.distance.Position + Vector2.yAxis * Visible.distance.TextBounds.Y
        else
            BasePosition = (Corners.bottomLeft + Corners.bottomRight)*0.5 + PingOffset
        end
        Ping.Position = BasePosition
    end

    Visible.tracer.Visible = Enabled and OnScreen and Options.tracer
    Visible.tracerOutline.Visible = Visible.tracer.Visible and Options.tracerOutline
    if Visible.tracer.Visible and Corners then
        local Tracer = Visible.tracer
        Tracer.Color = ParseColor(Self, Options.tracerColor[1])
        Tracer.Transparency = Options.tracerColor[2]
        Tracer.To = (Corners.bottomLeft + Corners.bottomRight)*0.5
        Tracer.From = Options.tracerOrigin == "Middle" and ViewportSize*0.5 or
            Options.tracerOrigin == "Top" and ViewportSize*Vector2.new(0.5, 0) or
            Options.tracerOrigin == "Bottom" and ViewportSize*Vector2.new(0.5, 1)
        local TracerOutline = Visible.tracerOutline
        TracerOutline.Color = ParseColor(Self, Options.tracerOutlineColor[1], true)
        TracerOutline.Transparency = Options.tracerOutlineColor[2]
        TracerOutline.To = Tracer.To
        TracerOutline.From = Tracer.From
    end

    Hidden.arrow.Visible = Enabled and (not OnScreen) and Options.offScreenArrow
    Hidden.arrowOutline.Visible = Hidden.arrow.Visible and Options.offScreenArrowOutline
    if Hidden.arrow.Visible and Self.direction then
        local Arrow = Hidden.arrow
        Arrow.PointA = Min2(Max2(ViewportSize*0.5 + Self.direction*Options.offScreenArrowRadius, Vector2.one*25), ViewportSize - Vector2.one*25)
        Arrow.PointB = Arrow.PointA - RotateVector(Self.direction, 0.45)*Options.offScreenArrowSize
        Arrow.PointC = Arrow.PointA - RotateVector(Self.direction, -0.45)*Options.offScreenArrowSize
        Arrow.Color = ParseColor(Self, Options.offScreenArrowColor[1])
        Arrow.Transparency = Options.offScreenArrowColor[2]
        local ArrowOutline = Hidden.arrowOutline
        ArrowOutline.PointA = Arrow.PointA
        ArrowOutline.PointB = Arrow.PointB
        ArrowOutline.PointC = Arrow.PointC
        ArrowOutline.Color = ParseColor(Self, Options.offScreenArrowOutlineColor[1], true)
        ArrowOutline.Transparency = Options.offScreenArrowOutlineColor[2]
    end
end

local ChamObject = {}
ChamObject.__index = ChamObject

function ChamObject.new(Player, Interface)
    local Self = setmetatable({}, ChamObject)
    Self.player = Player
    Self.interface = Interface
    Self:Construct()
    return Self
end

function ChamObject:Construct()
    Self.highlight = Instance.new("Highlight", Container)
    Self.updateConnection = RunService.Heartbeat:Connect(function()
        Self:Update()
    end)
end

function ChamObject:Destruct()
    if Self.updateConnection then
        Self.updateConnection:Disconnect()
    end
    if Self.highlight then
        Self.highlight:Destroy()
    end
end

function ChamObject:Update()
    if not Self.highlight then return end
    
    local Highlight = Self.highlight
    local Interface = Self.interface
    local Character = Interface.getCharacter(Self.player)
    local Options = Interface.teamSettings[Interface.isFriendly(Self.player) and "friendly" or "enemy"]
    local Enabled = Options.enabled and Character and not
        (#Interface.whitelist > 0 and not Find(Interface.whitelist, Self.player.UserId))
    Highlight.Enabled = Enabled and Options.chams
    if Highlight.Enabled then
        Highlight.Adornee = Character
        Highlight.FillColor = ParseColor(Self, Options.chamsFillColor[1])
        Highlight.FillTransparency = Options.chamsFillColor[2]
        Highlight.OutlineColor = ParseColor(Self, Options.chamsOutlineColor[1], true)
        Highlight.OutlineTransparency = Options.chamsOutlineColor[2]
        Highlight.DepthMode = Options.chamsVisibleOnly and "Occluded" or "AlwaysOnTop"
    end
end

local EspInterface = {
    _hasLoaded = false,
    _objectCache = {},
    whitelist = {},
    sharedSettings = {
        textSize = 13,
        textFont = 2,
        limitDistance = false,
        maxDistance = 150,
        useTeamColor = false
    },
    teamSettings = {
        enemy = {
            enabled = false,
            healthBar = false,
            healthyColor = Color3.new(0,1,0),
            dyingColor = Color3.new(1,0,0),
            healthBarOutline = true,
            healthBarOutlineColor = { Color3.new(), 0.5 },
            healthText = false,
            healthTextColor = { Color3.new(1,1,1), 1 },
            healthTextOutline = true,
            healthTextOutlineColor = Color3.new(),
            name = false,
            nameColor = { Color3.new(1,1,1), 1 },
            nameOutline = true,
            nameOutlineColor = Color3.new(),
            distance = false,
            distanceColor = { Color3.new(1,1,1), 1 },
            distanceOutline = true,
            distanceOutlineColor = Color3.new(),
            tracer = false,
            tracerOrigin = "Bottom",
            tracerColor = { Color3.new(1,0,0), 1 },
            tracerOutline = true,
            tracerOutlineColor = { Color3.new(), 1 },
            offScreenArrow = false,
            offScreenArrowColor = { Color3.new(1,1,1), 1 },
            offScreenArrowSize = 15,
            offScreenArrowRadius = 150,
            offScreenArrowOutline = true,
            offScreenArrowOutlineColor = { Color3.new(), 1 },
            chams = false,
            chamsVisibleOnly = false,
            chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
            chamsOutlineColor = { Color3.new(1,0,0), 0 },
            ping = false,
            pingColor = { Color3.new(1, 1, 0), 1 },
            pingOutline = true,
            pingOutlineColor = Color3.new(0,0,0),
        },
        friendly = {
            enabled = false,
            healthBar = false,
            healthyColor = Color3.new(0,1,0),
            dyingColor = Color3.new(1,0,0),
            healthBarOutline = true,
            healthBarOutlineColor = { Color3.new(), 0.5 },
            healthText = false,
            healthTextColor = { Color3.new(1,1,1), 1 },
            healthTextOutline = true,
            healthTextOutlineColor = Color3.new(),
            name = false,
            nameColor = { Color3.new(1,1,1), 1 },
            nameOutline = true,
            nameOutlineColor = Color3.new(),
            distance = false,
            distanceColor = { Color3.new(1,1,1), 1 },
            distanceOutline = true,
            distanceOutlineColor = Color3.new(),
            tracer = false,
            tracerOrigin = "Bottom",
            tracerColor = { Color3.new(0,1,0), 1 },
            tracerOutline = true,
            tracerOutlineColor = { Color3.new(), 1 },
            offScreenArrow = false,
            offScreenArrowColor = { Color3.new(1,1,1), 1 },
            offScreenArrowSize = 15,
            offScreenArrowRadius = 150,
            offScreenArrowOutline = true,
            offScreenArrowOutlineColor = { Color3.new(), 1 },
            chams = false,
            chamsVisibleOnly = false,
            chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
            chamsOutlineColor = { Color3.new(0,1,0), 0 },
            ping = false,
            pingColor = { Color3.new(1, 1, 0), 1 },
            pingOutline = true,
            pingOutlineColor = Color3.new(0,0,0),
        }
    }
}

function EspInterface.Load()
    if EspInterface._hasLoaded then return end
    
    local function CreateObject(Player)
        EspInterface._objectCache[Player] = {
            EspObject.new(Player, EspInterface),
            ChamObject.new(Player, EspInterface)
        }
    end
    
    local function RemoveObject(Player)
        local Object = EspInterface._objectCache[Player]
        if Object then
            for i = 1, #Object do
                if Object[i] and Object[i].Destruct then
                    Object[i]:Destruct()
                end
            end
            EspInterface._objectCache[Player] = nil
        end
    end
    
    local PlayersList = Players:GetPlayers()
    for i = 1, #PlayersList do
        if PlayersList[i] ~= LocalPlayer then
            CreateObject(PlayersList[i])
        end
    end
    
    EspInterface.playerAdded = Players.PlayerAdded:Connect(CreateObject)
    EspInterface.playerRemoving = Players.PlayerRemoving:Connect(RemoveObject)
    EspInterface._hasLoaded = true
end

function EspInterface.Unload()
    if not EspInterface._hasLoaded then return end
    
    for Player, Object in pairs(EspInterface._objectCache) do
        if Object then
            for i = 1, #Object do
                if Object[i] and Object[i].Destruct then
                    Object[i]:Destruct()
                end
            end
        end
    end
    
    EspInterface._objectCache = {}
    
    if EspInterface.playerAdded then
        EspInterface.playerAdded:Disconnect()
    end
    if EspInterface.playerRemoving then
        EspInterface.playerRemoving:Disconnect()
    end
    
    EspInterface._hasLoaded = false
end

function EspInterface.getWeapon(Player)
    return "Unknown"
end

function EspInterface.isFriendly(Player)
    return Player.Team and Player.Team == LocalPlayer.Team
end

function EspInterface.getTeamColor(Player)
    return Player.Team and Player.Team.TeamColor and Player.Team.TeamColor.Color
end

function EspInterface.getCharacter(Player)
    return Player.Character
end

function EspInterface.getHealth(Player)
    local Character = Player and EspInterface.getCharacter(Player)
    local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
    if Humanoid then
        return Humanoid.Health, Humanoid.MaxHealth
    end
    return 100, 100
end

return EspInterface
