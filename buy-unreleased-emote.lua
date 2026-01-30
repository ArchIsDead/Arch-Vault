-- arch.rest/discord ONTOP!

local J7 = game:GetService("MarketplaceService")
local P3 = game:GetService("ReplicatedStorage")
local X9 = game:GetService("Players")
local K2 = game:GetService("UserInputService")

local R5 = X9.LocalPlayer
local M8 = R5:WaitForChild("Plalocal K1 = game:GetService("MarketplaceService")
local V2 = game:GetService("ReplicatedStorage")
local N3 = game:GetService("Players")
local X4 = game:GetService("UserInputService")

local Q5 = N3.LocalPlayer
local W6 = Q5:WaitForChild("PlayerGui")

local A7 = Instance.new("ScreenGui")
local B8 = Instance.new("Frame")
local C9 = Instance.new("Frame")
local D0 = Instance.new("TextLabel")
local E1 = Instance.new("TextButton")
local F2 = Instance.new("ScrollingFrame")
local Z9 = {}

A7.Parent = W6
A7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
A7.DisplayOrder = 10

B8.Parent = A7
B8.Size = UDim2.new(0.7, 0, 0.7, 0)
B8.Position = UDim2.new(0.15, 0, 0.15, 0)
B8.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
B8.BorderSizePixel = 2
B8.BorderColor3 = Color3.fromRGB(0, 0, 0)
B8.ClipsDescendants = true

C9.Parent = B8
C9.Size = UDim2.new(1, 0, 0, 25)
C9.BackgroundColor3 = Color3.fromRGB(0, 0, 128)
C9.BorderSizePixel = 0
C9.ZIndex = 2

D0.Parent = C9
D0.Size = UDim2.new(1, -30, 1, 0)
D0.Position = UDim2.new(0, 5, 0, 0)
D0.BackgroundTransparency = 1
D0.Text = "arch.rest/discord"
D0.TextColor3 = Color3.fromRGB(255, 255, 255)
D0.TextXAlignment = Enum.TextXAlignment.Left
D0.Font = Enum.Font.SourceSans
D0.TextSize = 14
D0.ZIndex = 3

E1.Parent = C9
E1.Size = UDim2.new(0, 20, 0, 20)
E1.Position = UDim2.new(1, -22, 0, 2)
E1.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
E1.BorderSizePixel = 1
E1.BorderColor3 = Color3.fromRGB(0, 0, 0)
E1.Text = "X"
E1.TextColor3 = Color3.fromRGB(0, 0, 0)
E1.Font = Enum.Font.SourceSans
E1.TextSize = 14
E1.ZIndex = 3

F2.Parent = B8
F2.Size = UDim2.new(1, -10, 1, -35)
F2.Position = UDim2.new(0, 5, 0, 30)
F2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
F2.BorderSizePixel = 1
F2.BorderColor3 = Color3.fromRGB(0, 0, 0)
F2.ScrollBarImageColor3 = Color3.fromRGB(192, 192, 192)
F2.ScrollBarThickness = 12
F2.AutomaticCanvasSize = Enum.AutomaticSize.Y
F2.ScrollingDirection = Enum.ScrollingDirection.Y
F2.VerticalScrollBarInset = Enum.ScrollBarInset.Always

E1.MouseButton1Click:Connect(function()
   A7.Enabled = false
end)

local function S5(Y8, T7)
   local G3 = Instance.new("Frame")
   local H4 = Instance.new("ImageLabel")
   local I5 = Instance.new("TextLabel")
   local J6 = Instance.new("TextLabel")
   local K7 = Instance.new("TextLabel")
   local L8 = Instance.new("Frame")
   local M9 = Instance.new("TextButton")
   local N0 = Instance.new("TextButton")
   local O1 = Instance.new("Frame")
   local P2 = Instance.new("ScrollingFrame")
   local Q3 = Instance.new("UIListLayout")
   local R4 = Instance.new("TextButton")
   
   G3.Size = UDim2.new(1, -4, 0, 80)
   G3.Position = UDim2.new(0, 2, 0, T7)
   G3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   G3.BorderSizePixel = 1
   G3.BorderColor3 = Color3.fromRGB(192, 192, 192)
   G3.Parent = F2
   
   H4.Size = UDim2.new(0, 60, 0, 60)
   H4.Position = UDim2.new(0, 8, 0.5, -30)
   H4.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
   H4.BorderSizePixel = 1
   H4.BorderColor3 = Color3.fromRGB(0, 0, 0)
   H4.Image = "rbxassetid://" .. tostring(Y8.Image)
   H4.Parent = G3
   
   I5.Size = UDim2.new(0.35, -80, 0, 20)
   I5.Position = UDim2.new(0, 76, 0, 8)
   I5.BackgroundTransparency = 1
   I5.Text = Y8.Name
   I5.TextColor3 = Color3.fromRGB(0, 0, 0)
   I5.TextXAlignment = Enum.TextXAlignment.Left
   I5.Font = Enum.Font.SourceSans
   I5.TextSize = 14
   I5.TextTruncate = Enum.TextTruncate.AtEnd
   I5.Parent = G3
   
   J6.Size = UDim2.new(0.35, -80, 0, 18)
   J6.Position = UDim2.new(0, 76, 0, 28)
   J6.BackgroundTransparency = 1
   J6.Text = "Price: " .. tostring(Y8.Price) .. " Robux"
   J6.TextColor3 = Color3.fromRGB(0, 0, 0)
   J6.TextXAlignment = Enum.TextXAlignment.Left
   J6.Font = Enum.Font.SourceSans
   J6.TextSize = 12
   J6.Parent = G3
   
   K7.Size = UDim2.new(0.35, -80, 0, 18)
   K7.Position = UDim2.new(0, 76, 0, 46)
   K7.BackgroundTransparency = 1
   K7.Text = "ID: " .. tostring(Y8.ID)
   K7.TextColor3 = Color3.fromRGB(128, 128, 128)
   K7.TextXAlignment = Enum.TextXAlignment.Left
   K7.Font = Enum.Font.SourceSans
   K7.TextSize = 12
   K7.Parent = G3
   
   L8.Size = UDim2.new(0, 130, 0, 24)
   L8.Position = UDim2.new(1, -240, 0.5, -12)
   L8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   L8.BorderSizePixel = 1
   L8.BorderColor3 = Color3.fromRGB(0, 0, 0)
   L8.ZIndex = 5
   L8.Parent = G3
   
   M9.Size = UDim2.new(1, -20, 1, 0)
   M9.BackgroundTransparency = 1
   M9.Text = "Select Receiver..."
   M9.Font = Enum.Font.SourceSans
   M9.TextSize = 13
   M9.TextColor3 = Color3.fromRGB(0, 0, 0)
   M9.TextXAlignment = Enum.TextXAlignment.Left
   M9.Parent = L8
   
   N0.Size = UDim2.new(0, 20, 1, 0)
   N0.Position = UDim2.new(1, -20, 0, 0)
   N0.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
   N0.BorderSizePixel = 1
   N0.BorderColor3 = Color3.fromRGB(0, 0, 0)
   N0.Text = "v"
   N0.Font = Enum.Font.SourceSans
   N0.TextSize = 10
   N0.TextColor3 = Color3.fromRGB(0, 0, 0)
   N0.Parent = L8
   
   O1.Size = UDim2.new(1, 0, 0, 120)
   O1.Position = UDim2.new(0, 0, 1, 0)
   O1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   O1.BorderSizePixel = 1
   O1.BorderColor3 = Color3.fromRGB(0, 0, 0)
   O1.Visible = false
   O1.ZIndex = 10
   O1.Parent = L8
   
   P2.Size = UDim2.new(1, 0, 1, 0)
   P2.BackgroundTransparency = 1
   P2.BorderSizePixel = 0
   P2.ScrollBarThickness = 8
   P2.ScrollBarImageColor3 = Color3.fromRGB(192, 192, 192)
   P2.CanvasSize = UDim2.new(0, 0, 0, 0)
   P2.Parent = O1
   
   Q3.Parent = P2
   
   local U7 = nil
   
   local function V8()
       for _, C2 in pairs(P2:GetChildren()) do
           if C2:IsA("TextButton") then
               C2:Destroy()
           end
       end
       
       local W1 = 0
       for _, X2 in pairs(N3:GetPlayers()) do
           if X2 ~= Q5 then
               local Y3 = Instance.new("TextButton")
               Y3.Size = UDim2.new(1, 0, 0, 22)
               Y3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
               Y3.BorderSizePixel = 0
               Y3.Text = X2.Name
               Y3.Font = Enum.Font.SourceSans
               Y3.TextSize = 13
               Y3.TextColor3 = Color3.fromRGB(0, 0, 0)
               Y3.Parent = P2
               
               Y3.MouseButton1Click:Connect(function()
                   M9.Text = X2.Name
                   U7 = X2.UserId
                   O1.Visible = false
               end)
               
               W1 = W1 + 22
           end
       end
       
       P2.CanvasSize = UDim2.new(0, 0, 0, W1)
   end
   
   local function Z4()
       if O1.Visible then
           O1.Visible = false
       else
           V8()
           O1.Visible = true
       end
   end
   
   M9.MouseButton1Click:Connect(Z4)
   N0.MouseButton1Click:Connect(Z4)
   
   table.insert(Z9, V8)
   
   R4.Size = UDim2.new(0, 100, 0, 26)
   R4.Position = UDim2.new(1, -105, 0.5, -13)
   R4.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
   R4.BorderSizePixel = 1
   R4.BorderColor3 = Color3.fromRGB(0, 0, 0)
   R4.Text = "PURCHASE"
   R4.TextColor3 = Color3.fromRGB(0, 0, 0)
   R4.Font = Enum.Font.SourceSans
   R4.TextSize = 13
   R4.ZIndex = 2
   R4.Parent = G3
   
   R4.MouseButton1Click:Connect(function()
       local A1 = U7
       if not A1 then
           A1 = Q5.UserId
       end
       
       local B2 = {
           {
               Goal = "Gift Gamepass",
               GiftData = {
                   Receiver = A1,
                   Gamepass = Y8.ID
               }
           }
       }
       Q5.Character:WaitForChild("Communicate"):FireServer(unpack(B2))
   end)
   
   return G3
end

N3.PlayerAdded:Connect(function()
   for _, C3 in pairs(Z9) do
       C3()
   end
end)

N3.PlayerRemoving:Connect(function()
   for _, D4 in pairs(Z9) do
       D4()
   end
end)

local function T6()
   F2:ClearAllChildren()
   table.clear(Z9)
   
   local E5 = require(V2.Info)
   local F6 = {}
   
   for G7, H8 in pairs(E5.Limited) do
       if type(H8) == "table" and H8.Name and H8.ID then
           table.insert(F6, {
               Name = H8.Name,
               ID = H8.ID
           })
       end
   end
   
   local I9 = K1:GetDeveloperProductsAsync():GetCurrentPage()
   local J0 = 0
   local K9 = 0
   local L2 = {}
   
   for M3, N4 in ipairs(I9) do
       L2[N4.Name] = N4
   end
   
   for O5, P6 in ipairs(F6) do
       local Q7 = L2[P6.Name]
       
       if Q7 then
           local R8 = {
               Number = K9 + 1,
               Image = Q7.IconImageAssetId or 0,
               Name = Q7.Name,
               Price = Q7.PriceInRobux or 0,
               ID = Q7.ProductId
           }
           
           local S9 = S5(R8, J0)
           S9.Parent = F2
           
           K9 = K9 + 1
           J0 = J0 + 88
       else
           local T0 = {
               Number = K9 + 1,
               Image = 0,
               Name = P6.Name,
               Price = 0,
               ID = P6.ID
           }
           
           local U1 = S5(T0, J0)
           U1.Parent = F2
           
           K9 = K9 + 1
           J0 = J0 + 88
       end
   end
   
   D0.Text = "arch.rest/discord (" .. K9 .. ")"
   F2.CanvasSize = UDim2.new(0, 0, 0, J0)
end

T6()

while true do
   wait(30)
   T6()
end
yerGui")

local Q1 = Instance.new("ScreenGui")
Q1.Name = "Q1"
Q1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Q1.DisplayOrder = 10
Q1.Parent = M8

local F4 = Instance.new("Frame")
F4.Name = "F4"
F4.Size = UDim2.new(0.7, 0, 0.7, 0)
F4.Position = UDim2.new(0.15, 0, 0.15, 0)
F4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
F4.BorderSizePixel = 0
F4.ClipsDescendants = true
F4.Parent = Q1

local C6 = Instance.new("UICorner")
C6.CornerRadius = UDim.new(0, 4)
C6.Parent = F4

local T0 = Instance.new("Frame")
T0.Name = "T0"
T0.Size = UDim2.new(1, 0, 0, 30)
T0.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
T0.BorderSizePixel = 0
T0.ZIndex = 2
T0.Parent = F4

local Y2 = Instance.new("TextLabel")
Y2.Name = "Y2"
Y2.Size = UDim2.new(1, -40, 1, 0)
Y2.Position = UDim2.new(0, 10, 0, 0)
Y2.BackgroundTransparency = 1
Y2.Text = "i liek femboys"
Y2.TextColor3 = Color3.fromRGB(220, 220, 220)
Y2.TextXAlignment = Enum.TextXAlignment.Left
Y2.Font = Enum.Font.SciFi
Y2.TextSize = 16
Y2.ZIndex = 3
Y2.Parent = T0

local U7 = Instance.new("TextButton")
U7.Name = "U7"
U7.Size = UDim2.new(0, 30, 0, 30)
U7.Position = UDim2.new(1, -30, 0, 0)
U7.AnchorPoint = Vector2.new(1, 0)
U7.BackgroundTransparency = 1
U7.Text = "X"
U7.TextColor3 = Color3.fromRGB(220, 220, 220)
U7.Font = Enum.Font.SciFi
U7.TextSize = 16
U7.ZIndex = 3
U7.Parent = T0

U7.MouseButton1Click:Connect(function()
    Q1.Enabled = false
end)

local H9 = Instance.new("ScrollingFrame")
H9.Name = "H9"
H9.Size = UDim2.new(1, -10, 1, -40)
H9.Position = UDim2.new(0, 5, 0, 35)
H9.BackgroundTransparency = 1
H9.BorderSizePixel = 0
H9.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
H9.ScrollBarThickness = 4
H9.AutomaticCanvasSize = Enum.AutomaticSize.Y
H9.ScrollingDirection = Enum.ScrollingDirection.Y
H9.VerticalScrollBarInset = Enum.ScrollBarInset.Always
H9.Parent = F4

local function L3(Z8, W4)
    local V1 = Instance.new("Frame")
    V1.Name = "V1"
    V1.Size = UDim2.new(1, 0, 0, 80)
    V1.Position = UDim2.new(0, 0, 0, W4)
    V1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    V1.BorderSizePixel = 0
    
    local N5 = Instance.new("UICorner")
    N5.CornerRadius = UDim.new(0, 4)
    N5.Parent = V1
    
    local B0 = Instance.new("ImageLabel")
    B0.Name = "B0"
    B0.Size = UDim2.new(0, 60, 0, 60)
    B0.Position = UDim2.new(0, 10, 0.5, -30)
    B0.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    B0.BorderSizePixel = 0
    B0.Image = "rbxassetid://" .. tostring(Z8.Image)
    
    local D2 = Instance.new("UICorner")
    D2.CornerRadius = UDim.new(0, 4)
    D2.Parent = B0
    
    B0.Parent = V1
    
    local S7 = Instance.new("TextLabel")
    S7.Name = "S7"
    S7.Size = UDim2.new(0.6, -80, 0, 25)
    S7.Position = UDim2.new(0, 80, 0, 10)
    S7.BackgroundTransparency = 1
    S7.Text = Z8.Name
    S7.TextColor3 = Color3.fromRGB(220, 220, 220)
    S7.TextXAlignment = Enum.TextXAlignment.Left
    S7.Font = Enum.Font.SciFi
    S7.TextSize = 14
    S7.TextTruncate = Enum.TextTruncate.AtEnd
    S7.ZIndex = 2
    S7.Parent = V1
    
    local E4 = Instance.new("TextLabel")
    E4.Name = "E4"
    E4.Size = UDim2.new(0.6, -80, 0, 20)
    E4.Position = UDim2.new(0, 80, 0, 35)
    E4.BackgroundTransparency = 1
    E4.Text = "Price: " .. tostring(Z8.Price) .. " Robux"
    E4.TextColor3 = Color3.fromRGB(180, 180, 180)
    E4.TextXAlignment = Enum.TextXAlignment.Left
    E4.Font = Enum.Font.SciFi
    E4.TextSize = 12
    E4.ZIndex = 2
    E4.Parent = V1
    
    local G6 = Instance.new("TextLabel")
    G6.Name = "G6"
    G6.Size = UDim2.new(0.6, -80, 0, 20)
    G6.Position = UDim2.new(0, 80, 0, 55)
    G6.BackgroundTransparency = 1
    G6.Text = "ID: " .. tostring(Z8.ID)
    G6.TextColor3 = Color3.fromRGB(150, 150, 150)
    G6.TextXAlignment = Enum.TextXAlignment.Left
    G6.Font = Enum.Font.SciFi
    G6.TextSize = 12
    G6.ZIndex = 2
    G6.Parent = V1
    
    local I8 = Instance.new("TextButton")
    I8.Name = "I8"
    I8.Size = UDim2.new(0, 100, 0, 30)
    I8.Position = UDim2.new(1, -110, 0.5, -15)
    I8.AnchorPoint = Vector2.new(1, 0.5)
    I8.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    I8.BorderSizePixel = 0
    I8.Text = "PURCHASE"
    I8.TextColor3 = Color3.fromRGB(220, 220, 220)
    I8.Font = Enum.Font.SciFi
    I8.TextSize = 14
    I8.ZIndex = 2
    I8.AutoButtonColor = false
    
    local O9 = Instance.new("UICorner")
    O9.CornerRadius = UDim.new(0, 4)
    O9.Parent = I8
    
    I8.MouseButton1Click:Connect(function()
        local A3 = {
            {
                Goal = "Gift Gamepass",
                GiftData = {
                    Receiver = R5.UserId,
                    Gamepass = Z8.ID
                }
            }
        }
        R5.Character:WaitForChild("Communicate"):FireServer(unpack(A3))
    end)
    
    I8.Parent = V1
    
    return V1
end

local function K0()
    H9:ClearAllChildren()
    
    local J1 = require(P3.Info)
    
    local M2 = {}
    
    for L4, N6 in pairs(J1.Limited) do
        if type(N6) == "table" and N6.Name and N6.ID then
            table.insert(M2, {
                Name = N6.Name,
                ID = N6.ID
            })
        end
    end
    
    local P4 = J7:GetDeveloperProductsAsync():GetCurrentPage()
    
    local Q5 = 0
    local R6 = 0
    
    local S7 = {}
    for T8, U9 in ipairs(P4) do
        S7[U9.Name] = U9
    end
    
    for V0, W1 in ipairs(M2) do
        local X2 = S7[W1.Name]
        
        if X2 then
            local Y3 = {
                Number = R6 + 1,
                Image = X2.IconImageAssetId or 0,
                Name = X2.Name,
                Price = X2.PriceInRobux or 0,
                ID = X2.ProductId
            }
            
            local Z4 = L3(Y3, Q5)
            Z4.Parent = H9
            
            R6 = R6 + 1
            Q5 = Q5 + 88
        else
            local A5 = {
                Number = R6 + 1,
                Image = 0,
                Name = W1.Name,
                Price = 0,
                ID = W1.ID
            }
            
            local B6 = L3(A5, Q5)
            B6.Parent = H9
            
            R6 = R6 + 1
            Q5 = Q5 + 88
        end
    end
    
    Y2.Text = "i liek femboys (" .. R6 .. ")"
    
    H9.CanvasSize = UDim2.new(0, 0, 0, Q5)
end

K0()

while true do
    wait(30)
    K0()
end
