local MessageBoxT = {
    BoxIcons = {
        ["Question"] = "http://www.roblox.com/asset/?id=8800441559",
        ["Error"] = "http://www.roblox.com/asset/?id=8800303348",
        ["Warning"] = "http://www.roblox.com/asset/?id=8800428538",
        ["Info"] = "http://www.roblox.com/asset/?id=8800441559",
        ["Success"] = "http://www.roblox.com/asset/?id=8800428538"
    },
    
    CustomColors = {
        Background = Color3.fromRGB(45, 45, 45),
        Header = Color3.fromRGB(35, 35, 35),
        Text = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(65, 65, 65),
        ButtonHover = Color3.fromRGB(85, 85, 85),
        CloseButton = Color3.fromRGB(220, 60, 60),
        CloseButtonHover = Color3.fromRGB(255, 80, 80)
    }
}

local ID = 8801438982

local CurrentCamera;
local plrs = game:GetService("Players")
local plr = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local inpService = game:GetService("UserInputService")
local Mouse = plr:GetMouse()

while (not CurrentCamera) do
	CurrentCamera = workspace.CurrentCamera
	wait()
end

local minimized = false

local function ToBounds(X,Y, MW)
	if (X - MW.Size.X.Offset / 2 < 0) then
		X = MW.Size.X.Offset / 2
	end

	if ((MW.AbsoluteSize.Y - Y) - MW.Size.Y.Offset / 2 >= MW.AbsoluteSize.Y) then
		Y = MW.Size.Y.Offset / 2
	end

	if ((X + MW.AbsoluteSize.X) >= (CurrentCamera.ViewportSize.X) + MW.Size.X.Offset / 2) then
		X = CurrentCamera.ViewportSize.X - MW.AbsoluteSize.X + MW.Size.X.Offset / 2
	end

	if (((Y + MW.AbsoluteSize.Y) + 35) >= (CurrentCamera.ViewportSize.Y) + MW.Size.Y.Offset / 2) then
		Y = (CurrentCamera.ViewportSize.Y - MW.AbsoluteSize.Y) - 35 + MW.Size.Y.Offset / 2
	end

	return UDim2.new(0, X, 0, Y)
end

local function Tween(object, time, properties)
    local info = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    TweenService:Create(object, info, properties):Play()
end

local function ApplyDrag(Component, MainWindow)
	local MouseDown = false
	local MB1 = Enum.UserInputType.MouseButton1
	local MM = Enum.UserInputType.MouseMovement

	local Position = Vector2.new()

	local InputBegan = Component.InputBegan:Connect(function(input)
		if (input.UserInputType == MB1) then
            Component.BackgroundTransparency = 0.7
            Component["Box-Title"].TextColor3 = MessageBoxT.CustomColors.Text
            Component["Close"]["btn"].TextColor3 = MessageBoxT.CustomColors.Text
			MouseDown = true
			Position = Vector2.new(input.Position.X-MainWindow.AbsolutePosition.X-MainWindow.Size.X.Offset / 2, input.Position.Y-MainWindow.AbsolutePosition.Y-MainWindow.Size.Y.Offset / 2)
		end
	end)

	local InputEnded = Component.InputEnded:Connect(function(input)
		if (input.UserInputType == MB1) then
			MouseDown = false
            Component.BackgroundTransparency = 1
            Component["Box-Title"].TextColor3 = MessageBoxT.CustomColors.Text
            Component["Close"]["btn"].TextColor3 = MessageBoxT.CustomColors.Text
		end
	end)

	local InputChanged;

	InputChanged = game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (MouseDown and input.UserInputType == MM) then
            Tween(MainWindow, 0.1, {Position = ToBounds((Mouse.X-Position.X), (Mouse.Y-Position.Y), MainWindow)})
		end
	end)
end

