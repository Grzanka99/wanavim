if (__.modules.lsp) then
    require("config.plugins.lsp")
    require("config.plugins.lspkind")

    require("lspsaga").init_lsp_saga()
end

if (__.modules.autocompletion and __.modules.lsp) then
    require("config.plugins.compe")
    require("config.plugins.vsnip")
end

if (__.modules.tree) then
    require("config.plugins.nvim-tree")
end

if (__.modules.advancedHighlitning) then
    require("config.plugins.treesitter")

    require("colorizer").setup()
    require("todo-comments").setup()
end

if (__.modules.diagnostic) then
    require("trouble").setup()
end

if (__.modules.searching) then
    require("config.plugins.telescope")
end

if (__.modules.terminal) then
    require("config.plugins.nvim-toggleterm")
end

if (__.modules.git) then
    require("config.plugins.gitsigns")
end

if (__.modules.autoFormating) then
    require("config.plugins.neoformat")
end

require("config.plugins.dashboard")
require("config.plugins.galaxyline")
require("config.plugins.nerdcommenter")
require("config.plugins.nvcode")
require("config.plugins.vim-rooter")
require("config.plugins.which-key")
-- require("config.plugins.dap")

-- Just loaders, without settings
