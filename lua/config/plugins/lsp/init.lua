require("config.plugins.lsp.lsp")
require("config.plugins.lsp.mason")
require("config.plugins.lsp.null-ls")
require("config.plugins.lsp.lspsaga")
require("config.plugins.lsp.project")
require("fidget").setup({})

local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = {
		set_sources = "recommended",
	},
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-j>"] = cmp_action.tab_complete(),
		["<C-k>"] = cmp_action.select_prev_or_fallback(),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
	},
})
