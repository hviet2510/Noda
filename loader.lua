-- Module Loader.lua: Khởi chạy Wind UI, kết nối các module

local MainUI = require(path.to.Main)       -- Đường dẫn đến Main.lua
local Tabs = require(path.to.Tabs)         -- Đường dẫn đến Tabs.lua
local Elements = require(path.to.Elements) -- Đường dẫn đến Elements.lua

-- Khởi tạo giao diện chính
local Window = MainUI.CreateWindow("Wind UI")

-- Tạo Tabs chính
local MainTab = Tabs.CreateTab(Window.TabsFrame, Window.Content, "Main")
local ConfigTab = Tabs.CreateTab(Window.TabsFrame, Window.Content, "Config")

-- Thêm phần tử vào Tab Main
Elements.CreateButton(MainTab, "Click Me", function()
	print("Clicked!")
end)

Elements.CreateToggle(MainTab, "Auto Farm", false, function(state)
	print("Auto Farm:", state)
end)

Elements.CreateDropdown(MainTab, "Select Mode", {"Fast", "Safe", "Auto"}, function(option)
	print("Selected:", option)
end)

Elements.CreateTextbox(MainTab, "Enter Text", function(text)
	print("Text Entered:", text)
end)

-- Thêm phần tử vào Tab Config
Elements.CreateToggle(ConfigTab, "Enable Feature", true, function(state)
	print("Feature Enabled:", state)
end)
