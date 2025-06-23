local Tabs = loadstring(game:HttpGet("https://raw.githubusercontent.com/hviet2510/noda/main/modules/tabs.lua"))()
local Buttons = loadstring(game:HttpGet("https://raw.githubusercontent.com/hviet2510/noda/main/modules/buttons.lua"))()

local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "StackFlowUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local TabsFrame = Instance.new("Frame", MainFrame)
TabsFrame.Size = UDim2.new(0, 120, 1, 0)
TabsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", TabsFrame).CornerRadius = UDim.new(0, 8)
Instance.new("UIListLayout", TabsFrame).Padding = UDim.new(0, 5)

local PagesFrame = Instance.new("Frame", MainFrame)
PagesFrame.Size = UDim2.new(1, -130, 1, -10)
PagesFrame.Position = UDim2.new(0, 130, 0, 5)
PagesFrame.BackgroundTransparency = 1

local farmTab = Tabs.CreateTab("Farm", TabsFrame, PagesFrame)
Buttons.Create(farmTab, "Auto Farm", function() print("Auto Farm Bật!") end)

local settingsTab = Tabs.CreateTab("Settings", TabsFrame, PagesFrame)
Buttons.Create(settingsTab, "Config", function() print("Cấu hình") end)
