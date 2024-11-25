local COMPILE_COMMAND = "g++ \"%:p\" -o %:p:t:r.exe"

local run = function()
	local path = vim.fn.expand("%:p:h")
	local name = vim.fn.expand("%:p:t:r")
	vim.cmd("sp +ene")
	vim.cmd("lcd " .. path)
	vim.cmd("set filetype=terminal")
	vim.fn.termopen({ name })
end
local compile_and_run = function()
	local buf = vim.fn.bufnr()
	if not vim.b[buf].compiled then
		vim.cmd("silent! make")
		if vim.fn.len(vim.fn.getqflist()) ~= 0 then
			vim.cmd("copen")
		else
			vim.b[buf].compiled = true
			run()
		end
	else
		run()
	end
end
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI"}, {
	group = vim.api.nvim_create_augroup("cpp-clear-compiled", { clear = true }),
	callback = function()
		local buf = vim.fn.bufnr()
		vim.b[buf].compiled = nil
	end
})
local keymaps = function()
	vim.keymap.set("n", "<F5>",   compile_and_run, { buffer = true, desc = "complie and run" })
	vim.keymap.set("n", "<s-F5>", run,             { buffer = true, desc = "run" })
end
local callback = function()
	-- shell command to compile
	vim.bo.makeprg = COMPILE_COMMAND
	-- create keymaps for filetype cpp
	keymaps()
end
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("cpp-settings", { clear = true }),
	pattern = "cpp",
	callback = callback,
})
