local Tabs = ImportModule("tabs")
local Buttons = ImportModule("buttons")
local Config = ImportModule("config")
local EnemyList = ImportModule("enemylist")
local AutoFarm = ImportModule("autofarm")
local AutoStats = ImportModule("autostats")
local UI = ImportModule("ui")

if UI then
	UI(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats)
end
