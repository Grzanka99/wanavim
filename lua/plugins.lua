local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require("packer").init({display = {auto_clean = false}})

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- LSP
        use "neovim/nvim-lspconfig" -- lsp config
        use "glepnir/lspsaga.nvim" -- Floating info
        use "onsails/lspkind-nvim"
        use {
            "ahmedkhalf/lsp-rooter.nvim",
            config = function()
                require("lsp-rooter").setup {}
            end
        }
        use "kabouzeid/nvim-lspinstall" -- idk how to configure it with regular lsp langs

        -- Autocomplete
        use "hrsh7th/nvim-compe" -- completion client
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/vim-vsnip-integ"
        use "rafamadriz/friendly-snippets" -- some snippets set
        use "ChristianChiarulli/html-snippets" -- some snippets set

        -- Debugger / Diagnostics
        use "folke/trouble.nvim"
        -- use "Pocco81/DAPInstall.nvim"
        -- use "mfussenegger/nvim-dap"

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "p00f/nvim-ts-rainbow"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "windwp/nvim-ts-autotag"

        -- Icons
        use "kyazdani42/nvim-web-devicons" -- for file icons

        -- Explorer
        use "kyazdani42/nvim-tree.lua" -- sidebar tree
        use "simrat39/symbols-outline.nvim"

        -- Telescope (searching)
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"

        -- Status line and bufferline
        use "glepnir/galaxyline.nvim"
        use "romgrk/barbar.nvim"

        -- Colors
        for _, colorscheme in pairs(__.installedColorschemes) do
            if (colorscheme.enabled) then
                use(colorscheme.url)
            end
        end

        -- Git
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
        use "tpope/vim-fugitive"
        use "itchyny/vim-gitbranch"
        use "sindrets/diffview.nvim"

        -- Autoformatters
        use "editorconfig/editorconfig-vim"
        use "sbdchd/neoformat"

        -- Other
        use "ChristianChiarulli/dashboard-nvim"
        use "akinsho/nvim-toggleterm.lua"
        use "folke/todo-comments.nvim"
        use "folke/which-key.nvim"
        use "norcalli/nvim-colorizer.lua" -- in-text colors
        use "Grzanka99/nvim-cursorline"

        -- Testing and TODO
        -- https://github.com/windwp/nvim-spectre
        -- https://github.com/mhartington/formatter.nvim
    end
)
