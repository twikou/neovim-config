local config = function()
	require("nvim-surround").setup({})
end

return {
	"kylechui/nvim-surround",
	config = config,
	lazy = true,
	event = "VeryLazy",
}
