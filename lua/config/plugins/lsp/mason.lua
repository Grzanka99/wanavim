local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local setup_handlers = require("config.plugins.lsp.lang")

mason.setup()

local function get_ensure_installed()
	local enabledList = {}
	for _, lang in pairs(__.lsp) do
		if lang.enabled then
			table.insert(enabledList, lang.name)
		end
	end

	return enabledList
end

mason_lspconfig.setup({
	ensure_installed = get_ensure_installed(),
	automatic_installation = false,
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
	-- ["cssls"] = setup_handlers.css,
	-- ["html"] = setup_handlers.html,
	["tsserver"] = setup_handlers.typescript,
	-- ["volar"] = setup_handlers.volar,
	["denols"] = setup_handlers.deno,
})

require("mason-null-ls").setup({
	ensure_installed = { "prettier", "eslint", "deno_fmt" },
})
