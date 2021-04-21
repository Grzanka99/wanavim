local utils = require("utils")

local autoFormatters = {
    lsp = {
        prefix = "BufWritePre",
        filetypes = {"*.js", "*.ts", "*.jsx", "*.py", "*.c", "*.cpp", "*.vue"},
        command = "lua vim.lsp.buf.formatting_sync(nil, 100)"
    },
    neoformat = {
        prefix = "BufWritePre",
        filetypes = nil,
        command = "undojoin | Neoformat"
    }
}

local autoRelaod = {
    autoreload = {
        prefix = "FocusGained",
        filetypes = nil,
        command = "silent! checktime"
    }
}

local dashboard = {
    lines = {
        prefix = "FileType",
        filetypes = {"DASHBOARD", "dashboard"},
        command = "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= "
    },
    tabline = {
        prefix = "FileType",
        filetypes = {"dashboard"},
        command = "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2"
    }
}

utils.loadAutocommands(autoFormatters)
utils.loadAutocommands(autoRelaod)
utils.loadAutocommands(dashboard)
