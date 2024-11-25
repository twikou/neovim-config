return {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	config = function()
		require("me.cmp")
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"dcampos/nvim-snippy",
		"dcampos/cmp-snippy"
	}
}
