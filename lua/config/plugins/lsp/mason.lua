local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local setup_handlers = require("config.plugins.lsp.lang")

mason.setup()

local function get_ensure_installed(settingsList, defaultList)
	local enabledList = {}

	defaultList = defaultList or {}
	for _, element in pairs(defaultList) do
		table.insert(enabledList, element)
	end

	for _, entity in pairs(settingsList) do
		if entity.enabled and not entity.noai then
			table.insert(enabledList, entity.name)
		end
	end

	return enabledList
end

mason_lspconfig.setup({
	ensure_installed = get_ensure_installed(__.lsp, { "lua_ls" }),
	automatic_installation = false,
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
	["cssls"] = setup_handlers.css,
	["html"] = setup_handlers.html,
	["tsserver"] = setup_handlers.typescript,
	["volar"] = setup_handlers.volar,
	["denols"] = setup_handlers.deno,
})
