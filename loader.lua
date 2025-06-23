local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/ui.lua"))()
local EnemyList = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/modules/EnemyList.lua"))()
local AutoFarm = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/modules/AutoFarm.lua"))()
local AutoStats = loadstring(game:HttpGet("https://raw.githubusercontent.com/vieth2510/noda/main/modules/AutoStats.lua"))()

AutoFarm(EnemyList)
AutoStats()
