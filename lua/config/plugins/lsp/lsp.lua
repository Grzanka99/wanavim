local utils = require("utils")

-- utils.loadLanguages(__.lsp)
--
vim.diagnostic.config({
	virtual_text = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})
