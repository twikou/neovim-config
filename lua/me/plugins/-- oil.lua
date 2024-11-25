return {
	"stevearc/oil.nvim",
	lazy = true,
	keys = {
		{ "<leader>eo", "<cmd>Oil<cr>", desc = "Open Oil" },
	},
	config = function()
		require("me.oil")
	end,
}
