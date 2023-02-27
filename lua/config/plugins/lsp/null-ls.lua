local null_ls = require("null-ls")
local util = require("lspconfig").util

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

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  sources = sources,
  root_dir = util.root_pattern(".null-ls-root", "Makefile", ".git", "node_modules", "tsconfig.json", ".eslintrc"),
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name ~= "tsserver"
            end,
          })
        end,
      })
    end
  end,
})
