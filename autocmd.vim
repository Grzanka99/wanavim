autocmd BufWritePre * :%s/\s\+$//e

autocmd FocusGained * silen! checktime
