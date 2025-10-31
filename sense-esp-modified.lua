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
                local PingAttribute = Player:GetAttribute("Ping")
                if PingAttribute then
                    return math.floor(PingAttribute)
                end
                return "N/A"
            end)
            PlayerPings[Player] = Success and Ping or "N/A"
        end
    end
end

RunService.Heartbeat:Connect(UpdatePlayerPings)

local EspObject = {}
EspObject.__index = EspObject

function EspObject.new(Player, Interface)
    local self = setmetatable({}, EspObject)
    self.player = Player
    self.interface = Interface
    self:Construct()
    return self
end

function EspObject:_create(Class, Properties)
    local Drawing = Drawing.new(Class)
    for Property, Value in next, Properties do
        pcall(function() Drawing[Property] = Value end)
    end
    self.bin[#self.bin + 1] = Drawing
    return Drawing
end

function EspObject:Construct()
    self.charCache = {}
    self.childCount = 0
    self.bin = {}
    self.drawings = {
        visible = {
            tracerOutline = self:_create("Line", { Thickness = 3, Visible = false }),
            tracer = self:_create("Line", { Thickness = 1, Visible = false }),
            healthBarOutline = self:_create("Line", { Thickness = 3, Visible = false }),
            healthBar = self:_create("Line", { Thickness = 1, Visible = false }),
            healthText = self:_create("Text", { Center = true, Visible = false }),
            name = self:_create("Text", { Text = self.player.DisplayName, Center = true, Visible = false }),
            distance = self:_create("Text", { Center = true, Visible = false }),
            ping = self:_create("Text", { Center = true, Visible = false }),
        },
        hidden = {
            arrowOutline = self:_create("Triangle", { Thickness = 3, Visible = false }),
            arrow = self:_create("Triangle", { Filled = true, Visible = false })
        }
    }

    self.renderConnection = RunService.Heartbeat:Connect(function(DeltaTime)
        self:Update(DeltaTime)
        self:Render(DeltaTime)
    end)
end

function EspObject:Destruct()
    if self.renderConnection then
        self.renderConnection:Disconnect()
    end
    if self.bin then
        for i = 1, #self.bin do
            if self.bin[i] then
                self.bin[i]:Remove()
            end
        end
    end
end

function EspObject:Update()
    local Interface = self.interface
    self.options = Interface.teamSettings[Interface.isFriendly(self.player) and "friendly" or "enemy"]
    self.character = Interface.getCharacter(self.player)
    self.health, self.maxHealth = Interface.getHealth(self.player)
    self.ping = PlayerPings[self.player] or "N/A"
    self.enabled = self.options.enabled and self.character and not
        (#Interface.whitelist > 0 and not Find(Interface.whitelist, self.player.UserId))

    local Head = self.enabled and FindFirstChild(self.character, "Head")
    if not Head then
        self.charCache = {}
        self.onScreen = false
        return
    end

    local _, OnScreen, Depth = WorldToScreen(Head.Position)
    self.onScreen = OnScreen
    self.distance = Depth

    if Interface.sharedSettings.limitDistance and Depth > Interface.sharedSettings.maxDistance then
        self.onScreen = false
    end

    if self.onScreen then
        local Children = GetChildren(self.character)
        if #self.charCache == 0 or self.childCount ~= #Children then
            self.charCache = {}
            for i = 1, #Children do
                local Part = Children[i]
                if IsA(Part, "BasePart") and IsBodyPart(Part.Name) then
                    table.insert(self.charCache, Part)
                end
            end
            self.childCount = #Children
        end
        self.corners = CalculateCorners(GetBoundingBox(self.charCache))
    elseif self.options.offScreenArrow then
        local CFrame = Camera.CFrame
        local Flat = FromMatrix(CFrame.Position, CFrame.RightVector, Vector3.yAxis)
        local ObjectSpace = PointToObjectSpace(Flat, Head.Position)
        self.direction = Vector2.new(ObjectSpace.X, ObjectSpace.Z).Unit
    end
end

function EspObject:Render()
    if not self.enabled then return end
    if not self.drawings then return end
    
    local OnScreen = self.onScreen or false
    local Enabled = self.enabled or false
    local Visible = self.drawings.visible
    local Hidden = self.drawings.hidden
    local Interface = self.interface
    local Options = self.options
    local Corners = self.corners

    if not Visible then return end

    Visible.healthBar.Visible = Enabled and OnScreen and Options.healthBar
    Visible.healthBarOutline.Visible = Visible.healthBar.Visible and Options.healthBarOutline
    if Visible.healthBar.Visible and Corners then
        local BarFrom = Corners.topLeft - HealthBarOffset
        local BarTo = Corners.bottomLeft - HealthBarOffset
        local HealthBar = Visible.healthBar
        HealthBar.To = BarTo
        HealthBar.From = Lerp2(BarTo, BarFrom, self.health/self.maxHealth)
        HealthBar.Color = LerpColor(Options.dyingColor, Options.healthyColor, self.health/self.maxHealth)
        local HealthBarOutline = Visible.healthBarOutline
        HealthBarOutline.To = BarTo + HealthBarOutlineOffset
        HealthBarOutline.From = BarFrom - HealthBarOutlineOffset
        HealthBarOutline.Color = ParseColor(self, Options.healthBarOutlineColor[1], true)
        HealthBarOutline.Transparency = Options.healthBarOutlineColor[2]
    end

    Visible.healthText.Visible = Enabled and OnScreen and Options.healthText
    if Visible.healthText.Visible and Corners then
        local BarFrom = Corners.topLeft - HealthBarOffset
        local BarTo = Corners.bottomLeft - HealthBarOffset
        local HealthText = Visible.healthText
        HealthText.Text = Round(self.health) .. "hp"
        HealthText.Size = Interface.sharedSettings.textSize
        HealthText.Font = Interface.sharedSettings.textFont
        HealthText.Color = ParseColor(self, Options.healthTextColor[1])
        HealthText.Transparency = Options.healthTextColor[2]
        HealthText.Outline = Options.healthTextOutline
        HealthText.OutlineColor = ParseColor(self, Options.healthTextOutlineColor, true)
        HealthText.Position = Lerp2(BarTo, BarFrom, self.health/self.maxHealth) - HealthText.TextBounds*0.5 - HealthTextOffset
    end

    Visible.name.Visible = Enabled and OnScreen and Options.name
    if Visible.name.Visible and Corners then
        local Name = Visible.name
        Name.Size = Interface.sharedSettings.textSize
        Name.Font = Interface.sharedSettings.textFont
        Name.Color = ParseColor(self, Options.nameColor[1])
        Name.Transparency = Options.nameColor[2]
        Name.Outline = Options.nameOutline
        Name.OutlineColor = ParseColor(self, Options.nameOutlineColor, true)
        Name.Position = (Corners.topLeft + Corners.topRight)*0.5 - Vector2.yAxis*Name.TextBounds.Y - NameOffset
    end

    Visible.distance.Visible = Enabled and OnScreen and self.distance and Options.distance
    if Visible.distance.Visible and Corners then
        local Distance = Visible.distance
        Distance.Text = Round(self.distance) .. " studs"
        Distance.Size = Interface.sharedSettings.textSize
        Distance.Font = Interface.sharedSettings.textFont
        Distance.Color = ParseColor(self, Options.distanceColor[1])
        Distance.Transparency = Options.distanceColor[2]
        Distance.Outline = Options.distanceOutline
        Distance.OutlineColor = ParseColor(self, Options.distanceOutlineColor, true)
        Distance.Position = (Corners.bottomLeft + Corners.bottomRight)*0.5 + DistanceOffset
    end

    Visible.ping.Visible = Enabled and OnScreen and Options.ping and self.ping ~= "N/A"
    if Visible.ping.Visible and Corners then
        local Ping = Visible.ping
        Ping.Text = self.ping .. "ms"
        Ping.Size = Interface.sharedSettings.textSize
        Ping.Font = Interface.sharedSettings.textFont
        Ping.Color = ParseColor(self, Options.pingColor[1])
        Ping.Transparency = Options.pingColor[2]
        Ping.Outline = Options.pingOutline
        Ping.OutlineColor = ParseColor(self, Options.pingOutlineColor, true)
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
        Tracer.Color = ParseColor(self, Options.tracerColor[1])
        Tracer.Transparency = Options.tracerColor[2]
        Tracer.To = (Corners.bottomLeft + Corners.bottomRight)*0.5
        Tracer.From = Options.tracerOrigin == "Middle" and ViewportSize*0.5 or
            Options.tracerOrigin == "Top" and ViewportSize*Vector2.new(0.5, 0) or
            Options.tracerOrigin == "Bottom" and ViewportSize*Vector2.new(0.5, 1)
        local TracerOutline = Visible.tracerOutline
        TracerOutline.Color = ParseColor(self, Options.tracerOutlineColor[1], true)
        TracerOutline.Transparency = Options.tracerOutlineColor[2]
        TracerOutline.To = Tracer.To
        TracerOutline.From = Tracer.From
    end

    Hidden.arrow.Visible = Enabled and (not OnScreen) and Options.offScreenArrow
    Hidden.arrowOutline.Visible = Hidden.arrow.Visible and Options.offScreenArrowOutline
    if Hidden.arrow.Visible and self.direction then
        local Arrow = Hidden.arrow
        Arrow.PointA = Min2(Max2(ViewportSize*0.5 + self.direction*Options.offScreenArrowRadius, Vector2.one*25), ViewportSize - Vector2.one*25)
        Arrow.PointB = Arrow.PointA - RotateVector(self.direction, 0.45)*Options.offScreenArrowSize
        Arrow.PointC = Arrow.PointA - RotateVector(self.direction, -0.45)*Options.offScreenArrowSize
        Arrow.Color = ParseColor(self, Options.offScreenArrowColor[1])
        Arrow.Transparency = Options.offScreenArrowColor[2]
        local ArrowOutline = Hidden.arrowOutline
        ArrowOutline.PointA = Arrow.PointA
        ArrowOutline.PointB = Arrow.PointB
        ArrowOutline.PointC = Arrow.PointC
        ArrowOutline.Color = ParseColor(self, Options.offScreenArrowOutlineColor[1], true)
        ArrowOutline.Transparency = Options.offScreenArrowOutlineColor[2]
    end
end

local ChamObject = {}
ChamObject.__index = ChamObject

function ChamObject.new(Player, Interface)
    local self = setmetatable({}, ChamObject)
    self.player = Player
    self.interface = Interface
    self:Construct()
    return self
end

function ChamObject:Construct()
    self.highlight = Instance.new("Highlight", Container)
    self.updateConnection = RunService.Heartbeat:Connect(function()
        self:Update()
    end)
end

function ChamObject:Destruct()
    if self.updateConnection then
        self.updateConnection:Disconnect()
    end
    if self.highlight then
        self.highlight:Destroy()
    end
end

function ChamObject:Update()
    if not self.highlight then return end
    
    local Highlight = self.highlight
    local Interface = self.interface
    local Character = Interface.getCharacter(self.player)
    local Options = Interface.teamSettings[Interface.isFriendly(self.player) and "friendly" or "enemy"]
    local Enabled = Options.enabled and Character and not
        (#Interface.whitelist > 0 and not Find(Interface.whitelist, self.player.UserId))
    Highlight.Enabled = Enabled and Options.chams
    if Highlight.Enabled then
        Highlight.Adornee = Character
        Highlight.FillColor = ParseColor(self, Options.chamsFillColor[1])
        Highlight.FillTransparency = Options.chamsFillColor[2]
        Highlight.OutlineColor = ParseColor(self, Options.chamsOutlineColor[1], true)
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
