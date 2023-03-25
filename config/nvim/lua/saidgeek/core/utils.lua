local utils = {}

-- expect_nvim_version
local nvim_info = vim.version()
local nvim_version = nvim_info.major .. "." .. nvim_info.minor .. "." .. nvim_info.patch

function utils.expect_nvim_version(version)
	local expect_version = version
	if not (type(expect_version) == "string") then
		expect_version = "0.8.3"
	end

	print(expect_version)

	if nvim_version ~= expect_version then
		return false
	end
	return true
end

return utils
