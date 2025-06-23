return function(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")
	local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "StackFlowUI"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = PlayerGui

	local MainFrame = Instance.new("Frame")
	MainFrame.Size = UDim2.new(0, 500, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	MainFrame.Parent = ScreenGui
	Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

	local TitleBar = Instance.new("Frame", MainFrame)
	TitleBar.Size = UDim2.new(1, 0, 0, 35)
	TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 8)

	local Title = Instance.new("TextLabel", TitleBar)
	Title.Size = UDim2.new(1, -35, 1, 0)
	Title.Position = UDim2.new(0, 5, 0, 0)
	Title.BackgroundTransparency = 1
	Title.Text = "StackFlow UI"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 16
	Title.TextXAlignment = Enum.TextXAlignment.Left

	local TabsFrame = Instance.new("Frame", MainFrame)
	TabsFrame.Size = UDim2.new(0, 120, 1, -35)
	TabsFrame.Position = UDim2.new(0, 0, 0, 35)
	TabsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Instance.new("UICorner", TabsFrame).CornerRadius = UDim.new(0, 8)

	local TabLayout = Instance.new("UIListLayout", TabsFrame)
	TabLayout.Padding = UDim.new(0, 5)
	TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	local PagesFrame = Instance.new("Frame", MainFrame)
	PagesFrame.Size = UDim2.new(1, -130, 1, -40)
	PagesFrame.Position = UDim2.new(0, 130, 0, 40)
	PagesFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", PagesFrame).CornerRadius = UDim.new(0, 8)

	local function CreateTab(name)
		local TabButton = Instance.new("TextButton", TabsFrame)
		TabButton.Size = UDim2.new(1, -10, 0, 30)
		TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		TabButton.Text = name
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.Font = Enum.Font.Gotham
		TabButton.TextSize = 14
		Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)

		local Page = Tabs.Create(PagesFrame, name)
		TabButton.MouseButton1Click:Connect(function()
			for _, v in pairs(PagesFrame:GetChildren()) do
				if v:IsA("Frame") then v.Visible = false end
			end
			Page.Visible = true
		end)

		return Page
	end

	-- Example Tabs
	local FarmTab = CreateTab("Farm")
	FarmTab.Visible = true

	Buttons.Create(FarmTab, "Start Farm", function()
		if AutoFarm and EnemyList then
			AutoFarm(EnemyList, Config)
		end
	end)

	Buttons.Create(FarmTab, "Auto Stats", function()
		if AutoStats then
			AutoStats(Config)
		end
	end)

	-- Toggle Button (bên ngoài, góc trên phải)
	local ToggleButton = Instance.new("TextButton")
	ToggleButton.Size = UDim2.new(0, 40, 0, 40)
	ToggleButton.Position = UDim2.new(1, -50, 0, 20)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ToggleButton.Text = "☰"
	ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.Font = Enum.Font.GothamBold
	ToggleButton.TextSize = 18
	ToggleButton.Parent = ScreenGui
	Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 8)

	local openPos = UDim2.new(0.5, -250, 0.5, -150)
	local closedPos = UDim2.new(0.5, -250, -1, 0)
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local open = true

	ToggleButton.MouseButton1Click:Connect(function()
		open = not open
		local goal = {Position = open and openPos or closedPos}
		TweenService:Create(MainFrame, tweenInfo, goal):Play()
	end)

	-- Kéo ToggleButton
	local dragging, dragInput, dragStart, startPos
	ToggleButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = ToggleButton.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	ToggleButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			local newY = startPos.Y.Offset + delta.Y
			ToggleButton.Position = UDim2.new(1, -50, 0, math.clamp(newY, 0, workspace.CurrentCamera.ViewportSize.Y - 50))
		end
	end)
end
