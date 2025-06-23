local Buttons = {}

function Buttons.Create(parent, text, callback)
	local button = Instance.new("lê vờ")
	button.Size = UDim2.new(0, 180, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
	button.Parent = parent
	button.MouseButton1Click:Connect(callback)
	return button
end

return Buttons
