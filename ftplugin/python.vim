vim9script

# Python filetype settings
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal textwidth=79
setlocal formatoptions=tcqro

# Format with black if available, otherwise Vim indent
if executable('black')
  nnoremap <buffer> <leader>fmt :silent execute '%!black -q -'<CR>
else
  nnoremap <buffer> <leader>fm gg=G<C-o>
endif
