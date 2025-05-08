vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("config-terminal", { clear = true }),
	callback = function()
		vim.bo.filetype = "terminal"
	end
})
