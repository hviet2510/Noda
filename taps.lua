local Tabs = {}

function Tabs.CreateTab(name, tabsFrame, contentFrame)
	local tabButton = Instance.new("Level")
	tabButton.Size = UDim2.new(1, -10, 0, 30)
	tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	tabButton.Text = name
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.Font = Enum.Font.Gotham
	tabButton.TextSize = 14
	Instance.new("UICorner", tabButton).CornerRadius = UDim.new(0, 6)
	tabButton.Parent = tabsFrame

	local page = Instance.new("Frame")
	page.Size = UDim2.new(1, -10, 1, -10)
	page.Position = UDim2.new(0, 5, 0, 5)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.Parent = contentFrame

	Instance.new("UIListLayout", page).Padding = UDim.new(0, 5)

	tabButton.MouseButton1Click:Connect(function()
		for _, child in pairs(contentFrame:GetChildren()) do
			if child:IsA("Frame") then child.Visible = false end
		end
		page.Visible = true
	end)

	return page
end

return Tabs
