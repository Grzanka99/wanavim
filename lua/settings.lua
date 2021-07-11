-- List of languageservers that can be load by LSP and bool if enable
__.lsp = {
    {name = "lspinstall", enabled = false}, -- TODO:
    {name = "ts", enabled = true},
    {name = "css", enabled = true},
    {name = "vue", enabled = true},
    {name = "bash", enabled = true},
    {name = "clang", enabled = true},
    {name = "html", enabled = true},
    {name = "php", enabled = false}, -- php
    {name = "python", enabled = false},
    {name = "deno", enabled = false},
    {name = "lua", enabled = true},
    {name = "rust", enabled = false}
}

__.installedColorschemes = {
    {url = "christianchiarulli/nvcode-color-schemes.vim", enabled = true},
    {url = "glepnir/zephyr-nvim", enabled = false},
    {url = "folke/tokyonight.nvim", enabled = false},
    {url = "sainnhe/sonokai", enabled = false},
    {url = "sainnhe/edge", enabled = false}
}

-- Colorcheme configuration
vim.g.tokyonight_style = "day"
-- current word occurrences highlight
__.colorscheme = "lunar"

__.guifont = {
    name = "FiraCode Nerd Font",
    size = 14
}

__.language = "en_US.utf8"
