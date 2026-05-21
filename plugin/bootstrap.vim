vim9script

var plugin_dir = expand('~/.vim/plugged')

def Ensure(repo: string)
  var name = split(repo, '/')[-1]
  var path = plugin_dir .. '/' .. name

  if !isdirectory(path)
    if !isdirectory(plugin_dir)
      mkdir(plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' .. repo .. ' ' .. shellescape(path)
  endif

  execute 'set runtimepath+=' .. fnameescape(path)

  var plugin_glob = path .. '/plugin/*.vim'
  for plugin_script in glob(plugin_glob, true, true)
    execute 'source ' .. fnameescape(plugin_script)
  endfor
enddef

Ensure('junegunn/fzf')
Ensure('junegunn/fzf.vim')
Ensure('tpope/vim-surround')
Ensure('tpope/vim-fugitive')
Ensure('airblade/vim-gitgutter')
Ensure('jiangmiao/auto-pairs')
Ensure('christoomey/vim-tmux-navigator')
