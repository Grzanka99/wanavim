vim.syntax_on = true
vim.opt.scrolloff = __.gui.scrolloff or 10
vim.opt.number = __.gui.numberLines or false
vim.opt.relativenumber = __.gui.relativeLineNumber or false

vim.opt.tabstop = __.codestyle.tab_size
vim.opt.softtabstop = __.codestyle.tab_size
vim.opt.shiftwidth = __.codestyle.tab_size
vim.opt.sw = __.codestyle.tab_size
vim.opt.ts = __.codestyle.tab_size
vim.opt.expandtab = __.codestyle.expandtab
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true

vim.opt.clipboard = "unnamedplus"
vim.opt.autoread = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = "a"
vim.opt.timeoutlen = 750
vim.opt.wrap = false
vim.opt.completeopt = "menuone,noselect"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.cmd("set undodir=$HOME/.config/nvim/undodir")
vim.language = __.language
vim.opt.ignorecase = true

vim.opt.swapfile = false;
vim.opt.hlsearch = false;
vim.opt.incsearch = true;
vim.opt.updatetime = 50;

vim.cmd("let g:nvcode_termcolors=256")
