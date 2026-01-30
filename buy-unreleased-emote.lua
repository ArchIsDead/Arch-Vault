-- arch.rest/discord ONTOP!

local X9 = game:GetService("MarketplaceService")
local P3 = game:GetService("ReplicatedStorage")
local K2 = game:GetService("Players")
local R1 = game:GetService("UserInputService")

local R5 = K2.LocalPlayer
local M8 = R5:WaitForChild("PlayerGui")

local Q1 = Instance.new("ScreenGui")
local F4 = Instance.new("Frame")
local T0 = Instance.new("Frame")
local Y2 = Instance.new("TextLabel")
local U7 = Instance.new("TextButton")
local H9 = Instance.new("ScrollingFrame")
local J1 = Instance.new("UIListLayout")
local W4 = {}

Q1.Parent = M8
Q1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Q1.DisplayOrder = 10

F4.Parent = Q1
F4.Size = UDim2.new(0.7, 0, 0.7, 0)
F4.Position = UDim2.new(0.15, 0, 0.15, 0)
F4.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
F4.BorderSizePixel = 2
F4.BorderColor3 = Color3.fromRGB(0, 0, 0)
F4.ClipsDescendants = true

T0.Parent = F4
T0.Size = UDim2.new(1, 0, 0, 25)
T0.BackgroundColor3 = Color3.fromRGB(0, 0, 128)
T0.BorderSizePixel = 0
T0.ZIndex = 2

Y2.Parent = T0
Y2.Size = UDim2.new(1, -30, 1, 0)
Y2.Position = UDim2.new(0, 5, 0, 0)
Y2.BackgroundTransparency = 1
Y2.Text = "R4 Was Here"
Y2.TextColor3 = Color3.fromRGB(255, 255, 255)
Y2.TextXAlignment = Enum.TextXAlignment.Left
Y2.Font = Enum.Font.SourceSans
Y2.TextSize = 14
Y2.ZIndex = 3

U7.Parent = T0
U7.Size = UDim2.new(0, 20, 0, 20)
U7.Position = UDim2.new(1, -22, 0, 2)
U7.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
U7.BorderSizePixel = 1
U7.BorderColor3 = Color3.fromRGB(0, 0, 0)
U7.Text = "X"
U7.TextColor3 = Color3.fromRGB(0, 0, 0)
U7.Font = Enum.Font.SourceSans
U7.TextSize = 14
U7.ZIndex = 3

H9.Parent = F4
H9.Size = UDim2.new(1, -10, 1, -35)
H9.Position = UDim2.new(0, 5, 0, 30)
H9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
H9.BorderSizePixel = 1
H9.BorderColor3 = Color3.fromRGB(0, 0, 0)
H9.ScrollBarImageColor3 = Color3.fromRGB(192, 192, 192)
H9.ScrollBarThickness = 12
H9.AutomaticCanvasSize = Enum.AutomaticSize.Y
H9.ScrollingDirection = Enum.ScrollingDirection.Y
H9.VerticalScrollBarInset = Enum.ScrollBarInset.Always

J1.Parent = H9
J1.Padding = UDim.new(0, 4)

U7.MouseButton1Click:Connect(function()
    Q1.Enabled = false
end)

