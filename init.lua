__ = {
	gui = {
		numberLines = true,
		relativeLineNumber = false,
		scrolloff = 8,
		allowTransparency = false,
	},
	codestyle = {
		tab_size = 2,
		expandtab = true,
	},
	lsp = {
		{ name = "tsserver", enabled = true },
	},
	formatters = {},
	diagnostics = {},
	treesitter = {},
}

require("base")
require("plugins")
require("keybindings")
require("config/config")
