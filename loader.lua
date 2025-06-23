local function ImportModule(name)
	Notify("Đang tải module: " .. name)
	local success, result = pcall(function()
		local response = game:HttpGet("https://raw.githubusercontent.com/hviet2510/Noda/main/modules/" .. name .. ".lua")
		assert(response and response ~= "", "Không tìm thấy file hoặc file rỗng.")
		return loadstring(response)()
	end)
	if success then
		Notify("Đã tải: " .. name)
		return result
	else
		warn("[Loader ERROR] Module lỗi: " .. name .. "\n" .. tostring(result))
		return nil
	end
end
