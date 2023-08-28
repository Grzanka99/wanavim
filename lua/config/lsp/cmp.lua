return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Required
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_action = require("utils/cmp-actions")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-j>"] = cmp_action.tab_complete(),
				["<C-k>"] = cmp_action.select_prev_or_fallback(),
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<C-Space>"] = cmp.mapping.complete(),
			},
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local short_name = {
						nvim_lsp = "LSP",
						nvim_lua = "nvim",
					}

					local menu_name = short_name[entry.source.name] or entry.source.name

					item.menu = string.format("[%s]", menu_name)
					return item
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnim" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
