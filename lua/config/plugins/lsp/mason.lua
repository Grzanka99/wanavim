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
		-- NOTE: rustfmt now must be installed via rustup
		if entity.enabled and (entity.name ~= "rustfmt") then
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

function table.merge(t1, t2)
	for _, v in ipairs(t2) do
		table.insert(t1, v)
	end

	return t1
end

require("mason-null-ls").setup({
	ensure_installed = get_ensure_installed(table.merge(__.formatters, __.diagnostics)),
	automatic_installation = false,
})
