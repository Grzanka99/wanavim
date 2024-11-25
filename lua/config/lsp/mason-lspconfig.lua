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

return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = get_ensure_installed(__.lsp, { "lua_ls" }),
			automatic_installation = false,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["cssls"] = require("lang.css"),
			["html"] = require("lang.html"),
			["tsserver"] = require("lang.typescript"),
			["volar"] = function() end,
			["denols"] = require("lang.deno"),
			["biome"] = require("lang.biome"),
		})
	end,
}
