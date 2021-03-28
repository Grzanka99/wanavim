call plug#begin('~/.config/nvim/plugins')

" completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" native lsp
Plug 'neovim/nvim-lspconfig' " lsp config
Plug 'hrsh7th/nvim-compe' " completion client
Plug 'glepnir/lspsaga.nvim' " Floating info
Plug 'onsails/lspkind-nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " sidebar tree
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'mhinz/vim-startify'

" Themes
" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" TODO https://github.com/romgrk/barbar.nvim
