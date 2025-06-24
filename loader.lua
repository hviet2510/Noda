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
		return nil
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

if UI and Tabs and Buttons and Config and EnemyList and AutoFarm and AutoStats then
	Notify("Khởi tạo giao diện UI...")
	UI(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
	Notify("Tải hoàn tất. UI đã khởi chạy.")
else
	warn("[Loader ERROR] Một hoặc nhiều module chưa được tải thành công.")
end
