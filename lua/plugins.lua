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
	use("tami5/lspsaga.nvim") -- Floating info
	use("ahmedkhalf/lsp-rooter.nvim")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("j-hui/fidget.nvim")
	use("editorconfig/editorconfig-vim")

	-- Autocomplete

	-- nvim-cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- snippets
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- treesitter
	use("ray-x/cmp-treesitter")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("Grzanka99/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	-- suggestions
	use("ray-x/lsp_signature.nvim") -- inline suggestions while typing

	-- Debugger / Diagnostics
	use("folke/trouble.nvim")

	-- Icons
	use("kyazdani42/nvim-web-devicons") -- for file icons

	-- Explorer
	use("kyazdani42/nvim-tree.lua") -- sidebar tree

	-- Telescope (searching)
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Status line and bufferline
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim")

	-- Git
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("tpope/vim-fugitive")

	-- Other
	use("windwp/nvim-autopairs")
	use("terrortylor/nvim-comment")
	use("ChristianChiarulli/dashboard-nvim")
	use("folke/todo-comments.nvim")
	use("norcalli/nvim-colorizer.lua") -- in-text colors
	use("lukas-reineke/indent-blankline.nvim")

	-- Colors
	for _, colorscheme in pairs(__.installedColorschemes) do
		if colorscheme.enabled then
			use(colorscheme.url)
		end
	end
end)
