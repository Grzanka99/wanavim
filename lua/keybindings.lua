-- Better tabbing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines up/down
vim.keymap.set({ "v" }, "<M-j>", ":m'>+<CR>gv=gv")
vim.keymap.set({ "v" }, "<M-k>", ":m-2<CR>gv=gv")
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")

-- WINDOW / WORKSPACE NAVIAGATION AND MODIFICATION
-- Better window navigation

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Native LSP
vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")

-- usefull
vim.keymap.set("n", "<Leader>w", ":w<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "p", '"_dP') -- do not replace clipboard
