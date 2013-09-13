" Jimmy Thai's Linux dotfiles

" > 7.3
set relativenumber

" Scroll settings
set scrolloff=4

" Turn off swap
set noswapfile
set nowb
set nobackup

" Backspaces in insert mode
set backspace=indent,eol,start

" Indenting, no tab chars
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Reload files that are changed outside of vim
set autoread

" Show end of lines
set list
set listchars=eol:$ 

" No wrapping lines
set textwidth=80
set nowrap
set linebreak

" Autocompletion
set wildmode=list:longest
set wildmenu    " ctrln ctrlp

" Highlight search matches
set showmatch

" Misc
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
set laststatus=2