local function L3(Z8, N6)
    local V1 = Instance.new("Frame")
    local B0 = Instance.new("ImageLabel")
    local S7 = Instance.new("TextLabel")
    local E4 = Instance.new("TextLabel")
    local G6 = Instance.new("TextLabel")
    local I8 = Instance.new("Frame")
    local O9 = Instance.new("TextButton")
    local A3 = Instance.new("TextButton")
    local C2 = Instance.new("Frame")
    local D5 = Instance.new("ScrollingFrame")
    local F7 = Instance.new("UIListLayout")
    local H3 = Instance.new("TextButton")
    
    V1.Size = UDim2.new(1, -4, 0, 80)
    V1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    V1.BorderSizePixel = 1
    V1.BorderColor3 = Color3.fromRGB(192, 192, 192)
    V1.ZIndex = 1
    V1.Parent = H9
    
    B0.Size = UDim2.new(0, 60, 0, 60)
    B0.Position = UDim2.new(0, 8, 0.5, -30)
    B0.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
    B0.BorderSizePixel = 1
    B0.BorderColor3 = Color3.fromRGB(0, 0, 0)
    B0.Image = "rbxassetid://" .. tostring(Z8.Image)
    B0.Parent = V1
    
    S7.Size = UDim2.new(0.35, -80, 0, 20)
    S7.Position = UDim2.new(0, 76, 0, 8)
    S7.BackgroundTransparency = 1
    S7.Text = Z8.Name
    S7.TextColor3 = Color3.fromRGB(0, 0, 0)
    S7.TextXAlignment = Enum.TextXAlignment.Left
    S7.Font = Enum.Font.SourceSans
    S7.TextSize = 14
    S7.TextTruncate = Enum.TextTruncate.AtEnd
    S7.Parent = V1
    
    E4.Size = UDim2.new(0.35, -80, 0, 18)
    E4.Position = UDim2.new(0, 76, 0, 28)
    E4.BackgroundTransparency = 1
    E4.Text = "Price: " .. tostring(Z8.Price) .. " Robux"
    E4.TextColor3 = Color3.fromRGB(0, 0, 0)
    E4.TextXAlignment = Enum.TextXAlignment.Left
    E4.Font = Enum.Font.SourceSans
    E4.TextSize = 12
    E4.Parent = V1
    
    G6.Size = UDim2.new(0.35, -80, 0, 18)
    G6.Position = UDim2.new(0, 76, 0, 46)
    G6.BackgroundTransparency = 1
    G6.Text = "ID: " .. tostring(Z8.ID)
    G6.TextColor3 = Color3.fromRGB(128, 128, 128)
    G6.TextXAlignment = Enum.TextXAlignment.Left
    G6.Font = Enum.Font.SourceSans
    G6.TextSize = 12
    G6.Parent = V1
    
    I8.Size = UDim2.new(0, 130, 0, 24)
    I8.Position = UDim2.new(1, -240, 0.5, -12)
    I8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    I8.BorderSizePixel = 1
    I8.BorderColor3 = Color3.fromRGB(0, 0, 0)
    I8.ZIndex = 100
    I8.Parent = V1
    
    O9.Size = UDim2.new(1, -20, 1, 0)
    O9.BackgroundTransparency = 1
    O9.Text = R5.Name
    O9.Font = Enum.Font.SourceSans
    O9.TextSize = 13
    O9.TextColor3 = Color3.fromRGB(0, 0, 0)
    O9.TextXAlignment = Enum.TextXAlignment.Left
    O9.Parent = I8
    
    A3.Size = UDim2.new(0, 20, 1, 0)
    A3.Position = UDim2.new(1, -20, 0, 0)
    A3.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
    A3.BorderSizePixel = 1
    A3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    A3.Text = "v"
    A3.Font = Enum.Font.SourceSans
    A3.TextSize = 10
    A3.TextColor3 = Color3.fromRGB(0, 0, 0)
    A3.Parent = I8
    
    C2.Size = UDim2.new(1, 0, 0, 120)
    C2.Position = UDim2.new(0, 0, 1, 0)
    C2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    C2.BorderSizePixel = 1
    C2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    C2.Visible = false
    C2.ZIndex = 1000
    C2.Parent = I8
    
    D5.Size = UDim2.new(1, 0, 1, 0)
    D5.BackgroundTransparency = 1
    D5.BorderSizePixel = 0
    D5.ScrollBarThickness = 8
    D5.ScrollBarImageColor3 = Color3.fromRGB(192, 192, 192)
    D5.CanvasSize = UDim2.new(0, 0, 0, 0)
    D5.ZIndex = 1000
    D5.Parent = C2
    
    F7.Parent = D5
    
    local M2 = R5.UserId
    
    local function K0()
        for _, P4 in pairs(D5:GetChildren()) do
            if P4:IsA("TextButton") then
                P4:Destroy()
            end
        end
        
        local Q3 = 0
        
        local selfBtn = Instance.new("TextButton")
        selfBtn.Size = UDim2.new(1, 0, 0, 22)
        selfBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
        selfBtn.BorderSizePixel = 0
        selfBtn.Text = R5.Name .. " (You)"
        selfBtn.Font = Enum.Font.SourceSans
        selfBtn.TextSize = 13
        selfBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        selfBtn.ZIndex = 1000
        selfBtn.Parent = D5
        
        selfBtn.MouseButton1Click:Connect(function()
            O9.Text = R5.Name
            M2 = R5.UserId
            C2.Visible = false
        end)
        
        Q3 = Q3 + 22
        
        for _, R6 in pairs(K2:GetPlayers()) do
            if R6 ~= R5 then
                local S9 = Instance.new("TextButton")
                S9.Size = UDim2.new(1, 0, 0, 22)
                S9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                S9.BorderSizePixel = 0
                S9.Text = R6.Name
                S9.Font = Enum.Font.SourceSans
                S9.TextSize = 13
                S9.TextColor3 = Color3.fromRGB(0, 0, 0)
                S9.ZIndex = 1000
                S9.Parent = D5
                
                S9.MouseButton1Click:Connect(function()
                    O9.Text = R6.Name
                    M2 = R6.UserId
                    C2.Visible = false
                end)
                
                Q3 = Q3 + 22
            end
        end
        
        D5.CanvasSize = UDim2.new(0, 0, 0, Q3)
    end
    
    local function T1()
        if C2.Visible then
            C2.Visible = false
        else
            K0()
            C2.Visible = true
        end
    end
    
    O9.MouseButton1Click:Connect(T1)
    A3.MouseButton1Click:Connect(T1)
    
    table.insert(W4, K0)
    
    H3.Size = UDim2.new(0, 100, 0, 26)
    H3.Position = UDim2.new(1, -105, 0.5, -13)
    H3.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
    H3.BorderSizePixel = 1
    H3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    H3.Text = "PURCHASE"
    H3.TextColor3 = Color3.fromRGB(0, 0, 0)
    H3.Font = Enum.Font.SourceSans
    H3.TextSize = 13
    H3.ZIndex = 2
    H3.Parent = V1
    
    H3.MouseButton1Click:Connect(function()
        local U6 = M2
        if not U6 then
            U6 = R5.UserId
        end
        
        local V9 = {
            {
                Goal = "Gift Gamepass",
                GiftData = {
                    Receiver = U6,
                    Gamepass = Z8.ID
                }
            }
        }
        R5.Character:WaitForChild("Communicate"):FireServer(unpack(V9))
    end)
    
    return V1
