return function(EnemyList)
	local Players, ReplicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage")
	local player, character = Players.LocalPlayer, Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()

	local function BringMob()
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
				mob.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, -3, -5)
				mob.HumanoidRootPart.Anchored = true
			end
		end
	end

	local function AttackMob()
		for _, mob in pairs(workspace.Enemies:GetChildren()) do
			if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
				pcall(function()
					ReplicatedStorage.Remotes.Combat:FireServer(mob)
				end)
			end
		end
	end

	local function GetQuestData()
		for i = #EnemyList, 1, -1 do
			local d = EnemyList[i]
			if player.Data.Level.Value >= d.Level then return d end
		end
	end

	while task.wait(0.1) do
		local data = GetQuestData()
		if data then
			pcall(function()
				ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", data.Quest, 1)
				character.HumanoidRootPart.CFrame = CFrame.new(data.Pos + Vector3.new(0, 30, 0))
			end)
			BringMob()
			for _ = 1, 5 do
				AttackMob()
				task.wait(0.05)
			end
		end
	end
end
