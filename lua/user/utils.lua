local M = {}

M.state = {
	diagnostic_virtual_text = false,
}

M.setup = function(config)
	M.state = vim.tbl_extend("force", M.state, config)
	vim.diagnostic.config({ virtual_text = M.state.diagnostic_virtual_text })
end

M.diagnostic_virtual_text_toggle = function(enable)
	if enable ~= nil then
		M.state.diagnostic_virtual_text = enable
	else
		M.state.diagnostic_virtual_text = not M.state.diagnostic_virtual_text
	end
	vim.diagnostic.config({ virtual_text = M.state.diagnostic_virtual_text })
end

function M.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end
	print(table.concat(objects, "\n"))
	return ...
end

return M
