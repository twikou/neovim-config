require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-n>",
			node_incremental = "<c-n>",
			node_decremental = "<c-m>",
		},
	},
})
