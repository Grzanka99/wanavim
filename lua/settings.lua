-- List of languageservers that can be load by LSP and bool if enable
__.lsp = {
    {name = "lspinstall", enabled = true}, -- TODO:
    {name = "css", enabled = true},
    {name = "html", enabled = true},
    {name = "lua", enabled = true},
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
__.colorscheme = "onedark"

__.guifont = {
    name = "FiraCode Nerd Font",
    size = 12
}

__.language = "en_US.utf8"
