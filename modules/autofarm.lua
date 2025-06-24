return function(EnemyList, Config)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local TweenService = game:GetService("TweenService")
	local player = Players.LocalPlayer
	local Combat = ReplicatedStorage.Remotes.Combat

	local function GetHRP()
		local character = player.Character or player.CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	-- Hàm tìm quái theo Level
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

	-- Tween mượt đến vị trí quái
	local function TweenToPosition(targetCFrame)
		local HRP = GetHRP()
		local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Linear)
		local tweenGoal = {CFrame = targetCFrame}
		local tween = TweenService:Create(HRP, tweenInfo, tweenGoal)
		tween:Play()
		tween.Completed:Wait()
	end

	-- Bring quái lại gần người chơi (ĐÃ FIX LỖI)
	local function BringEnemies(enemyName)
		if not Config.BringMob then return end
		local HRP = GetHRP()
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob:IsA("Model") and mob.Name == enemyName then
				local humanoid = mob:FindFirstChildOfClass("Humanoid")
				local root = mob:FindFirstChild("HumanoidRootPart")
				if humanoid and root and humanoid.Health > 0 then
					root.CFrame = HRP.CFrame * CFrame.new(0, -4, -5)
					root.Anchored = true
				end
			end
		end
	end

	-- Auto Đấm Quái (ỔN ĐỊNH)
	local function AutoPunch(enemyName)
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob:IsA("Model") and mob.Name == enemyName then
				local humanoid = mob:FindFirstChildOfClass("Humanoid")
				local root = mob:FindFirstChild("HumanoidRootPart")
				if humanoid and root and humanoid.Health > 0 then
					pcall(function()
						Combat:FireServer(mob)
					end)
				end
			end
		end
	end

	-- Vòng lặp chính AutoFarm
	while task.wait(0.2) do
		local enemy = GetEnemy()
		if enemy then
			StartQuest(enemy)
			TweenToPosition(enemy.CFrame + Vector3.new(0, 25, 0))
			BringEnemies(enemy.Mob)
			for _ = 1, 15 do
				AutoPunch(enemy.Mob)
				task.wait(Config.AttackDelay or 0.05)
			end
		end
	end
end
