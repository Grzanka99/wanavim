require("config.plugins.lsp.lsp")
-- require("config.plugins.lsp.cmp")
require("config.plugins.lsp.mason")
require("config.plugins.lsp.null-ls")
require("config.plugins.lsp.lspsaga")
require("config.plugins.lsp.project")

require("lsp_signature").setup()
require("fidget").setup({})

vim.g.coq_settings = {
	auto_start = true,
	keymap = {
		jump_to_mark = "null",
	},
}
