local Tabs = {}

function Tabs.Create(parent, name)
	local TabButton = Instance.new("TextButton", parent)
	TabButton.Size = UDim2.new(1, -10, 0, 30)
	TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TabButton.Text = name
	TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabButton.Font = Enum.Font.Gotham
	TabButton.TextSize = 14
	Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)

	local Page = Instance.new("Frame")
	Page.Size = UDim2.new(1, -10, 1, -40)
	Page.Position = UDim2.new(0, 5, 0, 35)
	Page.BackgroundTransparency = 1
	Page.Visible = false

	local Layout = Instance.new("UIListLayout", Page)
	Layout.Padding = UDim.new(0, 6)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

	TabButton.MouseButton1Click:Connect(function()
		for _, v in pairs(parent.Parent:GetChildren()) do
			if v:IsA("Frame") and v ~= parent then
				for _, sub in pairs(v:GetChildren()) do
					if sub:IsA("Frame") then
						sub.Visible = false
					end
				end
			end
		end
		Page.Visible = true
	end)

	return Page, TabButton
end

return Tabs
