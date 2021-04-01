" plug.config.vim MUST BE first
" source $HOME/.config/nvim/configs/plug.config.vim
luafile $HOME/.config/nvim/configs/packer.config.lua
source $HOME/.config/nvim/configs/lsp.config.vim

" Load confifs
luafile $HOME/.config/nvim/configs/compe.config.lua
luafile $HOME/.config/nvim/configs/lspkind.config.lua
luafile $HOME/.config/nvim/configs/telescope.config.lua
luafile $HOME/.config/nvim/configs/lspsaga.config.lua
luafile $HOME/.config/nvim/configs/treesitter.config.lua
luafile $HOME/.config/nvim/configs/vim-rooter.config.lua
luafile $HOME/.config/nvim/configs/nvim-tree.config.lua

source $HOME/.config/nvim/configs/gui.config.vim
source $HOME/.config/nvim/configs/nerd.config.vim
source $HOME/.config/nvim/configs/nvcode.config.vim
source $HOME/.config/nvim/configs/blamer.config.vim
source $HOME/.config/nvim/configs/prettier.config.vim
source $HOME/.config/nvim/configs/lightline.config.vim
source $HOME/.config/nvim/configs/vsnip.config.vim

" Load another basic settings and keybindings
source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/partials/keys.partial.vim

" lang load
luafile $HOME/.config/nvim/lang/ts.lang.lua
luafile $HOME/.config/nvim/lang/css.lang.lua
luafile $HOME/.config/nvim/lang/vue.lang.lua
luafile $HOME/.config/nvim/lang/bash.lang.lua
luafile $HOME/.config/nvim/lang/clang.lang.lua
luafile $HOME/.config/nvim/lang/html.lang.lua
luafile $HOME/.config/nvim/lang/intelephense.lang.lua
luafile $HOME/.config/nvim/lang/python.lang.lua
luafile $HOME/.config/nvim/lang/deno.lang.lua

colorscheme onedark
