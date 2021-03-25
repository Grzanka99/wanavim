" plug.config.vim MUST BE first
source $HOME/.config/nvim/configs/plug.config.vim

source $HOME/.config/nvim/configs/lsp.config.vim
luafile $HOME/.config/nvim/configs/compe.config.lua

" source $HOME/.config/nvim/configs/coc.config.vim
source $HOME/.config/nvim/configs/gui.config.vim
source $HOME/.config/nvim/configs/fzf.config.vim
source $HOME/.config/nvim/configs/nerd.config.vim
source $HOME/.config/nvim/configs/nvcode.config.vim
source $HOME/.config/nvim/configs/blamer.config.vim
source $HOME/.config/nvim/configs/rustfmt.config.vim
source $HOME/.config/nvim/configs/prettier.config.vim
source $HOME/.config/nvim/configs/lightline.config.vim
source $HOME/.config/nvim/configs/nvim-tree.config.vim

source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/partials/keys.partial.vim

" lang load
luafile $HOME/.config/nvim/lang/ts.lang.lua
luafile $HOME/.config/nvim/lang/css.lang.lua
luafile $HOME/.config/nvim/lang/vue.lang.lua
luafile $HOME/.config/nvim/lang/bash.lang.lua

colorscheme onedark
