set relativenumber

" Turn off swap
set noswapfile
set nowb
set nobackup

" Backspaces in insert mode
set backspace=indent,eol,start

" Indenting, no tab chars
set shiftwidth=2
set softtabstop=2
set expandtab

" Reload files that are changed outside of vim
set autoread

" Show end of lines
set list
set listchars=eol:$

" Highlight search matches
set showmatch

" Misc
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
syntax on
filetype plugin on

" OSX C-c and C-x
vmap <C-x> :!reattach-to-user-namespace pbcopy<CR>
vmap <C-c> :w !reattach-to-user-namespace pbcopy<CR><CR>

" Improve the display of line wraps
set showbreak=↪

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
