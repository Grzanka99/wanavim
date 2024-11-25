local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	{ import = "config.colorscheme" },
	{ import = "config.lsp" },
	{ import = "config.neotree" },
	{ import = "config.treesitter" },
	{ import = "config.telescope" },
	{ import = "config.nvim-comment" },
	{ import = "config.harpoon" },
	{ import = "config.illuminate" },
	{ import = "config.gitsigns" },
	{ import = "config.lualine" },
	{ import = "config.bufferline" },
	{ import = "config.alpha" },
	{
		"folke/todo-comments.nvim",
		lazy = false,
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufEnter",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "BufEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{ "tpope/vim-sleuth" },
	{ "editorconfig/editorconfig-vim" },
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
	},
	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- Session management. This saves your session in the background,
	-- keeping track of open buffers, window arrangement, and more.
	-- You can restore sessions when returning through the dashboard.
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
	},
})
