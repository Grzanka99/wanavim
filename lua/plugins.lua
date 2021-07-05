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
        if (__.modules.lsp) then
            use "neovim/nvim-lspconfig" -- lsp config
            use "glepnir/lspsaga.nvim" -- Floating info
            use "onsails/lspkind-nvim"
            use "kabouzeid/nvim-lspinstall" -- idk how to configure it with regular lsp langs
        end

        -- Autocomplete
        if (__.modules.lsp and __.modules.autocompletion) then
            use "hrsh7th/nvim-compe" -- completion client
            use "hrsh7th/vim-vsnip"
            use "hrsh7th/vim-vsnip-integ"
            use "rafamadriz/friendly-snippets" -- some snippets set
            use "ChristianChiarulli/html-snippets" -- some snippets set
        end

        -- Debugger / Diagnostics
        if (__.modules.diagnostic) then
            use "folke/trouble.nvim"
        -- use "Pocco81/DAPInstall.nvim"
        -- use "mfussenegger/nvim-dap"
        end

        -- Treesitter
        if (__.modules.advancedHighlitning) then
            use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
            use "nvim-treesitter/nvim-treesitter-refactor"
            use "nvim-treesitter/playground"
            use "p00f/nvim-ts-rainbow"
            use "JoosepAlviste/nvim-ts-context-commentstring"
            use "windwp/nvim-ts-autotag"
            use "folke/todo-comments.nvim"
            use "norcalli/nvim-colorizer.lua" -- in-text colors
        end

        -- Icons
        use "kyazdani42/nvim-web-devicons" -- for file icons

        -- Explorer
        use {"kyazdani42/nvim-tree.lua", disable = not __.modules.tree} -- sidebar tree

        -- Telescope (searching)
        if (__.modules.searching) then
            use "nvim-lua/popup.nvim"
            use "nvim-lua/plenary.nvim"
            use "nvim-telescope/telescope.nvim"
            use "nvim-telescope/telescope-media-files.nvim"
        end

        -- Status line and bufferline
        use "glepnir/galaxyline.nvim"
        use {"romgrk/barbar.nvim", disable = not __.modules.topbars}

        -- Colors
        for _, colorscheme in pairs(__.installedColorschemes) do
            if (colorscheme.enabled) then
                use(colorscheme.url)
            end
        end

        -- Git
        if __.modules.git then
            use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
            use "tpope/vim-fugitive"
            use "itchyny/vim-gitbranch"
        end

        -- Autoformatters
        if __.modules.autoFormating then
            use "editorconfig/editorconfig-vim"
            use "sbdchd/neoformat"
        end

        -- Other
        use "preservim/nerdcommenter"
        use "ChristianChiarulli/dashboard-nvim"
        use "airblade/vim-rooter"
        use {"akinsho/nvim-toggleterm.lua", disable = not __.modules.terminal}
        use "folke/which-key.nvim"

        -- Testing
    end
)
