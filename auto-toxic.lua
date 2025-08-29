-- don't be toxic if you don't want to be GOONED by arxh the skibidi one
-- execute 2x to disable btw(not tested cuz I'm lazy)

local P = game:GetService("Players")
local U = game:GetService("UserInputService")
local T = game:GetService("TweenService")
local C = game:GetService("CoreGui")
local L = P.LocalPlayer

local S = Instance.new("ScreenGui")
S.Name = "gotchu"
S.ResetOnSpawn = false
S.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
S.Parent = C

local M = Instance.new("Frame")
M.Name = "skibidi"
M.Size = UDim2.new(0, 260, 0, 200)
M.Position = UDim2.new(0.05, 0, 0.1, 0)
M.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
M.BorderColor3 = Color3.fromRGB(60, 60, 60)
M.BorderSizePixel = 1
M.ClipsDescendants = true
M.Parent = S

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = M

local B = Instance.new("Frame")
B.Name = "meh"
B.Size = UDim2.new(1, 0, 0, 32)
B.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
B.BorderSizePixel = 0
B.Parent = M

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = B

local X = Instance.new("TextLabel")
X.Name = "naw"
X.Size = UDim2.new(1, -40, 1, 0)
X.Position = UDim2.new(0, 10, 0, 0)
X.BackgroundTransparency = 1
X.Text = "Auto Toxic"
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.TextXAlignment = Enum.TextXAlignment.Left
X.Font = Enum.Font.GothamMedium
X.TextSize = 14
X.Parent = B

local N = Instance.new("TextButton")
N.Name = "ihate"
N.Size = UDim2.new(0, 32, 0, 32)
N.Position = UDim2.new(1, -32, 0, 0)
N.BackgroundTransparency = 1
N.Text = "_"
N.TextColor3 = Color3.fromRGB(255, 255, 255)
N.Font = Enum.Font.GothamBold
N.TextSize = 18
N.Parent = B

local F = Instance.new("Frame")
F.Name = "nu"
F.Size = UDim2.new(0, 150, 0, 32)
F.Position = M.Position
F.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
F.BorderColor3 = Color3.fromRGB(60, 60, 60)
F.BorderSizePixel = 1
F.Visible = false
F.Parent = S

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 10)
minCorner.Parent = F

local Y = Instance.new("TextLabel")
Y.Name = "sigma"
Y.Size = UDim2.new(1, -40, 1, 0)
Y.Position = UDim2.new(0, 10, 0, 0)
Y.BackgroundTransparency = 1
Y.Text = "Auto Toxic"
Y.TextColor3 = Color3.fromRGB(255, 255, 255)
Y.TextXAlignment = Enum.TextXAlignment.Left
Y.Font = Enum.Font.GothamMedium
Y.TextSize = 14
Y.Parent = F

local Z = Instance.new("TextButton")
Z.Name = "very"
Z.Size = UDim2.new(0, 32, 0, 32)
Z.Position = UDim2.new(1, -32, 0, 0)
Z.BackgroundTransparency = 1
Z.Text = "+"
Z.TextColor3 = Color3.fromRGB(255, 255, 255)
Z.Font = Enum.Font.GothamBold
Z.TextSize = 18
Z.Parent = F

local O = Instance.new("Frame")
O.Name = "yes"
O.Size = UDim2.new(1, -16, 1, -48)
O.Position = UDim2.new(0, 8, 0, 40)
O.BackgroundTransparency = 1
O.Parent = M

local A = Instance.new("TextLabel")
A.Name = "skibidi"
A.Size = UDim2.new(1, 0, 0, 18)
A.BackgroundTransparency = 1
A.Text = "Message:"
A.TextColor3 = Color3.fromRGB(220, 220, 220)
A.TextXAlignment = Enum.TextXAlignment.Left
A.Font = Enum.Font.Gotham
A.TextSize = 12
A.Parent = O

local D = Instance.new("TextBox")
D.Name = "goon"
D.Size = UDim2.new(1, 0, 0, 28)
D.Position = UDim2.new(0, 0, 0, 18)
D.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
D.BorderColor3 = Color3.fromRGB(80, 80, 80)
D.BorderSizePixel = 1
D.Text = "Ez Kid"
D.TextColor3 = Color3.fromRGB(255, 255, 255)
D.Font = Enum.Font.Gotham
D.TextSize = 12
D.PlaceholderText = "Message..."
D.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
D.ClearTextOnFocus = false
D.Parent = O

local textCorner = Instance.new("UICorner")
textCorner.CornerRadius = UDim.new(0, 5)
textCorner.Parent = D

local E = Instance.new("TextLabel")
E.Name = "maybe"
E.Size = UDim2.new(0.45, 0, 0, 18)
E.Position = UDim2.new(0, 0, 0, 56)
E.BackgroundTransparency = 1
E.Text = "Repeat:"
E.TextColor3 = Color3.fromRGB(220, 220, 220)
E.TextXAlignment = Enum.TextXAlignment.Left
E.Font = Enum.Font.Gotham
E.TextSize = 12
E.Parent = O

