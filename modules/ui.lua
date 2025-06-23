return function(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	local Players = game:GetService("Players")
	local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

	-- ScreenGui chính
	local ScreenGui = Instance.new("ScreenGui", PlayerGui)
	ScreenGui.Name = "StackFlowUI"

	-- Main Frame
	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 500, 0, 350)
	MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

	-- Tabs Holder
	local TabsHolder = Instance.new("Frame", MainFrame)
	TabsHolder.Size = UDim2.new(0, 120, 1, 0)
	TabsHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TabsHolder.Position = UDim2.new(0, 0, 0, 0)
	Instance.new("UICorner", TabsHolder).CornerRadius = UDim.new(0, 8)

	local TabsLayout = Instance.new("UIListLayout", TabsHolder)
	TabsLayout.Padding = UDim.new(0, 5)
	TabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	-- Nút bật/tắt UI
	local ToggleButton = Instance.new("TextButton", ScreenGui)
	ToggleButton.Size = UDim2.new(0, 40, 0, 40)
	ToggleButton.Position = UDim2.new(1, -50, 0, 20)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ToggleButton.Text = "🌚"
	ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.Font = Enum.Font.GothamBold
	ToggleButton.TextSize = 16
	Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 8)

	local open = true
	ToggleButton.MouseButton1Click:Connect(function()
		open = not open
		MainFrame.Visible = open
	end)

	-----------------------------------------------------------------
	-- TAB FARM + TOGGLE
	local FarmTab, FarmButton = Tabs.Create(TabsHolder, "Farm Level")

	local AutoFarmToggle = false
	local ToggleFarmButton = Buttons.Create(FarmTab, "Auto Farm: OFF", function(btn)
		AutoFarmToggle = not AutoFarmToggle
		btn.Text = "Auto Farm: " .. (AutoFarmToggle and "ON" or "OFF")
	end)

	-- Bắt đầu AutoFarm khi bật toggle
	task.spawn(function()
		while task.wait(0.5) do
			if AutoFarmToggle then
				pcall(function()
					AutoFarm(EnemyList)
				end)
			end
		end
	end)

	-----------------------------------------------------------------
	-- TAB SETTINGS (CÓ THỂ THÊM)
	local SettingTab = Tabs.Create(TabsHolder, "Settings")
	Buttons.Create(SettingTab, "Auto Stats: Melee", function()
		pcall(function()
			AutoStats()
		end)
	end)

	-- Mặc định hiển thị Farm Tab
	FarmTab.Visible = true
end