function MessageBoxT.Show(option)
    option = typeof(option) == "table" and option or {}
    local MessageDescription = tostring(option.Description) and option.Description or "This is an Notification"
    local Options = tostring(option.MessageBoxButtons) and option.MessageBoxButtons or "OK"
    local MessageIcon = tostring(option.MessageBoxIcon) and option.MessageBoxIcon or "Warning"
    local ResultCallback = typeof(option.Result) == "function" and option.Result or function() end
    local MessageTitle = tostring(option.Text) and option.Text or ""
    local CustomPos = option.Position or UDim2.new(0.5,0,0.5,0)
    local CustomColors = option.CustomColors or MessageBoxT.CustomColors
    local ButtonTexts = option.ButtonTexts or {}
    local AutoClose = option.AutoClose or false
    local CloseTime = option.CloseTime or 5

    local GUI

    local Addup = 0

    if (game.CoreGui:FindFirstChild("Notifications")) then 
	    GUI = game.CoreGui:FindFirstChild("Notifications")
    else 
        GUI = Instance.new("ScreenGui", game.CoreGui)
        GUI.Name = "Notifications"
    end

    local MessageBox = game:GetObjects("rbxassetid://"..ID)[1]
    MessageBox["UIScale"].Scale = 1
    MessageBox:Clone()
    MessageBox.Parent = GUI
    MessageBox.Position = CustomPos
    MessageBox.Position = UDim2.new(0, MessageBox.AbsolutePosition.X, 0, MessageBox.AbsolutePosition.Y)

    MessageBox.BackgroundColor3 = CustomColors.Background
    MessageBox["Message-Header"].BackgroundColor3 = CustomColors.Header
    MessageBox["Message-Header"]["Box-Title"].TextColor3 = CustomColors.Text
    MessageBox["MessageDescription"].TextColor3 = CustomColors.Text

    MessageBox["Message-Header"]["Box-Title"].Text = MessageTitle
    MessageBox["MessageDescription"].Text = MessageDescription
    MessageBox["Message-Icons"]["Error"].Image = MessageBoxT.BoxIcons["Error"]
    MessageBox["Message-Icons"]["Warning"].Image = MessageBoxT.BoxIcons["Warning"]
    MessageBox["Message-Icons"]["Question"].Image = MessageBoxT.BoxIcons["Question"]
    MessageBox["Message-Icons"]["Info"].Image = MessageBoxT.BoxIcons["Info"]
    MessageBox["Message-Icons"]["Success"].Image = MessageBoxT.BoxIcons["Success"]

    ApplyDrag(MessageBox["Message-Header"], MessageBox)

    local Icon = MessageBox["Message-Icons"]:FindFirstChild(MessageIcon)
    if Icon then
        Icon.Parent = MessageBox
        Icon.Visible = true
    end
    
    local Buttons = nil
    
    if Options ~= "None" then
        Buttons = MessageBox["MessageBoxButtons"][Options]:Clone()
        Buttons.Visible = true
        Buttons.Parent = MessageBox
        Addup = 36
        
        for i,v in pairs(Buttons:GetChildren()) do
            if v:IsA("TextButton") then
                if ButtonTexts[v.Name] then
                    v.Text = ButtonTexts[v.Name]
                end
                
                v.BackgroundColor3 = CustomColors.Button
                v.TextColor3 = CustomColors.Text
                
                v.MouseEnter:Connect(function()
                    Tween(v, 0.2, {BackgroundColor3 = CustomColors.ButtonHover})
                end)
                
                v.MouseLeave:Connect(function()
                    Tween(v, 0.2, {BackgroundColor3 = CustomColors.Button})
                end)
                
                v.MouseButton1Click:Connect(function()
                    ResultCallback(v.Text)
                    game.TweenService:Create(MessageBox["UIScale"], TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Scale = 0
                    }):Play()
                    wait(0.1)
                    MessageBox:Destroy()
                end)
            end
        end
    end

    local CloseBtn = MessageBox["Message-Header"]["Close"]["btn"]
    CloseBtn.BackgroundColor3 = CustomColors.CloseButton
    CloseBtn.TextColor3 = CustomColors.Text
    
    CloseBtn.MouseEnter:Connect(function()
        Tween(CloseBtn, 0.2, {BackgroundColor3 = CustomColors.CloseButtonHover})
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        Tween(CloseBtn, 0.2, {BackgroundColor3 = CustomColors.CloseButton})
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        ResultCallback("Close")
        game.TweenService:Create(MessageBox["UIScale"], TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Scale = 0
        }):Play()
        wait(0.1)
        MessageBox:Destroy()
    end)

    if MessageBox["MessageDescription"].TextBounds.Y >= 16 then
        MessageBox["MessageDescription"].Position = UDim2.new(0, 48,0, 42)
        Addup -= 14
    end

    MessageBox.Size = UDim2.new(0, math.max(MessageBox["MessageDescription"].TextBounds.X + 100, 300),0, MessageBox["MessageDescription"].TextBounds.Y + 70 + Addup)
    
    MessageBox["UIScale"].Scale = 0

    game.TweenService:Create(MessageBox["UIScale"], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Scale = 1
    }):Play()

    if AutoClose then
        spawn(function()
            wait(CloseTime)
            if MessageBox and MessageBox.Parent then
                ResultCallback("Timeout")
                game.TweenService:Create(MessageBox["UIScale"], TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Scale = 0
                }):Play()
                wait(0.1)
                MessageBox:Destroy()
            end
        end)
    end
