local capture_shell = require("utils.capture-shell")

local default_filetypes = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
}

local function disableForNonDenoProject()
	local isDenoProject = capture_shell('[ -f "deno.jsonc" ] && echo 1 || echo 0')

	if tonumber(isDenoProject) > 0 then
		return false
	end

	return true
end

local function checkFileTypes()
	if disableForNonDenoProject() then
		return { "none" }
	end

	return default_filetypes
end

local function setup_function()
	require("lspconfig").denols.setup({
		filetypes = checkFileTypes(),
	})
end

return setup_function
