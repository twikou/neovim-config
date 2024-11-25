local highlight = {
	enable = true
}

local incremental_selection = {
	enable = true
}
local textobjects = {
	enable = true
}

incremental_selection.keymaps = {
	init_selection   = "s",
	node_incremental = "s",
	node_decremental = "x",
}
textobjects.select = {
	enable = true,
	lookahead = true,
	keymaps = {
		["af"] = "@function.outer",
		["if"] = "@function.inner",
	},
}
textobjects.swap = {
	enable = true,
	swap_next = {
		["<leader>]f"] = "@function.outer",
	},
	swap_previous = {
		["<leader>[f"] = "@function.outer",
	},
}
textobjects.move = {
	enable = true,
	set_jumps = true,
	goto_next_start = {
		["]]"] = "@function.outer",
		["]/"] = "@comment.outer",
	},
	goto_previous_start = {
		["[["] = "@function.outer",
		["[/"] = "@comment.outer",
	},
}
local refactor = {
	smart_rename = {
		enable = true,
		keymaps = {
			smart_rename = "grr",
		}
	}
}
local indent = {
	enable = true
}
local config = function()
	require("nvim-treesitter.configs").setup({
		indent = indent,
		highlight = highlight,
		incremental_selection = incremental_selection,
		textobjects = textobjects,
		refactor = refactor,
	})
	vim.keymap.set("n", "s", "<NUL>")
	vim.keymap.set("x", "s", "<NUL>")
	vim.keymap.set("x", "x", "<NUL>")
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor"
	},
	event = "VeryLazy",
	config = config,
}
