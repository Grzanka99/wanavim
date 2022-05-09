local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local function get_typescript_server_path(root_dir)
-- 	local project_root = util.find_node_modules_ancestor(root_dir)
--
-- 	local local_tsserverlib = project_root ~= nil
-- 		and util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js")
-- 	local global_tsserverlib = "/usr/lib/node_modules/typescript/lib/tsserverlibrary.js"
--
-- 	if local_tsserverlib and util.path.exists(local_tsserverlib) then
-- 		return local_tsserverlib
-- 	else
-- 		return global_tsserverlib
-- 	end
-- end
--
local function get_typescript_server_path(root_dir)
	local project_root = util.find_node_modules_ancestor(root_dir)

	local local_tsserverlib = project_root ~= nil
		and util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js")
	local global_tsserverlib = "/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib/tsserverlibrary.js"

	if local_tsserverlib and util.path.exists(local_tsserverlib) then
		return local_tsserverlib
	else
		return global_tsserverlib
	end
end

require("lspconfig").volar.setup({
	filetypes = { "vue" },
	cmd = { "vue-language-server", "--stdio" },
	init_options = {
		documentFeatures = {
			documentFormatting = false,
		},
	},
	config = {
		on_new_config = function(new_config, new_root_dir)
			new_config.resolved_capabilities.document_formatting = false
			new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
		end,
	},
})
