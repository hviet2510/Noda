local Buttons = {}

function Buttons.Create(parent, text, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0, 200, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.Parent = parent

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = Button

	Button.MouseButton1Click:Connect(callback)

	return Button
end

return Buttons
