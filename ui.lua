local ui = {}

local StarterGui = game:GetService("StarterGui")

-- UI Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "UIToggle"
toggleBtn.Size = UDim2.new(0, 50, 0, 30)
toggleBtn.Position = UDim2.new(1, -60, 0, 10)
toggleBtn.AnchorPoint = Vector2.new(0, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.Text = "UI"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.TextSize = 14
toggleBtn.ZIndex = 10

-- Main UI Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainUI"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Tab Buttons Frame
local tabBar = Instance.new("Frame")
tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(0, 400, 0, 30)
tabBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabBar.Parent = mainFrame

-- Container for tab content
local tabContent = Instance.new("Frame")
tabContent.Name = "TabContent"
tabContent.Position = UDim2.new(0, 0, 0, 30)
tabContent.Size = UDim2.new(1, 0, 1, -30)
tabContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
tabContent.Parent = mainFrame

-- Function to create a tab button
function ui:CreateTab(name)
	local tabBtn = Instance.new("TextButton")
	tabBtn.Name = name .. "Tab"
	tabBtn.Text = name
	tabBtn.Size = UDim2.new(0, 100, 1, 0)
	tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	tabBtn.TextColor3 = Color3.new(1, 1, 1)
	tabBtn.Parent = tabBar

	local contentFrame = Instance.new("Frame")
	contentFrame.Name = name .. "Content"
	contentFrame.Size = UDim2.new(1, 0, 1, 0)
	contentFrame.Visible = false
	contentFrame.BackgroundTransparency = 1
	contentFrame.Parent = tabContent

	tabBtn.MouseButton1Click:Connect(function()
		for _, child in pairs(tabContent:GetChildren()) do
			child.Visible = false
		end
		contentFrame.Visible = true
	end)

	return contentFrame
end

-- Function to create a button in a tab
function ui:CreateButton(tabFrame, text, callback)
	local btn = Instance.new("TextButton")
	btn.Text = text
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Parent = tabFrame
	btn.MouseButton1Click:Connect(callback)
end

-- Toggle UI
toggleBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Parent to CoreGui (or StarterGui for test)
toggleBtn.Parent = game:GetService("CoreGui")
mainFrame.Parent = game:GetService("CoreGui")

return ui
