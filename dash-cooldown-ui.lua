-- this script was a test of remake yqantag dash cooldown

local plr = game:GetService("Players")

local function cre(p)
	local gui = Instance.new("ScreenGui")
	gui.Name = "SKID-LV-100"
	gui.Parent = p:WaitForChild("PlayerGui")
	gui.ResetOnSpawn = false

	local frm = Instance.new("Frame")
	frm.Size = UDim2.new(0, 120, 0, 30)
	frm.Position = UDim2.new(0.5, 0, 0.5, 0)
	frm.AnchorPoint = Vector2.new(0.5, 0.5)
	frm.BackgroundColor3 = Color3.new(1, 1, 1)
	frm.BorderSizePixel = 0
	frm.Visible = false
	frm.Parent = gui

	local cor = Instance.new("UICorner")
	cor.CornerRadius = UDim.new(0, 12)
	cor.Parent = frm

	local txt = Instance.new("TextLabel")
	txt.Size = UDim2.new(1, 0, 1, 0)
	txt.BackgroundTransparency = 1
	txt.Text = "Cooldown: 4.9s"
	txt.TextColor3 = Color3.new(0, 0, 0)
	txt.TextScaled = true
	txt.Font = Enum.Font.GothamBold
	txt.Parent = frm

	return frm, txt
end

local function sho(frm, txt)
	-- start btw
	frm.Visible = true
	
	local tim = 4.9
	local sta = tick()
	
	spawn(function()
		while true do
			local ela = tick() - sta
			if ela >= tim then break end
			
			local rem = tim - ela
			txt.Text = string.format("Cooldown: %.1fs", rem)
			
			local pro = ela / tim
			frm.BackgroundColor3 = Color3.new(1 - pro, 1 - pro, 1 - pro)
			txt.TextColor3 = Color3.new(pro, pro, pro)
			
			wait(0.05)
		end
		
		frm.Visible = false
		frm.BackgroundColor3 = Color3.new(1, 1, 1)
		txt.TextColor3 = Color3.new(0, 0, 0)
		txt.Text = "Cooldown: 4.9s"
		-- end btw
	end)
end

local function mon(p)
	local frm, txt = cre(p)
	local lst = 0
	
	local ids = {
		"10479335397", "15955393872", "16310343179",
		"15943915877", "16023456135", "15944317351",
		"15997042291", "16311141574", "18181589384",
		"131492147325921", "13380255751"
	}
	
	while true do
		wait(0.1)
		
		if not p.Character then continue end
		
		local hum = p.Character:FindFirstChild("Humanoid")
		if not hum then continue end
		
		for _, trk in pairs(hum:GetPlayingAnimationTracks()) do
			local aid = tostring(trk.Animation.AnimationId)
			
			for _, tid in ipairs(ids) do
				if aid:find(tid) and tick() - lst >= 5 then
					lst = tick()
					sho(frm, txt)
					break
				end
			end
		end
	end
end

plr.PlayerAdded:Connect(mon)
for _, p in ipairs(plr:GetPlayers()) do
	spawn(function() mon(p) end)
end
