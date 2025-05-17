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
	vim.keymap.set("n", "<leader>s", "<cmd>Pick grep_live<cr>")
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
	vim.keymap.set("n", "<leader>f", function()
		MiniFiles.open()
	end)
	vim.keymap.set("n", "<leader>c", function()
		MiniFiles.open(vim.fn.stdpath("config"))
	end)
	vim.api.nvim_create_autocmd('User', {
		pattern = 'MiniFilesBufferCreate',
		callback = function(args)
			local buf_id = args.data.buf_id
			vim.keymap.set('n', '<leader>f', function()
				local cur = MiniFiles.get_fs_entry()
				local cwd = vim.fn.fnamemodify(cur.path, ":h")
				MiniPick.builtin.files({}, {
					source = {
						cwd = cwd
					}
				})
			end, { buffer = buf_id })
		end,
	})
	vim.keymap.set("n", "-", function()
		MiniFiles.open(vim.api.nvim_buf_get_name(0))
	end)
end)

MiniDeps.later(function()
	require("mini.git").setup({})
end)

MiniDeps.later(function()
	require("mini.jump").setup({})
end)

MiniDeps.later(function()
	require("mini.bufremove").setup({})
	vim.keymap.set("n", "<leader>q", function()
		MiniBufremove.delete()
	end)
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
	require("config.treesitter")
end)

MiniDeps.add({
	source = "neovim/nvim-lspconfig",
	name = "lspconfig"
})

MiniDeps.now(function()
	require("config.lspconfig")
end)

MiniDeps.later(function()
	local miniclue = require("mini.clue")
	miniclue.setup({
		triggers = {
			{ mode = "n", keys = "g" },
			{ mode = "n", keys = "\\" },
		},
		clues = {
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
		}
	})
end)
