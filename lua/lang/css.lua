-- npm install -g vscode-css-languageserver-bin

require "lspconfig".cssls.setup {
    cmd = {"css-languageserver", "--stdio"}
}
