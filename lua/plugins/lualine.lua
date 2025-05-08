return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			component_separators = {
				left = "",
				right = "",
			},
			section_separators = {
				left = "",
				right = "",
			}
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(val)
						return val:sub(1,1)
					end
				}
			}
		}
	}
}
