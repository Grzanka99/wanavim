require("lspconfig").tsserver.setup({
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
	preferences = {
		includeCompletionsForModuleExports = true,
		includeCompletionsWithInsertText = true,
	},
})
