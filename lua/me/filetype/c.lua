local COMPILE_COMMAND = "gcc %:p -o %:p:t:r.exe"

require("lspconfig").clangd.setup({
	on_attach = function(client, _)
		-- disable lsp highlight
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

local run = function()
	local path = vim.fn.expand("%:p:h")
	local name = vim.fn.expand("%:p:t:r") .. ".exe"
	if vim.fn.len(vim.fn.glob(name)) == 0 then
		require("me.g").echo("file hasnt compiled!", "ErrorMsg")
		return
	end
	vim.cmd("sp +ene")
	vim.cmd("lcd " .. path)
	vim.cmd("set filetype=terminal")
	vim.fn.termopen({ "cmd", "/c", name })
end
local compile = function()
	vim.cmd("silent! make")
	if vim.fn.len(vim.fn.getqflist()) ~= 0 then
		vim.cmd("copen")
	else
		require("me.g").echo("compile complete!", "String")
	end
end
local compile_and_run = function()
	vim.cmd("silent! make")
	if vim.fn.len(vim.fn.getqflist()) ~= 0 then
		vim.cmd("copen")
	else
		require("me.g").echo("compile complete!", "String")
		run()
	end
end

local callback = function()
	vim.bo.makeprg = COMPILE_COMMAND
	vim.keymap.set("n", "<F5>",   compile_and_run, { buffer = true, desc = "compile and run" });
	vim.keymap.set("n", "<S-F5>", run,             { buffer = true, desc = "run" });
	vim.keymap.set("n", "<F10>",  compile,         { buffer = true, desc = "compile" });
end

vim.api.nvim_create_autocmd("FileType",{
	group = vim.api.nvim_create_augroup("c-settings", { clear = true }),
	pattern = "c",
	callback = callback,
})
