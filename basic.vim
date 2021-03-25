syntax enable
set number relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent
set copyindent
set clipboard+=unnamedplus
set autoread
set nobackup
set nowritebackup
set cursorline
set splitbelow
set splitright
set mouse=a
set encoding=utf-8
set updatetime=300
set timeoutlen=100
set wrap nowrap

set completeopt=menuone,noselect

" undo after close buffer
set undodir=$HOME/.config/nvim/undodir
set undofile

if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif
