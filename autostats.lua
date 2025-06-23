return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	while task.wait(1) do
		pcall(function()
			ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
		end)
	end
end
