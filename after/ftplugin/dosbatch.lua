local run = function()
	vim.cmd("w")
	local path = vim.fn.expand("%:p:h")
	local name = vim.fn.expand("%:p")
	local buf = vim.fn.bufnr()
	vim.cmd("belowright sp")
	vim.cmd("enew")
	vim.cmd("set filetype=terminal")
	vim.cmd("lcd "..path)
	vim.fn.termopen({ name })
end

vim.keymap.set("n", "<F5>", run, { buffer = 0, desc = "Run File" })
vim.cmd("syntax on")
