vim.syntax_on = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.cmd("set sw=2")
vim.cmd("set ts=2")
vim.o.smarttab = true
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.copyindent = true
vim.o.clipboard = "unnamedplus"
vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.wo.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "a"
vim.o.timeoutlen = 750
vim.wo.wrap = false
vim.o.completeopt = "menuone,noselect"
vim.o.undofile = true
vim.cmd("set undodir=$HOME/.config/nvim/undodir")
vim.o.termguicolors = true