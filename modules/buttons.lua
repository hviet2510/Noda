local Buttons = {}

function Buttons.Create(parent, text, callback)
	local Button = Instance.new("TextButton")
	Button.Parent = parent
	Button.Size = UDim2.new(0, 200, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)
	Button.MouseButton1Click:Connect(callback)
	return Button
end

function Buttons.CreateToggle(parent, text, default, callback)
	local state = default
	local Button = Instance.new("TextButton")
	Button.Parent = parent
	Button.Size = UDim2.new(0, 200, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

	local function Update()
		Button.Text = text .. ": " .. (state and "Bật ✅" or "Tắt ❌")
	end

	Button.MouseButton1Click:Connect(function()
		state = not state
		Update()
		if callback then
			callback(state)
		end
	end)

	Update()
	return Button
end

return Buttons
