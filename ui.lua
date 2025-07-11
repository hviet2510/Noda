return function(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	local player = game.Players.LocalPlayer
	local PlayerGui = player:WaitForChild("PlayerGui")

	-- Giao diện chính
	local ScreenGui = Instance.new("ScreenGui", PlayerGui)
	ScreenGui.Name = "StackFlowUI"

	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 400, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

	-- Nút bật tắt UI
	local ToggleButton = Instance.new("TextButton", ScreenGui)
	ToggleButton.Size = UDim2.new(0, 80, 0, 30)
	ToggleButton.Position = UDim2.new(0, 10, 0, 10)
	ToggleButton.Text = "Toggle UI"
	ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	ToggleButton.TextColor3 = Color3.new(1,1,1)
	ToggleButton.MouseButton1Click:Connect(function()
		MainFrame.Visible = not MainFrame.Visible
	end)

	-- Tabs Holder
	local TabsHolder = Instance.new("Frame", MainFrame)
	TabsHolder.Size = UDim2.new(1, 0, 0, 40)
	TabsHolder.BackgroundTransparency = 1

	-- Tạo Tab "Farm Level"
	local FarmTab = Tabs.Create(MainFrame, "Farm Level")

	-- Thêm Button Bật/Tắt AutoFarm vào tab Farm Level
	Buttons.Create(FarmTab, "Bật/Tắt Auto Farm", function()
		Config.AutoFarm = not Config.AutoFarm
		print("AutoFarm:", Config.AutoFarm)
	end)

	-- Thêm các Tab khác nếu cần → Tabs.Create(MainFrame, "Tên Tab")

	-- Tự động chạy AutoStats nếu cần
	task.spawn(function()
		AutoStats()
	end)

	-- Tự động chạy AutoFarm nếu cần
	task.spawn(function()
		AutoFarm(EnemyList, Config)
	end)
end
