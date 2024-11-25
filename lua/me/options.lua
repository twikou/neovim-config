-- disable sql keymaps
vim.g.omni_sql_no_default_maps = 1
vim.g.loaded_sql_completion = 0

vim.opt.shadafile = "NONE"

-- disable provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.shortmess:append("I")
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.splitbelow = true

vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.hlsearch = false
vim.opt.list = true
vim.opt.listchars = "tab:│,eol:,space:"
vim.opt.guicursor = "n:block-blinkwait300-blinkoff300-blinkon300,i:ver30-blinkwait300-blinkon300-blinkoff300"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.showmode = false
vim.opt.swapfile = false

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	signs = true,
	update_in_insert = false,
})

vim.diagnostic.config({
	update_in_insert = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '│ ',
			[vim.diagnostic.severity.WARN] = '│ ',
			[vim.diagnostic.severity.HINT] = '│ ',
			[vim.diagnostic.severity.INFO] = '│ ',
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
		},
	},
})
