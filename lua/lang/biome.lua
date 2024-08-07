local capture_shell = require("utils.capture-shell")

local default_filetypes = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
	"vue",
}

local function disableForNonBiome()
	local isBiome = capture_shell('[ -f "biome.json" ] && echo 1 || echo 0')

	if tonumber(isBiome) > 0 then
		return false
	end

	return true
end

local function checkFileTypes()
	if disableForNonBiome() then
		return { "none" }
	end

	return default_filetypes
end

local function setup_function()
	if not disableForNonBiome() then
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end

	require("lspconfig").biome.setup({
		filetypes = checkFileTypes(),
	})
end

return setup_function
