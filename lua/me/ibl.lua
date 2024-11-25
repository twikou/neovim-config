vim.api.nvim_set_hl(0, "IblScope", {
	fg = "#c8d3f5"
})
require("ibl").setup({
	indent = {
		char = "│",
	},
	scope = {
		show_start = false,
		show_end = false,
	}
})
