local Tabs = {}

function Tabs.Create(parent, name)
	local TabButton = Instance.new("TextButton")
	TabButton.Size = UDim2.new(0, 100, 0, 30)
	TabButton.Text = name
	TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabButton.Font = Enum.Font.Gotham
	TabButton.TextSize = 14
	Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)

	local Page = Instance.new("Frame")
	Page.Size = UDim2.new(1, 0, 1, -40)
	Page.Position = UDim2.new(0, 0, 0, 40)
	Page.BackgroundTransparency = 1
	Page.Visible = false
	Instance.new("UIListLayout", Page).Padding = UDim.new(0, 6)

	TabButton.MouseButton1Click:Connect(function()
		for _, v in pairs(parent:GetChildren()) do
			if v:IsA("Frame") then v.Visible = false end
		end
		Page.Visible = true
	end)

	TabButton.Parent = parent
	Page.Parent = parent

	return Page
end

return Tabs
