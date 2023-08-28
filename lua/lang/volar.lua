local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capture_shell = require("utils.capture-shell")
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function get_typescript_server_path(root_dir)
	local project_root = util.find_node_modules_ancestor(root_dir)

	local local_tsserverlib = project_root ~= nil
		and util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js")
	local global_tsserverlib = "~/.npm/lib/node_modules/typescript/lib/tsserverlibrary.js"

	if local_tsserverlib and util.path.exists(local_tsserverlib) then
		return local_tsserverlib
	else
		return global_tsserverlib
	end
end

local function detectVueProjectAndControllTakeoverMode()
	local isCorrectProjectType = capture_shell('[ -f "package.json" ] && echo 1 || echo 0')

	if not tonumber(isCorrectProjectType) then
		return { "vue" }
	else
		local isVue = capture_shell("grep -cow vue package.json")
		if tonumber(isVue) and tonumber(isVue) > 0 then
			return { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
		end
	end

	return { "vue" }
end

local function setup_function()
	require("lspconfig").volar.setup({
		filetypes = detectVueProjectAndControllTakeoverMode(),
		cmd = { "vue-language-server", "--stdio" },
		init_options = {
			documentFeatures = {
				documentFormatting = false,
			},
		},
		config = {
			on_new_config = function(new_config, new_root_dir)
				new_config.server_capabilities.document_formatting = false
				new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
			end,
		},
	})
end

return setup_function
