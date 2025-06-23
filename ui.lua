return function(AutoFarmFunc, AutoStatsFunc, EnemyList)
	local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local ScreenGui = Instance.new("ScreenGui", PlayerGui)
	ScreenGui.Name = "BloxFruitsUI"

	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 400, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

	local Title = Instance.new("TextLabel", MainFrame)
	Title.Size = UDim2.new(1, 0, 0, 35)
	Title.Text = "⚙️ Auto Farm Blox Fruits"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 16
	Title.BackgroundTransparency = 1

	local function CreateToggle(text, posY, callback)
		local btn = Instance.new("TextButton", MainFrame)
		btn.Size = UDim2.new(1, -20, 0, 35)
		btn.Position = UDim2.new(0, 10, 0, posY)
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 14
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

		local state = false
		btn.Text = text .. ": OFF"

		btn.MouseButton1Click:Connect(function()
			state = not state
			btn.Text = text .. ": " .. (state and "ON" or "OFF")
			callback(state)
		end)
	end

	local ToggleFarm, ToggleStats = false, false
	CreateToggle("Auto Farm", 50, function(v)
		if v and not ToggleFarm then
			ToggleFarm = true
			task.spawn(function() AutoFarmFunc(EnemyList) end)
		end
	end)

	CreateToggle("Auto Stats (Melee)", 100, function(v)
		if v and not ToggleStats then
			ToggleStats = true
			task.spawn(function() AutoStatsFunc() end)
		end
	end)

	local ToggleBtn = Instance.new("TextButton", ScreenGui)
	ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
	ToggleBtn.Position = UDim2.new(1, -50, 0, 20)
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ToggleBtn.Text = "🐕"
	ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleBtn.Font = Enum.Font.GothamBold
	ToggleBtn.TextSize = 20
	Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)
	ToggleBtn.MouseButton1Click:Connect(function()
		MainFrame.Visible = not MainFrame.Visible
	end)
end
