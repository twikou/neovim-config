return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	config = function()
		require("bufferline").setup {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = {
					"no-italic"
				}
			})
		}
	end
}
