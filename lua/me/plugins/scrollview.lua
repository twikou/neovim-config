local config = function()
	require('scrollview').setup({ excluded_filetypes = { 'NvimTree' }, })
end
return {
	"dstein64/nvim-scrollview",
	config = config,
	lazy = true,
	event = "VeryLazy",
}
