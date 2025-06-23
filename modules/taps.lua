local Tabs = {}

function Tabs.Create(parent, name)
	local Tab = Instance.new("Frame")
	Tab.Name = name
	Tab.Size = UDim2.new(1, 0, 1, 0)
	Tab.BackgroundTransparency = 1
	Tab.Visible = false
	Tab.Parent = parent

	local Layout = Instance.new("UIListLayout")
	Layout.Parent = Tab
	Layout.Padding = UDim.new(0, 8)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

	return Tab
end

return Tabs
