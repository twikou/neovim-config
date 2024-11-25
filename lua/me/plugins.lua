local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
	vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end

vim.opt.rtp:prepend(lazypath)

local plugins = {}

local start_with = require("me.utils").string.start_with

local files = vim.split(vim.fn.glob(vim.fn.stdpath("config") .. "/lua/me/plugins/*.lua"), "\n")
for _, v in ipairs(files) do
	-- name (no extension) of file
	local name = vim.fn.fnamemodify(v, ":p:t:r")
	
	if not start_with(name, "--") then
		local state, plugin = pcall(require, "me.plugins." .. name)
		if state then
			table.insert(plugins, plugin)
		end
	end
end
require("lazy").setup(plugins)
