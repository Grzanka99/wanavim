return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		{ "j-hui/fidget.nvim", tag = "legacy" },
	},
	config = function()
		require("lspconfig").lua_ls.setup({})
		require("fidget").setup({})
	end,
}
