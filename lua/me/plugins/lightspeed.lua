return {
	"ggandor/lightspeed.nvim",
	init = function()
		vim.g.lightspeed_no_default_keymaps = true
	end,
	event = "VeryLazy",
	config = function()
		require("me.lightspeed")
	end
}
