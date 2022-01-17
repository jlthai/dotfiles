" Turn off swap
set noswapfile
set nowb
set nobackup

" Numbers
set relativenumber
set number
set numberwidth=5

" Better window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

set history=200
set ruler
set showcmd

" Make it obvious where 80 chars is
set textwidth=80
set colorcolumn=+1

" Undo even after file closes
if has('persistent_undo')
  set undofile
  set undodir^=~/.vim/tmp//,~/Library/Vim/undo
endif

iabbrev bpry require 'pry'; binding.pry;

" Split the screen to the right and down
set splitright
set splitbelow

" Open file's current directory
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" Crosshair
set cursorcolumn
set cursorline


call plug#begin()
Plug 'elixir-editors/vim-elixir'
Plug 'ggandor/lightspeed.nvim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/gem-browse'
Plug 'vim-ruby/vim-ruby'
call plug#end()
