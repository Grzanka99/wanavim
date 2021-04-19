luafile $HOME/.config/nvim/plugins.lua

" Load confifs
luafile $HOME/.config/nvim/configs/lsp.config.lua
luafile $HOME/.config/nvim/configs/compe.config.lua
luafile $HOME/.config/nvim/configs/lspkind.config.lua
luafile $HOME/.config/nvim/configs/telescope.config.lua
luafile $HOME/.config/nvim/configs/lspsaga.config.lua
luafile $HOME/.config/nvim/configs/treesitter.config.lua
luafile $HOME/.config/nvim/configs/vim-rooter.config.lua
luafile $HOME/.config/nvim/configs/nvim-tree.config.lua
luafile $HOME/.config/nvim/configs/gitsigns.config.lua
luafile $HOME/.config/nvim/configs/neoformat.config.lua
luafile $HOME/.config/nvim/configs/nvcode.config.lua
luafile $HOME/.config/nvim/configs/gui.config.lua
luafile $HOME/.config/nvim/configs/nerd.config.lua
luafile $HOME/.config/nvim/configs/galaxyline.config.lua
luafile $HOME/.config/nvim/configs/vsnip.config.lua

" Load another basic settings and keybindings
source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/partials/keys.partial.vim
source $HOME/.config/nvim/autocmd.vim

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
luafile $HOME/.config/nvim/lang/lua.lang.lua

colorscheme lunar
