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

" Folding
" This is a semi-customized fold method
set foldmethod=expr
set foldexpr=GetPotionFold(v:lnum)
set foldtext=getline(v:foldstart)
set fillchars=fold:\ "(a space)
set foldlevel=99
" The below autocmd's causes it to chagne foldmethod when changing modes, which causes it to re-evalue :)
" http://stackoverflow.com/questions/21280457/stop-vim-from-dynamically-updating-folds
autocmd InsertLeave,WinEnter * setlocal foldmethod=expr
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual
augroup vimrc_autocmds
autocmd BufEnter * highlight Folded gui=NONE " should turn off underlining of folds
" autocmd BufEnter * highlight Folded ctermbg=236 ctermfg=214 " sets the background and foreground colors for folds (good for dark themes)
" autocmd BufEnter * highlight Folded ctermbg=252 ctermfg=235 " sets the background and foreground colors for folds (good for light themes)
" Possible color pallets: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" autocmd BufEnter * highlight Folded guibg=#404040 guifg=#d9d9d9
augroup END
function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1
    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif
        let current += 1
    endwhile
    return -2
endfunction
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction

execute pathogen#infect()
