vim9script

# Clipboard (sync with macOS system clipboard)
set clipboard=unnamed

# Terminal colors
set termguicolors
set background=dark

# Syntax highlighting
syntax on
colorscheme retrobox

# Command line completion
set wildmenu
set wildmode=longest:full,full
set wildignorecase

# Sign column
set signcolumn=yes

# Cursor positioning
set scrolloff=8
set sidescrolloff=15

# Split appearance
set fillchars=vert:\|,fold:\

# Status line
set laststatus=3
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %p%%

# Folding
set foldmethod=indent
set foldlevel=99
