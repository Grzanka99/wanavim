" Keybindings

" comments
nnoremap                  <M-c>       :call NERDComment(0,"toggle")<CR>
vnoremap                  <M-c>       :call NERDComment(0,"toggle")<CR>

" Beter tabbing
vnoremap                  <           <gv
vnoremap                  >           >gv

" Move lines up/down
nnoremap                  <A-j>       :m .+1<CR>==
nnoremap                  <A-k>       :m .-2<CR>==
inoremap                  <A-j>       <Esc>:m .+1<CR>==gi
inoremap                  <A-k>       <Esc>:m .-2<CR>==gi
vnoremap                  <A-j>       :m '>+1<CR>gv=gv
vnoremap                  <A-k>       :m '<-2<CR>gv=gv

nnoremap                  <A-down>    :m .+1<CR>==
nnoremap                  <A-up>      :m .-2<CR>==
inoremap                  <A-down>    <Esc>:m .+1<CR>==gi
inoremap                  <A-up>      <Esc>:m .-2<CR>==gi
vnoremap                  <A-down>    :m '>+1<CR>gv=gv
vnoremap                  <A-up>      :m '<-2<CR>gv=gv

" Telescope
map       <M-f>     :Telescope<CR>
map       <M-b>     :Telescope buffers<CR>
nnoremap  <M-g>     :Telescope fd<CR>

" WINDOW / WORKSPACE NAVIGATION AND MODIFICATION
"Better window navigation
nnoremap  <C-h>     <C-w>h
nnoremap  <C-j>     <C-w>j
nnoremap  <C-k>     <C-w>k
nnoremap  <C-l>     <C-w>l

nnoremap  <C-left>  <C-w>h
nnoremap  <C-down>  <C-w>j
nnoremap  <C-up>    <C-w>k
nnoremap  <C-right> <C-w>l

nnoremap  <C-TAB>   :tabnext<CR>
nnoremap  <C-S-TAB> :tabprevious<CR>

" NATIVE LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <M-a> <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" NvimTree
nnoremap <M-space> :NvimTreeToggle<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
