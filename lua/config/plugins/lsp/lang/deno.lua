local utils = require("utils");

local default_filetypes = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
}

local function disableForNonDenoProject()
  local isDenoProject = utils.captureShell('[ -f "deno.jsonc" ] && echo 1 || echo 0')

  if tonumber(isDenoProject) then
    return 0
  end

  return 1
end

local function checkFileTypes()
  if disableForNonDenoProject() then
    return {"none"}
  end

  return default_filetypes;
end

local function setup_function()
	require("lspconfig").denols.setup({
	  filetypes = checkFileTypes()
	})
end

return setup_function
