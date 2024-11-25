local config = function()
	require("onedark").setup {
		style = "darker",
		ending_tildes = true,
	}
	require("onedark").load()
	local colors = require "onedark.colors"
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = colors.red, underline = true})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = colors.yellow, underline = true})
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.purple, bg = colors.bg0 })
	vim.api.nvim_set_hl(0, "QuickFixLine", { link = "CursorLine" })
end
return {
	"navarasu/onedark.nvim",
	config = config,
}

