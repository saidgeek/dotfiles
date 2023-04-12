local M = {}

M.mergeTable = function(original_table)
	local result = {}

	for key, value in pairs(original_table) do
		result[key] = value
	end

	return function(table)
		for key, value in ipairs(table) do
			result[key] = value
		end
		return result
	end
end

return M
