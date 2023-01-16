local utils = require("utils")

local autoReload = {
	autoreload = {
		prefix = "FocusGained",
		filetypes = nil,
		command = "silent! checktime",
	},
}

local dashboard = {
	lines = {
		prefix = "FileType",
		filetypes = { "DASHBOARD", "dashboard" },
		command = "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
	},
	tabline = {
		prefix = "FileType",
		filetypes = { "dashboard" },
		command = "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2",
	},
	indentBlankline = {
		prefix = "FileType",
		filetypes = { "dashboard" },
		command = "silent IndentBlanklineDisable",
	},
}

local folds = {
	autoUnfold = {
		prefix = "FileType",
		filetypes = { "*" },
		command = "normal zR",
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
utils.loadAutocommands(dashboard)
utils.loadAutocommands(killEslintD)
-- utils.loadAutocommands(folds) -- testing
