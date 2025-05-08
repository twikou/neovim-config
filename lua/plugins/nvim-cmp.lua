local sources = function(cmp)
	return cmp.config.sources({
		{ name = "luasnip" }
	}, {
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		{ name = "path" }
	})
end

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local mapping = function(cmp, luasnip)
	return cmp.mapping.preset.insert({
		['<tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				-- tab to confirm
				cmp.confirm({ select = true })
			elseif luasnip.locally_jumpable(1) then
				-- tab to jump next placeholder
				luasnip.jump(1)
			elseif has_words_before() then
				-- tab to show completion
				cmp.complete()
				if #cmp.get_entries() == 1 then
					cmp.confirm({ select = true })
				end
			else
				fallback()
			end
		end, { "i", "s", "c" }),
		["<s-tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	})
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
		mapping = mapping(cmp, luasnip),
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
	event = "VeryLazy",
	name = "cmp",
	config = config,
}
