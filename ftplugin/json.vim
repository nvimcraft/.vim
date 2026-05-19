vim9script

# JSON filetype settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

# Format with python json.tool or jq if available, otherwise Vim indent
if executable('python3')
  nnoremap <buffer> <leader>fmt :silent execute '%!python3 -m json.tool'<CR>
elseif executable('jq')
  nnoremap <buffer> <leader>fmt :silent execute '%!jq .'<CR>
else
  nnoremap <buffer> <leader>fm gg=G<C-o>
endif
