local utils = require("utils")

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	local path = value.uri
	if path == nil then
		path = value.targetUri
	end

	return string.match(path, "react/index.d.ts") == nil
end

local default_filetypes =
	{ "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }

local function disableForVueProject()
	local isCorrectProjectType = utils.captureShell('[ -f "package.json" ] && echo 1 || echo 0')

	if tonumber(isCorrectProjectType) == 0 then
		return true
	else
		local isVue = utils.captureShell("grep -cow vue package.json")
		if tonumber(isVue) and tonumber(isVue) > 0 then
			return true
		end
	end

	return false
end

local function disableForDenoProject()
	local isCorrectProjectType = utils.captureShell('[ -f "deno.jsonc" ] && echo 1 || echo 0')

	if tonumber(isCorrectProjectType) > 0 then
		return true
	else
		return false
	end
end

local function checkFileTypes()
	print(disableForDenoProject())
	if disableForVueProject() or disableForDenoProject() then
		return { "none" }
	end

	return default_filetypes
end

local function setup_function()
	require("lspconfig").tsserver.setup({
		filetypes = checkFileTypes(),
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsWithInsertText = true,
		},
		handlers = {
			["textDocument/definition"] = function(err, result, method, ...)
				if vim.tbl_islist(result) and #result > 1 then
					local filtered_result = filter(result, filterReactDTS)
					return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
				end

				vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
			end,
		},
	})
end

return setup_function
