return function(EnemyList, Config)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local TweenService = game:GetService("TweenService")
	local player = Players.LocalPlayer
	local Combat = ReplicatedStorage.Remotes.Combat

	local function GetHRP()
		return player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	end

	local function GetEnemy()
		for i = #EnemyList, 1, -1 do
			if player.Data.Level.Value >= EnemyList[i].Level then
				return EnemyList[i]
			end
		end
	end

	local function StartQuest(enemy)
		pcall(function()
			ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", enemy.Quest, 1)
		end)
	end

	local function TweenTo(cframe)
		local hrp = GetHRP()
		if hrp then
			local tween = TweenService:Create(hrp, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = cframe})
			tween:Play()
			tween.Completed:Wait()
		end
	end

	local function BringEnemies(enemyName)
		if not Config.BringMob then return end
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob.Name == enemyName and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
				mob.HumanoidRootPart.CFrame = GetHRP().CFrame * CFrame.new(0, -4, -5)
				mob.HumanoidRootPart.Anchored = true
			end
		end
	end

	local function Attack(enemyName)
		if not Config.FastAttack then return end
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob.Name == enemyName and mob.Humanoid.Health > 0 then
				Combat:FireServer(mob)
			end
		end
	end

	local AutoFarmEnabled = false

	task.spawn(function()
		while task.wait(0.2) do
			if AutoFarmEnabled then
				local enemy = GetEnemy()
				if enemy then
					StartQuest(enemy)
					TweenTo(enemy.CFrame + Vector3.new(0, 25, 0))
					BringEnemies(enemy.Mob)
					for _ = 1, 10 do
						Attack(enemy.Mob)
						task.wait(Config.AttackDelay)
					end
				end
			end
		end
	end)

	return {
		Toggle = function(state)
			AutoFarmEnabled = state
		end,
		IsEnabled = function()
			return AutoFarmEnabled
		end
	}
end
