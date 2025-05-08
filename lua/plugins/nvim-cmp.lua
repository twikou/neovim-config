return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline"
	},
	event = "InsertEnter",
	name = "cmp",
	config = function()
		local cmp = require("cmp")
		local snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
		}
		local mapping = cmp.mapping.preset.insert({})
		local sources = cmp.config.sources({
			{ name = "luasnip" }
		}, {
			{ name = "buffer" },
			{ name = "path" }
		})
		cmp.setup({
			snippet = snippet,
			mapping = mapping,
			sources = sources,
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			}),
			matching = { disallow_symbol_nonprefix_matching = false }
		})
	end
}
