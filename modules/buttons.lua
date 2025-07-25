local Buttons = {}

function Buttons.Create(parent, text, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0, 200, 0, 30)
	Button.Text = text
	Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)
	Button.MouseButton1Click:Connect(callback)

	Button.Parent = parent
	return Button
end

return Buttons
