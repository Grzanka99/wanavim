return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Lspsaga",
	keys = {
		{ "K", ":lua vim.lsp.buf.hover()<CR>" },
		{ "D", ":lua vim.diagnostic.open_float()<CR>" },
		{ "<Leader>da", ":Lspsaga code_action<CR>" },
		{ "<Leader>dr", ":Lspsaga rename<CR>" },
		{ "<Leader>dp", ":Lspsaga peek_definition<CR>" },
		{ "<Leader>df", ":Lspsaga finder<CR>" },
		{ "<Leader>o", ":Lspsaga outline<CR>" },
		{ "gd", ":Lspsaga goto_definition<CR>" },
	},
	config = function()
		require("lspsaga").setup({
			finder = {
				keys = {
					toggle_or_open = "<CR>",
				},
			},
			outline = {
				keys = {
					toggle_or_jump = "<CR>",
				},
			},
		})
	end,
}
