-- Map helper function, can get array of modes and also has some defaults
local function map(modes, keymap, cmd, opt)
	opt = opt or {}

	opt.noremap = opt.noremap or true
	opt.silent = opt.noremap or true

	if type(modes) == "string" then
		vim.api.nvim_set_keymap(modes, keymap, cmd, opt)
		return true
	end

	for _, mode in pairs(modes) do
		vim.api.nvim_set_keymap(mode, keymap, cmd, opt)
	end

	return true
end

vim.g.mapleader = " "

-- comments
map({ "n", "v" }, "<Leader>c", ":CommentToggle<CR>", { noremap = true, silent = true })
map({ "n", "v" }, "<M-c>", ":CommentToggle<CR>", { noremap = true, silent = true })

-- Better tabbing
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines up/down
map({ "v" }, "<M-j>", ":m'>+<CR>gv=gv")
map({ "v" }, "<M-k>", ":m-2<CR>gv=gv")
map("n", "<M-j>", ":m .+1<CR>==")
map("n", "<M-k>", ":m .-2<CR>==")

-- Telescope (searching)
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fs", ":Telescope lsp_document_symbols<CR>")
map("n", "<Leader>fh", ":Telescope harpoon marks<CR>")
map("n", "<Leader>dt", ":Telescope diagnostics<CR>")

-- WINDOW / WORKSPACE NAVIAGATION AND MODIFICATION
-- Better window navigation

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<M-.>", ":BufferNext<CR>")
map("n", "<M-,>", ":BufferPrevious<CR>")
map("n", "<M-/>", ":BufferClose<CR>")

-- Native LSP
map("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")

-- NvimTree
map("n", "<Leader>e", ":NvimTreeToggle<CR>")
map("n", "<M-Space>", ":NvimTreeToggle<CR>")

-- LSPSaga
map("n", "K", ":Lspsaga hover_doc<CR>")
map("n", "D", ":Lspsaga show_line_diagnostics<CR>")
map("n", "<Leader>da", ":Lspsaga code_action<CR>")
map("n", "<Leader>dr", ":Lspsaga rename<CR>")
map("n", "<Leader>dp", ":Lspsaga peek_definition<CR>")
map("n", "<Leader>df", ":Lspsaga finder<CR>")
map("n", "<Leader>o", ":Lspsaga outline<CR>")
map("n", "gd", ":Lspsaga goto_definition<CR>")

map("n", "<Leader>gh", ":Gitsigns preview_hunk_inline<CR>")

-- usefull
map("n", "<Leader>w", ":w<CR>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("x", "p", '"_dP') -- do not replace clipboard

-- harpoon

map("n", "<Leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
map("n", "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
map("n", "<M-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
map("n", "<M-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
map("n", "<M-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
map("n", "<M-4>", ":lua require('harpoon.ui').nav_file(4)<CR>")
map("n", "<M-5>", ":lua require('harpoon.ui').nav_file(5)<CR>")
