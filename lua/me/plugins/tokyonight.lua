local config = function()
	vim.cmd[[colorscheme tokyonight]]
end
return {
	"folke/tokyonight.nvim",
	config = config,
	lazy = false,
	priority = 1000,
	opts = {},
}

