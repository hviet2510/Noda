-- Module Main.lua: Khởi tạo Giao Diện Chính Wind UI
local MainUI = {}

function MainUI.CreateWindow(title)
	local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

	local ScreenGui = Instance.new("ScreenGui", PlayerGui)
	ScreenGui.Name = "WindUI"
	ScreenGui.ResetOnSpawn = false

	local Main = Instance.new("Frame", ScreenGui)
	Main.Size = UDim2.new(0, 600, 0, 400)
	Main.Position = UDim2.new(0.5, -300, 0.5, -200)
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

	-- Sidebar
	local Sidebar = Instance.new("Frame", Main)
	Sidebar.Size = UDim2.new(0, 150, 1, 0)
	Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

	-- SearchBox
	local SearchBox = Instance.new("TextBox", Sidebar)
	SearchBox.PlaceholderText = "Search"
	SearchBox.Size = UDim2.new(1, -20, 0, 30)
	SearchBox.Position = UDim2.new(0, 10, 0, 10)
	SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.Font = Enum.Font.Gotham
	SearchBox.TextSize = 14
	Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 6)

	-- Tabs List Container
	local TabsFrame = Instance.new("Frame", Sidebar)
	TabsFrame.Size = UDim2.new(1, 0, 1, -60)
	TabsFrame.Position = UDim2.new(0, 0, 0, 50)
	TabsFrame.BackgroundTransparency = 1

	local TabsLayout = Instance.new("UIListLayout", TabsFrame)
	TabsLayout.Padding = UDim.new(0, 6)

	-- Content Area
	local Content = Instance.new("Frame", Main)
	Content.Size = UDim2.new(1, -160, 1, -20)
	Content.Position = UDim2.new(0, 160, 0, 10)
	Content.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

	local ContentLayout = Instance.new("UIListLayout", Content)
	ContentLayout.Padding = UDim.new(0, 8)

	return {
		ScreenGui = ScreenGui,
		Main = Main,
		Sidebar = Sidebar,
		TabsFrame = TabsFrame,
		Content = Content
	}
end

return MainUI
