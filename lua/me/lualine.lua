local symbol = {
	mode = {
		["COMMAND"]  = "  ",
		["INSERT"]   = "  ",
		["NORMAL"]   = " 󰊠 ",
		["TERMINAL"] = "  ",
		["SELECT"]   = "  ",
		["VISUAL"]   = "  ",
		["REPLACE"]  = "  ",
		["V-LINE"]   = "  ",
		["V-BLOCK"]  = "  "
	},
	filetype = {
		["HELP"] = "  ",
		["DAPUI-SCOPES"] = "  ",
		["NVIM-TREE"] = " 󱏒 ",
		["QUICKFIX"] = "  ",
	},
	status = {
		["MODIFIED"] = "› ",
		["READONLY"] = "› ",
		["UNNAMED"] = "no name",
		["NEWFILE"] = "› "
	}
}
local function quickfix_is_loclist()
	return vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0
end
local function quickfix_title()
	if quickfix_is_loclist() then
		return vim.fn.getloclist(0, { title = 0 }).title
	end
	return vim.fn.getqflist({ title = 0 }).title
end
local ext_quickfix = {
	sections = {
		lualine_a = { function() return symbol.filetype["QUICKFIX"] end },
		lualine_b = { quickfix_title },
		lualine_c = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = { function() return symbol.filetype["QUICKFIX"] end },
		lualine_b = { quickfix_title },
		lualine_c = {},
		lualine_y = {},
		lualine_z = {},
	},
	filetypes = { "qf" }
} 

local mode = {
	"mode",
	fmt = function(str)
		return symbol.mode[str] or str
	end,
}
local filename = {
	"filename",
	file_status = true,
	newfile_status = true,
	symbols = {
		modified = symbol.status["MODIFIED"],
		readonly = symbol.status["READONLY"],
		unnamed  = symbol.status["UNNAMED"],
		newfile  = symbol.status["NEWFILE"],
	}
}
local ext_help = {
	sections = {
		lualine_a = { function() return symbol.filetype["HELP"] end },
		lualine_b = { function() return vim.fn.expand("%:p:t:r") end },
		lualine_c = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = { function() return symbol.filetype["HELP"] end },
		lualine_b = { function() return vim.fn.expand("%:p:t:r") end },
		lualine_c = {},
		lualine_y = {},
		lualine_z = {},
	},
	filetypes = { "help" }
}

local ext_terminal = {
	sections = {
		lualine_a = { mode },
		lualine_b = { function() return "console" end },
		lualine_c = { function() return vim.fn.fnamemodify(vim.b.term_title, ":t:r") end },
		lualine_y = { function() return vim.b.terminal_job_id end },
		lualine_z = { function() return vim.b.terminal_job_pid end },
	},
	inactive_sections = {
		lualine_a = { mode },
		lualine_b = { function() return "console" end },
		lualine_c = { function() return vim.fn.fnamemodify(vim.b.term_title, ":t:r") end },
		lualine_y = { function() return vim.b.terminal_job_id end },
		lualine_z = { function() return vim.b.terminal_job_pid end },
	},
	filetypes = { "terminal" }
}
local ext_dapui = {
	scope = {
		sections = {
			lualine_a = { mode },
			lualine_b = { function() return "variables" end },
			lualine_c = {},
			lualine_y = {},
			lualine_z = {},
		},
		filetypes = { "dapui_scopes" }
	},
	watches = {
		sections = {
			lualine_a = { mode },
			lualine_b = { function() return "watchers" end },
			lualine_c = {},
			lualine_y = {},
			lualine_z = {},
		},
		filetypes = { "dapui_watches" }
	},
	console = {
		sections = {
			lualine_a = { mode },
			lualine_b = { function() return "console" end },
			lualine_c = {},
			lualine_y = {},
			lualine_z = {},
		},
		filetypes = { "dapui_console" }
	},
}

local ext_nvim_tree = {
	sections = {
		lualine_a = { function() return symbol.filetype["NVIM-TREE"] end },
		lualine_b = { function() return "explorer" end },
		lualine_c = {},
		lualine_y = {},
		lualine_z = {},
	},
	filetypes = { "NvimTree" }
}

local pos = function()
	return vim.fn.line(".") .. ":" .. vim.fn.col(".")
end

local fullpath = function()
	return vim.fn.expand("%:p")
end

local diagnostics = {
	"diagnostics",
	sections = { "error", "warn", "info", "hint" },
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	update_in_insert = false
}
require("lualine").setup {
	options = {
		icon_enabled = true,
		theme = "auto",
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { filename },
		lualine_c = { diagnostics },
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { pos },
	},
	inactive_sections = {
		lualine_a = { mode },
		lualine_b = { filename },
		lualine_c = { fullpath },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {
		ext_quickfix,
		ext_nvim_tree,
		ext_dapui.scopes,
		ext_dapui.console,
		ext_dapui.watches,
		ext_help,
		ext_terminal
	}
}
