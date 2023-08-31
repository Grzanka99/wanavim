return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		{ "j-hui/fidget.nvim", tag = "legacy" },
	},
	config = function()
		require("lspconfig").lua_ls.setup({})

		for _, entity in pairs(__.lsp) do
			if entity.noai then
				require("lspconfig")[entity.name].setup({})
			end
		end

		require("fidget").setup({})
	end,
}
