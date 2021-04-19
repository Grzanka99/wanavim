require("plugins")

-- base configuration
require("config.nvim")
require("config.colors")
require("config.gui")

-- configuration funcion loaders
require("utils")

-- plugins config
require("config.lsp")
require("config.compe")
require("config.lspsaga")
require("config.lspkind")
require("config.telescope")
require("config.treesitter")
require("config.vim-rooter")
require("config.nvim-tree")
require("config.gitsigns")
require("config.neoformat")
require("config.nvcode")
require("config.nerd")
require("config.galaxyline")
require("config.vsnip")
require("config.autocommands")

vim.cmd("source $HOME/.config/nvim/partials/keys.partial.vim")
vim.cmd("source $HOME/.config/nvim/autocmd.vim")

-- list of preconfigured languages and is their enabled
PRECONFIGURED_LANGUAGES = {
    {name = "lspinstall", enabled = false}, -- todo
    {name = "ts", enabled = true},
    {name = "css", enabled = true},
    {name = "vue", enabled = true},
    {name = "bash", enabled = true},
    {name = "clang", enabled = true},
    {name = "html", enabled = true},
    {name = "php", enabled = true}, -- php
    {name = "python", enabled = true},
    {name = "deno", enabled = false},
    {name = "lua", enabled = true}
}

loadLanguages(PRECONFIGURED_LANGUAGES)
