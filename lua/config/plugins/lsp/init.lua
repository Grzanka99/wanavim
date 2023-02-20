require("config.plugins.lsp.lsp");
require("config.plugins.lsp.cmp");
require("config.plugins.lsp.mason");
require("config.plugins.lsp.null-ls");


require("lsp-rooter").setup({})
require("lspsaga").init_lsp_saga()
require("lsp_signature").setup()
require("fidget").setup({})
