vim.g.mapleader = " "

-- comments
vim.keymap.set({ "n", "v" }, "<Leader>c", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<M-c>", ":CommentToggle<CR>", { noremap = true, silent = true })

-- Better tabbing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines up/down
vim.keymap.set({ "v" }, "<M-j>", ":m'>+<CR>gv=gv")
vim.keymap.set({ "v" }, "<M-k>", ":m-2<CR>gv=gv")
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")

-- Telescope (searching)
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>fs", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<Leader>fh", ":Telescope harpoon marks<CR>")
vim.keymap.set("n", "<Leader>dt", ":Telescope diagnostics<CR>")

-- WINDOW / WORKSPACE NAVIAGATION AND MODIFICATION
-- Better window navigation

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<M-.>", ":BufferNext<CR>")
vim.keymap.set("n", "<M-,>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<M-/>", ":BufferClose<CR>")

-- Native LSP
vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")

-- NvimTree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<M-Space>", ":NvimTreeToggle<CR>")

-- LSPSaga
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>")
vim.keymap.set("n", "D", ":Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "<Leader>da", ":Lspsaga code_action<CR>")
vim.keymap.set("n", "<Leader>dr", ":Lspsaga rename<CR>")
vim.keymap.set("n", "<Leader>dp", ":Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<Leader>df", ":Lspsaga finder<CR>")
vim.keymap.set("n", "<Leader>o", ":Lspsaga outline<CR>")
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>")

vim.keymap.set("n", "<Leader>gh", ":Gitsigns preview_hunk_inline<CR>")

-- usefull
vim.keymap.set("n", "<Leader>w", ":w<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "p", '"_dP') -- do not replace clipboard

-- harpoon

vim.keymap.set("n", "<Leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<M-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set("n", "<M-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set("n", "<M-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set("n", "<M-4>", ":lua require('harpoon.ui').nav_file(4)<CR>")
vim.keymap.set("n", "<M-5>", ":lua require('harpoon.ui').nav_file(5)<CR>")
