local config = function()
	require("nvim-web-devicons").set_icon({
		xml = {
			icon = "",
			color = "#e37933",
			cterm_color = "173",
			name = "Xml",
		}
	})
end

return {
	"nvim-tree/nvim-web-devicons",
	config = config,
	lazy = true,
	event = "VeryLazy",
}
