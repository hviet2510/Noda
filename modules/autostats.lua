return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local player = game:GetService("Players").LocalPlayer

	local function AutoAddStats()
		while task.wait(3) do -- 3 giây 1 lần, giảm spam
			pcall(function()
				ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
			end)
		end
	end

	task.spawn(AutoAddStats)
end
