local sources = function(cmp)
	return cmp.config.sources({
		{ name = "luasnip" }
	}, {
		{ name = "buffer" },
		{ name = "path" }
	})
end

local mapping = function(cmp)
	return cmp.mapping.preset.insert({})
end

local snippet = function(luasnip)
	return {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	}
end

local formatting = function(lspkind)
	return {
		format = lspkind.cmp_format({})
	}
end

local window = function(cmp)
	opts = {
		border = "single"
	}
	return {
		completion = cmp.config.window.bordered(opts),
		documentation = cmp.config.window.bordered(opts),
	}
end

local setup = function(cmp, luasnip, lspkind)
	cmp.setup({
		snippet = snippet(luasnip),
		mapping = mapping(cmp),
		sources = sources(cmp),
		formatting = formatting(lspkind),
		window = window(cmp),
	})
end

local setup_cmdline = function(cmp)
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

local config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")
	setup(cmp, luasnip, lspkind)
	setup_cmdline(cmp)
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind.nvim"
	},
	event = "InsertEnter",
	name = "cmp",
	config = config,
}
