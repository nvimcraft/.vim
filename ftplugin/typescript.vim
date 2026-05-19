vim9script

# TypeScript filetype settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

# Format with prettier if available, otherwise Vim indent
if executable('prettier')
  nnoremap <buffer> <leader>fmt :silent execute '%!prettier --stdin-filepath ' .. shellescape(expand('%'))<CR>
else
  nnoremap <buffer> <leader>fm gg=G<C-o>
endif
