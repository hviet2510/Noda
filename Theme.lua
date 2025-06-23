-- Module Theme.lua: Chứa các thông số về màu sắc, font, giao diện
local Theme = {}

Theme.PrimaryColor = Color3.fromRGB(20, 20, 20)      -- Nền chính
Theme.SecondaryColor = Color3.fromRGB(25, 25, 25)    -- Sidebar
Theme.AccentColor = Color3.fromRGB(40, 40, 40)       -- Button, Toggle, Dropdown
Theme.TextColor = Color3.fromRGB(255, 255, 255)      -- Màu chữ
Theme.HighlightColor = Color3.fromRGB(60, 60, 60)    -- Hover, chọn

Theme.Font = Enum.Font.Gotham
Theme.CornerRadius = UDim.new(0, 6)

return Theme
