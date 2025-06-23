return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local player = game:GetService("Players").LocalPlayer

	while task.wait(5) do
		pcall(function()
			ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
		end)
	end
end
