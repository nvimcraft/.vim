vim9script

# Prevent loading twice
if exists('g:loaded_vimrc')
  finish
endif
g:loaded_vimrc = true

# Ensure required directories exist
for dir in [$HOME .. '/.vim/backup', $HOME .. '/.vim/swap', $HOME .. '/.vim/undo']
  if !isdirectory(dir)
    mkdir(dir, 'p')
  endif
endfor

# Core settings
source $HOME/.vim/general.vim

# Filetype detection and plugins
# must be before options that depend on it
filetype on
filetype plugin on
filetype indent on

# Vim options
source $HOME/.vim/ui.vim

# Editing behavior
source $HOME/.vim/editing.vim

# Key mappings
source $HOME/.vim/mapping.vim
