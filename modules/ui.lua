return function(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	local Player = game:GetService("Players").LocalPlayer
	local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	ScreenGui.Name = "StackFlowUI"

	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 400, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	MainFrame.Active = true
	MainFrame.Draggable = true
	Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

	local TabContainer = Instance.new("Frame", MainFrame)
	TabContainer.Size = UDim2.new(1, 0, 0, 30)
	TabContainer.BackgroundTransparency = 1
	Instance.new("UIListLayout", TabContainer).FillDirection = Enum.FillDirection.Horizontal

	-- Toggle Bật/Tắt UI
	local ToggleButton = Instance.new("TextButton", ScreenGui)
	ToggleButton.Size = UDim2.new(0, 120, 0, 30)
	ToggleButton.Position = UDim2.new(0, 10, 0, 10)
	ToggleButton.Text = "Hiện UI"
	ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.Font = Enum.Font.Gotham
	ToggleButton.TextSize = 14
	Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 6)

	local visible = true
	ToggleButton.MouseButton1Click:Connect(function()
		visible = not visible
		MainFrame.Visible = visible
		ToggleButton.Text = visible and "Ẩn UI" or "Hiện UI"
	end)

	-- ✅ Tạo Tab Farm
	local FarmTab = Tabs.Create(TabContainer, "Farm")

	-- Thêm Toggle Auto Farm
	local autoFarmEnabled = false
	Buttons.Create(FarmTab, "Auto Farm: OFF", function(btn)
		autoFarmEnabled = not autoFarmEnabled
		btn.Text = autoFarmEnabled and "Auto Farm: ON" or "Auto Farm: OFF"
		if autoFarmEnabled then
			task.spawn(function()
				AutoFarm(EnemyList)
			end)
		end
	end)

	-- Thêm Auto Stats nếu muốn
	Buttons.Create(FarmTab, "Auto Stats: Melee", function()
		task.spawn(function()
			AutoStats()
		end)
	end)
end
