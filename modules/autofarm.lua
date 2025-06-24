return function(EnemyList, Config)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local TweenService = game:GetService("TweenService")
	local player = Players.LocalPlayer
	local Combat = ReplicatedStorage.Remotes.Combat

	-- Auto Equip Melee
	local function EquipMelee()
		if Config.PreferMelee then
			for _, tool in pairs(player.Backpack:GetChildren()) do
				if tool:IsA("Tool") and tool.ToolTip == "Melee" then
					player.Character.Humanoid:EquipTool(tool)
					break
				end
			end
		end
	end

	-- Tìm quái phù hợp Level
	local function GetEnemy()
		for i = #EnemyList, 1, -1 do
			if player.Data.Level.Value >= EnemyList[i].Level then
				return EnemyList[i]
			end
		end
	end

	-- Nhận nhiệm vụ
	local function StartQuest(enemy)
		pcall(function()
			ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", enemy.Quest, 1)
		end)
	end

	-- Tween đến vị trí quái
	local function TweenToPosition(targetCFrame)
		local character = player.Character or player.CharacterAdded:Wait()
		local HRP = character:WaitForChild("HumanoidRootPart")
		local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Linear)
		local tweenGoal = {CFrame = targetCFrame}
		local tween = TweenService:Create(HRP, tweenInfo, tweenGoal)
		tween:Play()
		tween.Completed:Wait()
	end

	-- Bring quái lại gần
	local function BringEnemies(enemyName)
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob.Name == enemyName and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChildOfClass("Humanoid") then
				if mob.HumanoidRootPart and mob.HumanoidRootPart:IsA("BasePart") then
					mob.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4, -5)
					mob.HumanoidRootPart.Anchored = true
				end
			end
		end
	end

	-- Đánh quái an toàn
	local function AutoPunch(enemyName)
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob.Name == enemyName and mob:FindFirstChildOfClass("Humanoid") and mob.Humanoid.Health > 0 then
				pcall(function()
					Combat:FireServer(mob)
				end)
			end
		end
	end

	-- Vòng lặp chính
	while task.wait(0.2) do
		if Config.AutoFarm then
			local enemy = GetEnemy()
			if enemy then
				StartQuest(enemy)
				EquipMelee()
				TweenToPosition(enemy.CFrame + Vector3.new(0, 25, 0))
				if Config.BringMob then BringEnemies(enemy.Mob) end
				for _ = 1, 10 do
					AutoPunch(enemy.Mob)
					task.wait(Config.AttackDelay)
				end
			end
		end
	end
end
