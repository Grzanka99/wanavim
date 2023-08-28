return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
	  require("lspconfig").lua_ls.setup({})
  end
}
