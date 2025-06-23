local function loadModule(url)
	local success, result = pcall(function()
		return loadstring(game:HttpGet(url))()
	end)
	if not success then
		warn("❗ Lỗi tải module:", url, "\n", result)
	end
	return result
end

local baseURL = "https://raw.githubusercontent.com/hviet2510/Noda/main/modules/"

local EnemyList = loadModule(baseURL.."enemylist.lua")
local Config = loadModule(baseURL.."config.lua")
local Tabs = loadModule(baseURL.."tabs.lua")
local Buttons = loadModule(baseURL.."buttons.lua")
local UI = loadModule(baseURL.."ui.lua")
local AutoStats = loadModule(baseURL.."autostats.lua")
local AutoFarm = loadModule(baseURL.."autofarm.lua")

if UI then UI(Tabs, Buttons, Config, AutoFarm, EnemyList, AutoStats) end
