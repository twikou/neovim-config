return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		highlight = {
			enable = true,
			disable = function(lang, buf) -- disable if file size larger than 100kb
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		additional_vim_regex_highlighting = false,
	},
	config = function(opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}
