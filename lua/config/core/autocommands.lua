local utils = require("utils")

local autoReload = {
	autoreload = {
		prefix = "FocusGained",
		filetypes = nil,
		command = "silent! checktime",
	},
}

local killEslintD = {
	killEslintD = {
		prefix = "BufDelete",
		filetypes = { "*" },
		command = "silent exec '!eslint_d stop'",
	},
}

utils.loadAutocommands(autoReload)
-- utils.loadAutocommands(killEslintD)
