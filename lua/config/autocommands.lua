local autoFormatters = {
    lsp = {
        prefix = "BufWritePre",
        filetypes = {"js", "ts", "jsx", "py", "c", "cpp", "vue"},
        command = "lua vim.lsp.buf.formatting_sync(nil, 100)"
    },
    neoformat = {
        prefix = "BufWritePre",
        filetypes = nil,
        command = "undojoin | Neoformat"
    }
}

local autoRealod = {
    autoreload = {
        prefix = "FocusGained",
        filetypes = nil,
        command = "silent! checktime"
    }
}

loadAutocommands(autoFormatters)
loadAutocommands(autoRealod)
