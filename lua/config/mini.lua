local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd([[echo "installing `mini.nvim`" | redraw]])
	local clone_cmd = {
		"git", "clone", "--filter=blob:none",
		"--branch", "stable",
		"https://github.com/echasnovski/mini.nvim", mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags all")
end
require("mini.deps").setup({ path = { package = path_package } })

MiniDeps.add({
	source = "catppuccin/nvim",
	name = "catppuccin"
})

MiniDeps.now(function()
	require("catppuccin").setup({
		no_italic = true,
		no_underline = true,
		integrations = {
			treesitter = true,
		}
	})
	vim.cmd("color catppuccin-macchiato")
	require("mini.icons").setup({})
	require("mini.statusline").setup({})
	require("mini.tabline").setup({})
	local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
	local warning = vim.api.nvim_get_hl(0, { name = "WarningMsg" })
	local statusline = vim.api.nvim_get_hl(0, { name = "StatusLine" })
	vim.api.nvim_set_hl(0, "MiniTablineFill", {
		bg = statusline.bg
	})
	vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", {
		fg = warning.fg,
		bg = normal.bg
	})
	vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", {
		fg = warning.fg,
		bg = statusline.bg
	})
end)

MiniDeps.later(function()
	require("mini.pick").setup({})
	vim.keymap.set("n", "<leader>f", "<cmd>Pick files<cr>")
	vim.keymap.set("n", "<leader>s", "<cmd>Pick grep_live<cr>")
	vim.keymap.set("n", "<leader>c", function()
		MiniPick.builtin.files({}, {
			source = {
				cwd = vim.fn.stdpath("config")
			}
		})
	end)
end)

MiniDeps.later(function()
	require("mini.pairs").setup({})
end)

MiniDeps.later(function()
	require("mini.completion").setup({})
end)

MiniDeps.later(function()
	require("mini.surround").setup({})
end)

MiniDeps.later(function()
	require("mini.files").setup({})
end)

MiniDeps.later(function()
	require("mini.git").setup({})
end)

MiniDeps.later(function()
	require("mini.diff").setup({
		view = {
			style = "sign",
			signs = { add = '│', change = '│', delete = '│' },
		}
	})
end)

MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	name = "nvim-treesitter"
})

MiniDeps.later(function()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<space>",
				node_incremental = "<space>",
				node_decremental = "x",
			},
		},
	})
end)
