return {
	"nvim-treesitter/nvim-treesitter",
	config = function(opts)
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "s",
					node_incremental = "s",
					scope_incremental = "<m-s>",
					node_decremental = "x",
				},
			},
		})
	end
}
