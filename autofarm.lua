return function(EnemyList)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local HRP = character:WaitForChild("HumanoidRootPart")

	local function GetEnemyData()
		for i = #EnemyList, 1, -1 do
			local e = EnemyList[i]
			if player.Data.Level.Value >= e.Level then
				return e
			end
		end
	end

	local function StartQuest(enemy)
		pcall(function()
			ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", enemy.Quest, 1)
		end)
	end

	local function BringMobs()
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
				mob.HumanoidRootPart.CFrame = HRP.CFrame * CFrame.new(0, -5, -5)
				mob.HumanoidRootPart.Anchored = true
			end
		end
	end

	local function Attack()
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
				pcall(function()
					ReplicatedStorage.Remotes.Combat:FireServer(mob)
				end)
			end
		end
	end

	while task.wait(0.2) do
		local enemy = GetEnemyData()
		if enemy then
			StartQuest(enemy)
			HRP.CFrame = enemy.CFrame + Vector3.new(0, 25, 0)
			BringMobs()
			for _ = 1, 5 do
				Attack()
				task.wait
