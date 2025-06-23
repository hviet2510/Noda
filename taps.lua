-- Module Tabs.lua: Quản lý Tabs của Wind UI
local Tabs = {}

function Tabs.CreateTab(tabsFrame, contentFrame, tabName)
	local TabButton = Instance.new("TextButton", tabsFrame)
	TabButton.Size = UDim2.new(1, -20, 0, 30)
	TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabButton.Text = tabName
	TabButton.Font = Enum.Font.Gotham
	TabButton.TextSize = 14
	Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)

	local Page = Instance.new("Frame")
	Page.Size = UDim2.new(1, -20, 1, -20)
	Page.Position = UDim2.new(0, 10, 0, 10)
	Page.BackgroundTransparency = 1
	Page.Visible = false
	Page.Parent = contentFrame

	local Layout = Instance.new("UIListLayout", Page)
	Layout.Padding = UDim.new(0, 8)

	TabButton.MouseButton1Click:Connect(function()
		for _, v in pairs(contentFrame:GetChildren()) do
			if v:IsA("Frame") then
				v.Visible = false
			end
		end
		Page.Visible = true
	end)

	return Page
end

return Tabs
