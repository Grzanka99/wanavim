local null_ls = require("null-ls")
local util = require "lspconfig".util

local sources = {}

for _, formatter in pairs(__.formatters) do
	if formatter.enabled then
		table.insert(sources, null_ls.builtins.formatting[formatter.name])
	end
end

for _, diagnoser in pairs(__.diagnostics) do
	if diagnoser.enabled then
		table.insert(sources, null_ls.builtins.diagnostics[diagnoser.name])
	end
end

require("null-ls").setup({
	sources = sources,
	root_dir = util.root_pattern(".null-ls-root", "Makefile", ".git", "node_modules", "tsconfig.json"),
})
