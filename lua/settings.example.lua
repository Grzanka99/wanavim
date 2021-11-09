__.lsp = {
	{ name = "lspinstall", enabled = true },
	{ name = "css", enabled = true },
	{ name = "html", enabled = true },
	{ name = "lua", enabled = false },
	{ name = "typescript", enabled = true },
	{ name = "vue", enabled = false },
	{ name = "volar", enabled = false },
	{ name = "dart", enabled = false },
}

__.formatters = {
	{ name = "prettier", enabled = true },
	{ name = "stylua", enabled = true },
	{ name = "clang_format", enabled = false },
	{ name = "eslint_d", enabled = true },
	{ name = "trim_whitespace", enabled = true },
}

__.diagnostics = {
	{ name = "eslint_d", enabled = true },
	{ name = "shellcheck", enabled = true },
	{ name = "luacheck", enabled = false },
}

__.installedColorschemes = {
	{ url = "christianchiarulli/nvcode-color-schemes.vim", enabled = true },
	{ url = "marko-cerovac/material.nvim", enabled = true },
}

__.colorscheme = "material"
vim.g.material_style = "deep ocean"

__.guifont = {
	name = "FiraCode Nerd Font",
	size = 12,
}

__.language = "en_US.utf8"
