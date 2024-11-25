local M = {}
M.winbar = {}
M.plugins = {}
M.filetype = {
	python = {
		exe = vim.fn.stdpath("data") .. "/python/python.exe",
	},
	java = {
		lsp = vim.fn.glob(vim.fn.stdpath("data") .. "/lsp/jdt-language-server-*"),
		dap = vim.fn.stdpath("data") .. "/dap/java-debug",
	}
}

M.explorer = {
	open = function(path)
		vim.cmd("Explore " .. path:gsub("\\", "/"))
	end,
	open_cwd = function()
		M.explorer.open(vim.fn.getcwd())
	end,
	open_buf = function()
		M.explorer.open(vim.fn.expand("%:p:h"))
	end,
	open_lua = function()
		M.explorer.open(vim.fn.stdpath("config") .. "/lua")
	end
}

M.buffer = {
	delete = function(buf)
		vim.api.nvim_buf_delete(buf, { force = true })
	end
}
M.string = {
	trim = function(text)
		return (text:gsub("^%s*(.-)%s*$", "%1"))
	end,
	first_upper = function(str)
		return (str:gsub("^%l", string.upper))
	end,
	start_with = function(str, substr)
		return (string.sub(str, 1, string.len(substr)) == substr)
	end,
	end_with = function(str, substr)
		return substr == "" or str:sub(-#substr) == substr
	end,
	eachline = function(str, callback)
		local index = 0
		for line in str:gmatch("[^\r\n]+") do
			index = index + 1
			callback(index, line)
		end
	end
}
M.echo = function(text, highlight)
	highlight = highlight or "Normal"
	vim.api.nvim_echo({
		{ text, highlight }
	}, false, {})
end
M.log = function(messages)
	local log_file_path = "D:/desktop/NeovimDebug.txt"
	local log_file = io.open(log_file_path, "a")
	---@diagnostic disable-next-line: param-type-mismatch
	io.output(log_file)
	io.write(messages .. "\n")
	io.close(log_file)
end
M.select = function(opts)
	local items = {}
	for _, v in ipairs(opts.items) do
		table.insert(items, v.text)
	end
	vim.ui.select(items, {
		prompt = opts.prompt
	}, function(choice)
		for _, v in ipairs(opts.items) do
			if choice == v.text then
				v.run(opts)
			end
		end
	end)
end
return M