local H = Instance.new("TextBox")
H.Name = "sixseven"
H.Size = UDim2.new(0.45, 0, 0, 28)
H.Position = UDim2.new(0, 0, 0, 74)
H.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
H.BorderColor3 = Color3.fromRGB(80, 80, 80)
H.BorderSizePixel = 1
H.Text = "1"
H.TextColor3 = Color3.fromRGB(255, 255, 255)
H.Font = Enum.Font.Gotham
H.TextSize = 12
H.Parent = O

local repeatCorner = Instance.new("UICorner")
repeatCorner.CornerRadius = UDim.new(0, 5)
repeatCorner.Parent = H

local I = Instance.new("TextLabel")
I.Name = "bruh"
I.Size = UDim2.new(0.45, 0, 0, 18)
I.Position = UDim2.new(0.55, 0, 0, 56)
I.BackgroundTransparency = 1
I.Text = "Cooldown:"
I.TextColor3 = Color3.fromRGB(220, 220, 220)
I.TextXAlignment = Enum.TextXAlignment.Left
I.Font = Enum.Font.Gotham
I.TextSize = 12
I.Parent = O

local J = Instance.new("TextBox")
J.Name = "idk"
J.Size = UDim2.new(0.45, 0, 0, 28)
J.Position = UDim2.new(0.55, 0, 0, 74)
J.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
J.BorderColor3 = Color3.fromRGB(80, 80, 80)
J.BorderSizePixel = 1
J.Text = "1"
J.TextColor3 = Color3.fromRGB(255, 255, 255)
J.Font = Enum.Font.Gotham
J.TextSize = 12
J.Parent = O

local coolCorner = Instance.new("UICorner")
coolCorner.CornerRadius = UDim.new(0, 5)
coolCorner.Parent = J

local K = Instance.new("TextButton")
K.Name = "yes"
K.Size = UDim2.new(1, 0, 0, 32)
K.Position = UDim2.new(0, 0, 0, 112)
K.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
K.BorderSizePixel = 0
K.Text = "ENABLED"
K.TextColor3 = Color3.fromRGB(100, 255, 100)
K.Font = Enum.Font.GothamBold
K.TextSize = 14
K.Parent = O

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = K

local W = {
    Message = "Ez Kid",
    RepeatCount = 1,
    Cooldown = 1,
    Enabled = true
}

local V, Q, _

local function update(input)
    local delta = input.Position - Q
    local newPos = UDim2.new(_.X.Scale, _.X.Offset + delta.X, _.Y.Scale, _.Y.Offset + delta.Y)
    
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = T:Create(M, tweenInfo, {Position = newPos})
    tween:Play()
    
    local minTween = T:Create(F, tweenInfo, {Position = newPos})
    minTween:Play()
end

local function startDrag(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        V = true
        Q = input.Position
        _ = M.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                V = false
            end
        end)
    end
end

B.InputBegan:Connect(startDrag)
F.InputBegan:Connect(startDrag)
Y.InputBegan:Connect(startDrag)
X.InputBegan:Connect(startDrag)

local function trackInput(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        Q = input
    end
end

B.InputChanged:Connect(trackInput)
F.InputChanged:Connect(trackInput)
Y.InputChanged:Connect(trackInput)
X.InputChanged:Connect(trackInput)

U.InputChanged:Connect(function(input)
    if input == Q and V then
        update(input)
    end
end)

N.MouseButton1Click:Connect(function()
    M.Visible = false
    F.Visible = true
end)

Z.MouseButton1Click:Connect(function()
    F.Visible = false
    M.Visible = true
end)

D.FocusLost:Connect(function()
    W.Message = D.Text
end)

H.FocusLost:Connect(function()
    local num = tonumber(H.Text)
    if num and num > 0 then
        W.RepeatCount = num
    else
        H.Text = tostring(W.RepeatCount)
    end
end)

J.FocusLost:Connect(function()
    local num = tonumber(J.Text)
    if num and num > 0 then
        W.Cooldown = num
    else
        J.Text = tostring(W.Cooldown)
    end
end)

K.MouseButton1Click:Connect(function()
    W.Enabled = not W.Enabled
    if W.Enabled then
        K.Text = "ENABLED"
        K.TextColor3 = Color3.fromRGB(100, 255, 100)
        K.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    else
        K.Text = "DISABLED"
        K.TextColor3 = Color3.fromRGB(255, 100, 100)
        K.BackgroundColor3 = Color3.fromRGB(65, 50, 50)
    end
end)

if _G.Gurt then
    _G.Gurt:Disconnect()
    _G.Gurt = nil
    return
end

local l = L:WaitForChild("leaderstats")
local k = l:WaitForChild("Kills")

local lK = k.Value
local iS = false

local function sM()
    if not W.Enabled or iS then return end
    iS = true
    
    for i = 1, W.RepeatCount do
        if game:GetService("TextChatService") then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(W.Message)
        end
        wait(W.Cooldown)
    end
    
    iS = false
end

_G.Gurt = k.Changed:Connect(function()
    if k.Value > lK and W.Enabled then
        sM()
    end
    lK = k.Value
end)
