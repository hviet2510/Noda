-- Module Elements.lua: Tạo các thành phần UI trong Wind UI
local Elements = {}

function Elements.CreateButton(parent, text, callback)
	local Button = Instance.new("TextButton", parent)
	Button.Size = UDim2.new(0, 280, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Text = text
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

	Button.MouseButton1Click:Connect(callback)
	return Button
end

function Elements.CreateToggle(parent, text, default, callback)
	local Toggle = Instance.new("TextButton", parent)
	Toggle.Size = UDim2.new(0, 280, 0, 30)
	Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	Toggle.Font = Enum.Font.Gotham
	Toggle.TextSize = 14
	Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 6)

	local state = default
	local function updateText()
		Toggle.Text = text .. ": " .. (state and "ON" or "OFF")
	end
	updateText()

	Toggle.MouseButton1Click:Connect(function()
		state = not state
		updateText()
		callback(state)
	end)

	return Toggle
end

function Elements.CreateDropdown(parent, title, options, callback)
	local DropDown = Instance.new("TextButton", parent)
	DropDown.Size = UDim2.new(0, 280, 0, 30)
	DropDown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	DropDown.TextColor3 = Color3.fromRGB(255, 255, 255)
	DropDown.Font = Enum.Font.Gotham
	DropDown.TextSize = 14
	DropDown.Text = title
	Instance.new("UICorner", DropDown).CornerRadius = UDim.new(0, 6)

	local Open = false
	local ListFrame

	DropDown.MouseButton1Click:Connect(function()
		if Open then
			if ListFrame then ListFrame:Destroy() end
			Open = false
		else
			ListFrame = Instance.new("Frame", parent)
			ListFrame.Size = UDim2.new(0, 280, 0, #options * 30 + 4)
			ListFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Instance.new("UICorner", ListFrame).CornerRadius = UDim.new(0, 6)

			local Layout = Instance.new("UIListLayout", ListFrame)
			Layout.Padding = UDim.new(0, 2)

			for _, v in ipairs(options) do
				local Item = Instance.new("TextButton", ListFrame)
				Item.Size = UDim2.new(1, -4, 0, 28)
				Item.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Item.TextColor3 = Color3.fromRGB(255, 255, 255)
				Item.Font = Enum.Font.Gotham
				Item.TextSize = 14
				Item.Text = tostring(v)
				Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 4)

				Item.MouseButton1Click:Connect(function()
					DropDown.Text = title .. ": " .. tostring(v)
					callback(v)
					ListFrame:Destroy()
					Open = false
				end)
			end

			Open = true
		end
	end)

	return DropDown
end

function Elements.CreateTextbox(parent, placeholder, callback)
	local TextBox = Instance.new("TextBox", parent)
	TextBox.Size = UDim2.new(0, 280, 0, 30)
	TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TextBox.PlaceholderText = placeholder
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.Font = Enum.Font.Gotham
	TextBox.TextSize = 14
	Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 6)

	TextBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			callback(TextBox.Text)
		end
	end)

	return TextBox
end

return Elements
