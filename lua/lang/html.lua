local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_function()
	require("lspconfig").html.setup({
		capabilities = capabilities,
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end,
	})
end

return setup_function
