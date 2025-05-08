return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	config = function()
		require("bufferline").setup({
			options = {
				custom_filter = function(buf, _)
					if vim.bo[buf].filetype == "terminal" then
						return false
					end
					return true
				end
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = {
					"no-italic"
				}
			}),
		})
	end
}
