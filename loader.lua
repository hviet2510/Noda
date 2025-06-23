-- Loader chính
local EnemyList = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/enemylist.lua"))()
local AutoFarm = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/autofarm.lua"))()
local AutoStats = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/autostats.lua"))()
local CreateUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/ui.lua"))()

CreateUI(AutoFarm, AutoStats, EnemyList)
