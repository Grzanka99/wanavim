__.lsp = {
	{ name = "tsserver", enabled = true },
	{ name = "volar", enabled = true },
	{ name = "denols", enabled = true },
}

__.formatters = {
	{ name = "deno_fmt", enabled = true },
	{ name = "prettierd", enabled = true },
	{ name = "eslint", enabled = false },
	{ name = "stylua", enabled = true },
	{ name = "clang_format", enabled = false },
}

__.diagnostics = {
	{ name = "cspell", enabled = false },
	{ name = "eslint_d", enabled = true },
	{ name = "luacheck", enabled = false },
}

__.installedColorschemes = {
	{ url = "catppuccin/nvim", enabled = true },
}

__.treesitter = {
	{ name = "javascript", enabled = true },
	{ name = "typescript", enabled = true },
	{ name = "css", enabled = true },
	{ name = "html", enabled = true },
	{ name = "lua", enabled = true },
	{ name = "vue", enabled = true },
	{ name = "scss", enabled = true },
	{ name = "rust", enabled = true },
}

__.colorscheme = "catppuccin-mocha"

__.gui = {
	font = {
		name = "FiraCode Nerd Font",
		size = 12,
	},
	numberLines = true,
	relativeLineNumber = false,
	scrolloff = 8,
	allowTransparency = false,
}

__.codestyle = {
	tab_size = 2,
	expandtab = true,
}

__.language = "en_US.utf8"
