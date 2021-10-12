local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.clang_format,
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.whitespace,
	null_ls.builtins.diagnostics.eslint_d,
	-- null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.diagnostics.shellcheck,
}

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup({
	-- see the nvim-lspconfig documentation for available configuration options
	on_attach = my_custom_on_attach,
})
