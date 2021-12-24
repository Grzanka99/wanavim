local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer = require("packer")

-- vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

packer.init({ display = { auto_clean = false } })

return packer.startup(function(use)
	-- Packer can manage itself as an optional plugin
	use("wbthomason/packer.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- lsp config
	use({ "tami5/lspsaga.nvim", branch = "nvim6.0" }) -- Floating info
	use("onsails/lspkind-nvim")
	use("ahmedkhalf/lsp-rooter.nvim")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Autocomplete
	--
	use("github/copilot.vim")

	-- nvim-cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")

	-- For vsnip users.
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("ray-x/cmp-treesitter")
	use("ray-x/lsp_signature.nvim")

	use("rafamadriz/friendly-snippets") -- some snippets set
	use("ChristianChiarulli/html-snippets") -- some snippets set

	-- Debugger / Diagnostics
	use("folke/trouble.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("Grzanka99/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")

	-- Icons
	use("kyazdani42/nvim-web-devicons") -- for file icons

	-- Explorer
	use("kyazdani42/nvim-tree.lua") -- sidebar tree
	use("simrat39/symbols-outline.nvim")

	-- Telescope (searching)
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Status line and bufferline
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim")

	-- Colors
	for _, colorscheme in pairs(__.installedColorschemes) do
		if colorscheme.enabled then
			use(colorscheme.url)
		end
	end

	-- Git
	use({ "Grzanka99/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")

	-- Autoformatters
	use("editorconfig/editorconfig-vim")

	-- Other
	use("windwp/nvim-autopairs") -- i gonna use it for now, maybe remove later
	use("terrortylor/nvim-comment")
	use("ChristianChiarulli/dashboard-nvim")
	use("akinsho/nvim-toggleterm.lua")
	use("folke/todo-comments.nvim")
	use("norcalli/nvim-colorizer.lua") -- in-text colors
	use("Grzanka99/nvim-cursorline")
end)
