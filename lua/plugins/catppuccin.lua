return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		no_italic = true,
	},
	config = function(opts)
		require("catppuccin").setup(opts)
		vim.cmd("color catppuccin-macchiato")
	end
}
