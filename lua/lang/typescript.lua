require("lspconfig").tsserver.setup({
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	preferences = {
		includeCompletionsForModuleExports = true,
		includeCompletionsWithInsertText = true,
	},
})
