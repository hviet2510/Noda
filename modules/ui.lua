return function(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	local TweenService = game:GetService("TweenService")
	local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	local ScreenGui = Instance.new("ScreenGui", PlayerGui)
	ScreenGui.Name = "StackFlowUI"

	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 500, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	local UICorner = Instance.new("UICorner", MainFrame)
	UICorner.CornerRadius = UDim.new(0, 8)

	local TabsFrame = Instance.new("Frame", MainFrame)
	TabsFrame.Size = UDim2.new(0, 120, 1, 0)
	TabsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Instance.new("UICorner", TabsFrame).CornerRadius = UDim.new(0, 8)

	local TabLayout = Instance.new("UIListLayout", TabsFrame)
	TabLayout.Padding = UDim.new(0, 5)
	TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	local PagesFrame = Instance.new("Frame", MainFrame)
	PagesFrame.Size = UDim2.new(1, -130, 1, -10)
	PagesFrame.Position = UDim2.new(0, 130, 0, 5)
	PagesFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", PagesFrame).CornerRadius = UDim.new(0, 8)

	local MainTab = Tabs.Create(TabsFrame, "Farm")
	local MainPage = Instance.new("Frame", PagesFrame)
	MainPage.Size = UDim2.new(1, -10, 1, -10)
	MainPage.Position = UDim2.new(0, 5, 0, 5)
	MainPage.BackgroundTransparency = 1
	local Layout = Instance.new("UIListLayout", MainPage)
	Layout.Padding = UDim.new(0, 6)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

	MainTab.MouseButton1Click:Connect(function()
		for _, v in pairs(PagesFrame:GetChildren()) do
			if v:IsA("Frame") then v.Visible = false end
		end
		MainPage.Visible = true
	end)
	MainPage.Visible = true

	-- Toggle bật/tắt Farm
	local running = false
	Buttons.Create(MainPage, "Bật/Tắt Auto Farm", function()
		running = not running
		if running then
			task.spawn(function()
				AutoFarm(EnemyList)
			end)
		end
	end)

	-- Auto Stats
	Buttons.Create(MainPage, "Auto Stats", function()
		task.spawn(AutoStats)
	end)

	-- Nút bật/tắt UI
	local ToggleBtn = Instance.new("TextButton", ScreenGui)
	ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
	ToggleBtn.Position = UDim2.new(1, -50, 0, 20)
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ToggleBtn.Text = "☰"
	ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleBtn.Font = Enum.Font.GothamBold
	ToggleBtn.TextSize = 18
	Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

	local open = true
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
	local openPos = UDim2.new(0.5, -250, 0.5, -150)
	local closedPos = UDim2.new(0.5, -250, -1, -350)

	ToggleBtn.MouseButton1Click:Connect(function()
		open = not open
		TweenService:Create(MainFrame, tweenInfo, {Position = open and openPos or closedPos}):Play()
	end)
end
