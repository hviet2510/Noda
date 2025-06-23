return function(EnemyList)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local TweenService = game:GetService("TweenService")

	local player = Players.LocalPlayer
	local Combat = ReplicatedStorage.Remotes.Combat

	local function GetCharacter()
		local char = player.Character or player.CharacterAdded:Wait()
		local HRP = char:WaitForChild("HumanoidRootPart")
		return char, HRP
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
	local function TweenToPosition(HRP, targetCFrame)
		local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Linear)
		local tweenGoal = {CFrame = targetCFrame}
		local tween = TweenService:Create(HRP, tweenInfo, tweenGoal)
		tween:Play()
		tween.Completed:Wait()
	end

	-- Bring quái lại gần người chơi
	local function BringEnemies(HRP, enemyName)
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob.Name == enemyName and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
				mob.HumanoidRootPart.CFrame = HRP.CFrame * CFrame.new(0, -4, -5)
				mob.HumanoidRootPart.Anchored = true
			end
		end
	end

	-- Auto Đấm Quái (ổn định hơn)
	local function AutoPunch(enemyName)
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob.Name == enemyName and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
				pcall(function()
					Combat:FireServer(mob)
				end)
			end
		end
	end

	-- Vòng lặp chính (An toàn hơn)
	while task.wait(0.2) do
		local success, err = pcall(function()
			local enemy = GetEnemy()
			if enemy then
				local character, HRP = GetCharacter()
				StartQuest(enemy)
				TweenToPosition(HRP, enemy.CFrame + Vector3.new(0, 25, 0))
				BringEnemies(HRP, enemy.Mob)
				for _ = 1, 10 do
					AutoPunch(enemy.Mob)
					task.wait(0.03)
				end
			end
		end)
		if not success then
			warn("[AutoFarm ERROR]: " .. tostring(err))
		end
	end
end
