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
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- { "jose-elias-alvarez/null-ls.nvim" },
			-- { "jay-babu/mason-null-ls.nvim" },
			{ "j-hui/fidget.nvim", tag = "legacy" },
			{ "nvimdev/lspsaga.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	use("ahmedkhalf/project.nvim")
	use("editorconfig/editorconfig-vim")
	use("RRethy/vim-illuminate")
	use("tpope/vim-sleuth")

	-- treesitter
	use("ray-x/cmp-treesitter")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")

	-- Debugger / Diagnostics
	--

	use("mhartington/formatter.nvim")
	use("mfussenegger/nvim-lint")

	-- Icons
	use("kyazdani42/nvim-web-devicons") -- for file icons

	-- Explorer
	use("kyazdani42/nvim-tree.lua") -- sidebar tree

	-- Telescope (searching)
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("ThePrimeagen/harpoon")

	-- Status line and bufferline
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim")

	-- Git
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "NeogitOrg/neogit", requires = "nvim-lua/plenary.nvim" })
	use("sindrets/diffview.nvim")

	-- Other
	use("windwp/nvim-autopairs")
	use("terrortylor/nvim-comment")
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use("folke/todo-comments.nvim")
	use("norcalli/nvim-colorizer.lua") -- in-text colors
	use("lukas-reineke/indent-blankline.nvim")

	-- Navigation

	-- Colors
	for _, colorscheme in pairs(__.installedColorschemes) do
		if colorscheme.enabled then
			use(colorscheme.url)
		end
	end
end)
