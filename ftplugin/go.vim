vim9script

# Go filetype settings
setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal softtabstop=0

# Format with gofmt if available, otherwise Vim indent
if executable('gofmt')
  nnoremap <buffer> <leader>fm :silent execute '%!gofmt'<CR>
else
  nnoremap <buffer> <leader>fm gg=G<C-o>
endif
