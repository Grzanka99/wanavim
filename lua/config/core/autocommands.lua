local utils = require("utils")

local autoFormatters = {
	lsp = {
		prefix = "BufWritePre",
		filetypes = {
			"*.html",
			"*.js",
			"*.ts",
			"*.jsx",
			"*.tsx",
			"*.py",
			"*.c",
			"*.cpp",
			"*.vue",
			"*.lua",
			"*.scss",
			"*.css",
		},
		command = "lua vim.lsp.buf.formatting_seq_sync()",
	},
}

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
}

local folds = {
	autoUnfold = {
		prefix = "FileType",
		filetypes = { "*" },
		command = "normal zR",
	},
}

utils.loadAutocommands(autoFormatters)
utils.loadAutocommands(autoReload)
utils.loadAutocommands(dashboard)
-- utils.loadAutocommands(folds)
