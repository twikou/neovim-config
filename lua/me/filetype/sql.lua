local execute = function()
	vim.cmd("w")
	local db = vim.fn.expand("%:t:r") .. ".sqlite"
	local path = vim.fn.expand("%:p:h")
	local name = vim.fn.expand("%:p")
	vim.cmd("belowright sp")
	vim.cmd("enew")
	vim.cmd("set filetype=terminal")
	vim.cmd("lcd " .. path)
	vim.fn.termopen("type " .. name .. " | sqlite3 " .. db)
end
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("sql-settings", { clear = true }),
	pattern = "sql",
	callback = function()
		vim.keymap.set("n", "<F5>", execute, { desc = "execute sqlite3", buffer = true })
	end,
})
