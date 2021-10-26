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
map({ "n", "v" }, "<M-j>", ":m .+1<CR>==")
map({ "n", "v" }, "<M-k>", ":m .-2<CR>==")
map("i", "<M-j>", "<Esc>:m .+1<CR>==")
map("i", "<M-k>", "<Esc>:m .-2<CR>==")

map({ "n", "v" }, "<M-down>", ":m .+1<CR>==")
map({ "n", "v" }, "<M-up>", ":m .-2<CR>==")
map("i", "<M-down>", "<Esc>:m .+1<CR>==")
map("i", "<M-up>", "<Esc>:m .-2<CR>==")

-- Telescope (searching)
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fg", ":Telescope fd<CR>")

-- WINDOW / WORKSPACE NAVIAGATION AND MODIFICATION
-- Better window navigation

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<M-.>", ":BufferNext<CR>")
map("n", "<M-,>", ":BufferPrevious<CR>")
map("n", "<M-/>", ":BufferClose<CR>")

-- Folding
-- map({ "n", "v" }, "")

-- Native LSP
map("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "<Leader>gr", ":Trouble lsp_references<CR>")
map("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<Leader>da", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
-- map("n", "<Leader>dd", "<cmd>lua require('lspsaga.provider').preview_definition()<CR>")
map("n", "<Leader>dr", "<cmd>lua require('lspsaga.rename').rename()<CR>")
map("n", "<Leader>dt", ":TroubleToggle<CR>")
map("n", "<Leader>di", ":Trouble lsp_workspace_diagnostics<CR>")

-- NvimTree
map("n", "<Leader>e", ":NvimTreeToggle<CR>")
map("n", "<M-Space>", ":NvimTreeToggle<CR>")

map("n", "<Leader>o", ":SymbolsOutline<CR>")

-- Terminal
map("n", "<Leader>t", ":ToggleTerm<CR>")

-- completion, codeinfo
-- map("i", "<C-Space>", "compe#complete()", { expr = true })
-- map("i", "<CR>", "compe#confirm('<CR>')", { expr = true })
map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
map("n", "D", ":Lspsaga show_line_diagnostics<CR>")
-- map({ "i", "s" }, "<Tab>", "v:lua.tab_complete()", { expr = true })
-- map({ "i", "s" }, "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
-- usefull
map("n", "<Leader>w", ":w<CR>")
