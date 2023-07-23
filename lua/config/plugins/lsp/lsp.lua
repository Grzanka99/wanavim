vim.diagnostic.config({
	virtual_text = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

for _, entity in pairs(__.lsp) do
	if entity.noai then
		require("lspconfig")[entity.name].setup({})
	end
end
