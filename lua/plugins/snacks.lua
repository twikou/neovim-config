return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		picker = {
			enabled = true,
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
	},
	keys = {
		{ "<leader><leader>", function() Snacks.picker.smart() end, desc = "smart find files" },
		{ "<leader>b", function() Snacks.picker.buffers() end, desc = "find buffers" },
		{ "<leader>c", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "find config file" },
		{ "<leader>f", function() Snacks.picker.files() end, desc = "find files" },
		{ "<leader>l", function() Snacks.picker.lines() end, desc = "buffer lines" },
		{ "<leader>g", function() Snacks.picker.grep() end, desc = "grep" },
		{ "d.", function() Snacks.bufdelete() end, desc = "delete buffer" },
	},
	init = function()
		vim.g.snacks_animate = false
		vim.api.nvim_create_user_command("Git", function()
			Snacks.lazygit()
		end, {})
	end
}
