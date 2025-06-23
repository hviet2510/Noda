return function(Tabs)
	local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	ScreenGui.Name = "StackFlowUI"

	local MainFrame = Instance.new("Frame", ScreenGui)
	MainFrame.Size = UDim2.new(0, 500, 0, 300)
	MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	local UICorner = Instance.new("UICorner", MainFrame)
	UICorner.CornerRadius = UDim.new(0, 8)

	-- Toggle Button UI
	local Toggle = Instance.new("TextButton", ScreenGui)
	Toggle.Size = UDim2.new(0, 40, 0, 40)
	Toggle.Position = UDim2.new(1, -50, 0, 20)
	Toggle.Text = "☰"
	Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	Toggle.Font = Enum.Font.GothamBold
	Toggle.TextSize = 18
	Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)

	local open = true
	Toggle.MouseButton1Click:Connect(function()
		open = not open
		MainFrame.Visible = open
	end)

	return MainFrame
end
