local LSP_EXE = vim.fn.glob(vim.fn.stdpath("data").."/lsp/texlab*") .. "/texlab.exe"
require("lspconfig").texlab.setup({
	cmd = {
		LSP_EXE,
	},
	settings = {
		texlab = {
			build = {
				onSave = true,
			},
		},
	}
})
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("latex-settings", { clear = true }),
	pattern = "tex",
	callback = function()
		vim.cmd("syntax on")
	end
})