end

K2.PlayerAdded:Connect(function()
    for _, W6 in pairs(W4) do
        W6()
    end
end)

K2.PlayerRemoving:Connect(function()
    for _, X7 in pairs(W4) do
        X7()
    end
end)

local function Y8()
    for _, C1 in pairs(H9:GetChildren()) do
        if C1:IsA("Frame") then
            C1:Destroy()
        end
    end
    
    table.clear(W4)
    
    local Z4 = require(P3.Info)
    local A5 = {}
    
    for B6, C7 in pairs(Z4.Limited) do
        if type(C7) == "table" and C7.Name and C7.ID then
            table.insert(A5, {
                Name = C7.Name,
                ID = C7.ID
            })
        end
    end
    
    local D8 = X9:GetDeveloperProductsAsync():GetCurrentPage()
    local E9 = 0
    local F0 = 0
    local G1 = {}
    
    for H2, I3 in ipairs(D8) do
        G1[I3.Name] = I3
    end
    
    for J4, K5 in ipairs(A5) do
        local L6 = G1[K5.Name]
        
        if L6 then
            local M7 = {
                Number = F0 + 1,
                Image = L6.IconImageAssetId or 0,
                Name = L6.Name,
                Price = L6.PriceInRobux or 0,
                ID = L6.ProductId
            }
            
            local N8 = L3(M7, 0)
            
            F0 = F0 + 1
            E9 = E9 + 88
        else
            local O9 = {
                Number = F0 + 1,
                Image = 0,
                Name = K5.Name,
                Price = 0,
                ID = K5.ID
            }
            
            local P0 = L3(O9, 0)
            
            F0 = F0 + 1
            E9 = E9 + 88
        end
    end
    
    Y2.Text = "arch.rest (" .. F0 .. ")"
    H9.CanvasSize = UDim2.new(0, 0, 0, E9)
end

Y8()

while true do
    wait(30)
    Y8()
end
