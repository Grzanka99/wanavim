local null_ls = require("null-ls")

local sources = {
  -- null_ls.builtins.formatting.prettier,
  -- null_ls.builtins.formatting.stylua,
  -- null_ls.builtins.formatting.clang_format,
  -- null_ls.builtins.formatting.eslint_d,
  -- null_ls.builtins.formatting.whitespace,
  -- null_ls.builtins.diagnostics.eslint_d,
  -- null_ls.builtins.diagnostics.luacheck,
  -- null_ls.builtins.diagnostics.shellcheck,
}

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

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup({
	-- see the nvim-lspconfig documentation for available configuration options
	on_attach = my_custom_on_attach,
})
