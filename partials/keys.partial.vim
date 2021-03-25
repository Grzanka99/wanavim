" Keybindings

" PROJECT NAVIGATION
" map                       <M-space>   :CocCommand explorer<CR>
" map                       <M-a>       :CocAction <CR>
" map                       <M-\>       <Plug>(coc-terminal-toggle)
" inoremap  <silent><expr>  <c-space>   coc#refresh()

" Code navigation / manipulation
" Remap keys for gotos
" nmap      <silent>        gd          <Plug>(coc-definition)
" nmap      <silent>        gy          <Plug>(coc-type-definition)
" nmap      <silent>        gi          <Plug>(coc-implementation)
" nmap      <silent>        gr          <Plug>(coc-refecences)

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

"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr>   <TAB>       pumvisible() ? "\<C-n>" :
                                    \ <SID>check_back_space() ? "\<Tab>" :
                                    \ coc#refresh()

" FZF
map       <M-f>     :Files<CR>
map       <M-b>     :Buffers<CR>
nnoremap  <M-g>     :Rg<CR>

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

" Use alt + shift + hjkl to resize window <dont use so disable>
" nnoremap <M-S-j> :resize -2<CR>
" nnoremap <M-S-k> :resize +2<CR>
" nnoremap <M-S-h> :vertical resize -2<CR>
" nnoremap <M-S-l> :vertical resize +2<CR>


" NATIVE LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
