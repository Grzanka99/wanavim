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
        use "kabouzeid/nvim-lspinstall" -- autoinstall for some

        -- Autocomplete
        use "hrsh7th/nvim-compe" -- completion client
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/vim-vsnip-integ"
        use "rafamadriz/friendly-snippets" -- some snippets set
        use "ChristianChiarulli/html-snippets" -- some snippets set

        -- Debugger

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "nvim-treesitter/nvim-treesitter-refactor"
        use "nvim-treesitter/playground"
        use "p00f/nvim-ts-rainbow"
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "windwp/nvim-ts-autotag"

        -- Icons
        use "kyazdani42/nvim-web-devicons" -- for file icons

        -- Explorer
        use "kyazdani42/nvim-tree.lua" -- sidebar tree

        -- Telescope (searching)
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"

        -- Status line and bufferline
        use "itchyny/lightline.vim"
        -- use 'romgrk/barbar.nvim' -- crash with nvim-tree

        -- Colors
        use "christianchiarulli/nvcode-color-schemes.vim"
        use "glepnir/zephyr-nvim"

        -- Git
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
        use "tpope/vim-fugitive"
        use "itchyny/vim-gitbranch"

        -- Autoformatters
        use "editorconfig/editorconfig-vim"
        -- use 'prettier/vim-prettier'
        use "sbdchd/neoformat"

        -- Other
        use "preservim/nerdcommenter"
        use "mhinz/vim-startify"
        use "airblade/vim-rooter"
    end
)
