vim.lsp.enable({ "pyright", "ruff" })
vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
		},
	},
})
