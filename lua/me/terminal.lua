vim.cmd("filetype plugin on")
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("terminal-open-settings", { clear = true }),
	callback = function()
		vim.cmd("set filetype=terminal")
	end,
})