end

function MessageBoxT.ShowCustom(option)
    option = option or {}
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.CoreGui
    screenGui.Name = "CustomNotification_" .. tick()
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 200)
    mainFrame.Position = option.Position or UDim2.new(0.5, -200, 0.5, -100)
    mainFrame.BackgroundColor3 = option.BackgroundColor or Color3.fromRGB(45, 45, 45)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 100, 100)
    stroke.Thickness = 2
    stroke.Parent = mainFrame
    
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 30)
    header.BackgroundColor3 = option.HeaderColor or Color3.fromRGB(35, 35, 35)
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 8)
    headerCorner.Parent = header
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -40, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = option.Text or "Notification"
    title.TextColor3 = option.TextColor or Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundColor3 = option.CloseColor or Color3.fromRGB(220, 60, 60)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 14
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = header
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    local content = Instance.new("TextLabel")
    content.Size = UDim2.new(1, -20, 1, -80)
    content.Position = UDim2.new(0, 10, 0, 40)
    content.BackgroundTransparency = 1
    content.Text = option.Description or "Description"
    content.TextColor3 = option.TextColor or Color3.fromRGB(255, 255, 255)
    content.TextSize = 12
    content.Font = Enum.Font.Gotham
    content.TextWrapped = true
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top
    content.Parent = mainFrame
    
    local buttonsFrame = Instance.new("Frame")
    buttonsFrame.Size = UDim2.new(1, -20, 0, 30)
    buttonsFrame.Position = UDim2.new(0, 10, 1, -40)
    buttonsFrame.BackgroundTransparency = 1
    buttonsFrame.Parent = mainFrame
    
    local buttonOptions = option.Buttons or {"OK"}
    local buttonWidth = (buttonsFrame.AbsoluteSize.X - (#buttonOptions - 1) * 10) / #buttonOptions

    for i, btnText in ipairs(buttonOptions) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, buttonWidth, 1, 0)
        button.Position = UDim2.new(0, (i-1) * (buttonWidth + 10), 0, 0)
        button.BackgroundColor3 = option.ButtonColor or Color3.fromRGB(65, 65, 65)
        button.Text = btnText
        button.TextColor3 = option.TextColor or Color3.fromRGB(255, 255, 255)
        button.TextSize = 12
        button.Font = Enum.Font.Gotham
        button.Parent = buttonsFrame
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = button
        
        button.MouseEnter:Connect(function()
            Tween(button, 0.2, {BackgroundColor3 = option.ButtonHoverColor or Color3.fromRGB(85, 85, 85)})
        end)
        
        button.MouseLeave:Connect(function()
            Tween(button, 0.2, {BackgroundColor3 = option.ButtonColor or Color3.fromRGB(65, 65, 65)})
        end)
        
        button.MouseButton1Click:Connect(function()
            if option.Result then
                option.Result(btnText)
            end
            screenGui:Destroy()
        end)
    end
    
    closeBtn.MouseButton1Click:Connect(function()
        if option.Result then
            option.Result("Close")
        end
        screenGui:Destroy()
    end)
    
    ApplyDrag(header, mainFrame)
    
    return screenGui
end

return MessageBoxT
