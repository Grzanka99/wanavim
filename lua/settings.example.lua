-- copy this file into lua/settings.lua

-- in this array, you decide which of hand-configured lsp servers
-- are enabled (lua/lang)
__.lsp = {
	{ name = "nvimlspinstaller", enabled = true },
	{ name = "css", enabled = true },
	{ name = "html", enabled = true },
	{ name = "lua", enabled = false },
	{ name = "typescript", enabled = true },
	{ name = "vue", enabled = true },
	{ name = "volar", enabled = false },
	{ name = "dart", enabled = false },
}

-- Enable/disable null-ls built-ins formatters
__.formatters = {
	{ name = "prettier", enabled = true },
	{ name = "stylua", enabled = true },
	{ name = "clang_format", enabled = false },
	{ name = "eslint_d", enabled = true },
	{ name = "trim_whitespace", enabled = true },
}

-- Enable/disable null-ls built-ins diagnostics
__.diagnostics = {
	{ name = "eslint_d", enabled = true },
	{ name = "shellcheck", enabled = true },
	{ name = "luacheck", enabled = false },
}

-- Additional colorschemes
__.installedColorschemes = {
	{ url = "christianchiarulli/nvcode-color-schemes.vim", enabled = true },
	{ url = "marko-cerovac/material.nvim", enabled = true },
}

__.treesitter = {
	{ name = "javascriptreact", enabled = true },
	{ name = "javascript", enabled = true },
	{ name = "typescript", enabled = true },
	{ name = "typescriptreact", enabled = true },
	{ name = "css", enabled = true },
	{ name = "html", enabled = true },
	{ name = "lua", enabled = true },
	{ name = "vue", enabled = true },
	{ name = "scss", enabled = true },
}

-- set colorscheme
__.colorscheme = "material"
vim.g.material_style = "deep ocean"

-- set guifont
__.guifont = {
	name = "FiraCode Nerd Font",
	size = 12,
}

__.codestyle = {
	tab_size = 2,
	expandtab = true,
}
-- Set lang
__.language = "en_US.utf8"
