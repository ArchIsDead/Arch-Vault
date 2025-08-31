-- yes very skibidi and mango 

local J7 = game:GetService("MarketplaceService")
local P3 = game:GetService("ReplicatedStorage")
local X9 = game:GetService("Players")
local K2 = game:GetService("UserInputService")

local R5 = X9.LocalPlayer
local M8 = R5:WaitForChild("PlayerGui")

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
