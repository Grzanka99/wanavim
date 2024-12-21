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
		{ name = "ts_ls", enabled = true },
	},
	formatters = {},
	diagnostics = {},
	treesitter = {},
}

require("settings")
require("base")
require("plugins")
require("keybindings")
require("config/config")
