return function(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")
	local Players = game:GetService("Players")

	-- UI Container
	local ScreenGui = Instance.new("ScreenGui", Players.LocalPlayer:WaitForChild("PlayerGui"))
	ScreenGui.Name = "StackFlowUI"

	-- Main Frame
	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 500, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

	-- Tabs Holder
	local TabsFrame = Instance.new("Frame", MainFrame)
	TabsFrame.Size = UDim2.new(0, 120, 1, 0)
	TabsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Instance.new("UICorner", TabsFrame).CornerRadius = UDim.new(0, 8)

	local Layout = Instance.new("UIListLayout", TabsFrame)
	Layout.Padding = UDim.new(0, 5)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	-- Pages Frame
	local PagesFrame = Instance.new("Frame", MainFrame)
	PagesFrame.Size = UDim2.new(1, -130, 1, -10)
	PagesFrame.Position = UDim2.new(0, 130, 0, 5)
	PagesFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", PagesFrame).CornerRadius = UDim.new(0, 8)

	-- Tạo Tab chính
	local FarmTab = Tabs.Create(TabsFrame, "Farm Level")
	FarmTab.Parent = PagesFrame

	-- Nút bật/tắt Auto Farm
	local isAutoFarm = false
	Buttons.Create(FarmTab, "Auto Farm: false", function(btn)
		isAutoFarm = not isAutoFarm
		btn.Text = "Auto Farm: " .. tostring(isAutoFarm)
		if isAutoFarm then
			task.spawn(function()
				AutoFarm(EnemyList)
			end)
		end
	end)

	-- Auto Stats (tăng chỉ số)
	Buttons.Create(FarmTab, "Auto Stats", function()
		task.spawn(AutoStats)
	end)

	-- Toggle mở/ẩn UI
	local ToggleBtn = Instance.new("TextButton", ScreenGui)
	ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
	ToggleBtn.Position = UDim2.new(1, -50, 0, 20)
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ToggleBtn.Text = "☰"
	ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleBtn.Font = Enum.Font.GothamBold
	ToggleBtn.TextSize = 18
	Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

	ToggleBtn.MouseButton1Click:Connect(function()
		MainFrame.Visible = not MainFrame.Visible
	end)
end
