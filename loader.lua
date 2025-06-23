local function Notify(text)
	print("[Loader] " .. text)
end

local function ImportModule(name)
	Notify("Đang tải module: " .. name)
	local success, result = pcall(function()
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/hviet2510/Noda/main/modules/" .. name .. ".lua"))()
	end)
	if success then
		Notify("Đã tải xong module: " .. name)
		return result
	else
		warn("[Loader ERROR] Module lỗi: " .. name .. "\n" .. tostring(result))
	end
end

Notify("Bắt đầu tải các module...")

local Tabs = ImportModule("tabs")
local Buttons = ImportModule("buttons")
local Config = ImportModule("config")
local EnemyList = ImportModule("enemylist")
local AutoFarm = ImportModule("autofarm")
local AutoStats = ImportModule("autostats")
local UI = ImportModule("ui")

if UI then
	Notify("Khởi tạo UI...")
	UI(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	Notify("Hoàn tất.")
else
	warn("[Loader ERROR] Không thể khởi tạo UI!")
end
