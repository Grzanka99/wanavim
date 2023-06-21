vim.o.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")

local conf = {
	kind_icons = {
		Class = " ",
		Color = " ",
		Constant = "ﲀ ",
		Constructor = " ",
		Enum = "練",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = "",
		Folder = " ",
		Function = " ",
		Interface = "ﰮ ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Operator = "",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = "塞",
		Value = " ",
		Variable = " ",
	},
	source_names = {
		nvim_lsp = "(LSP)",
		emoji = "(Emoji)",
		path = "(Path)",
		calc = "(Calc)",
		vsnip = "(Snippet)",
		luasnip = "(Snippet)",
		buffer = "(Buffer)",
	},
	duplicates = {
		buffer = 0,
		path = 0,
		nvim_lsp = 0,
		luasnip = 0,
	},
	duplicates_default = 0,
}

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		-- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		-- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		-- ["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-TAB>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "treesitter" },
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		-- kind_icons = conf.kind_icons,
		source_icons = conf.source_names,
		duplicates = conf.duplicates,
		duplicates_default = conf.duplicates_default,
		format = function(entry, vim_item)
			vim_item.kind = conf.kind_icons[vim_item.kind]
			vim_item.menu = conf.source_names[entry.source.name]
			vim_item.dup = conf.duplicates[entry.source.name] or conf.duplicates_default
			return vim_item
		end,
	},
	window = {
		documentation = {
			border = { "⌜", " ", "⌝", " ", "⌟", " ", "⌞", " " },
		},
	},
})
