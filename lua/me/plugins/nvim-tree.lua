local init = function()
	require("me.utils").explorer.open = function(path)
		vim.cmd("NvimTreeClose")
		vim.cmd("NvimTreeOpen " .. path)
		vim.cmd("lcd " .. path)
	end
end

local config = function()
	-- disable netrw
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("nvim-tree").setup {}
end

local cmd = {
	"NvimTreeOpen", "NvimTreeClose"
}

return {
	"nvim-tree/nvim-tree.lua",
	init = init,
	cmd = cmd,
	config = config,
	event = "VeryLazy",
}
