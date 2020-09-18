if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'

"colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'TomNomNom/xoria256.vim'

call plug#end()

"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

color xoria256

set bg=dark 
hi DiffAdd ctermbg=151 "green for add
hi DiffDelete ctermbg=181 "red for delete
hi DiffChange ctermbg=246 "grey for change
hi DiffText ctermbg=253

map <C-_> :call NERDComment(0,"toggle")<CR>

"disable automatic comment insertion when inserting blank lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set number
set ruler

set tabstop=4
set shiftwidth=4
"set softtabstop=4
set expandtab
"set smarttab

set splitbelow
set splitright

command! ToggleWhitespace call ToggleWhitespace()
function! ToggleWhitespace()
  if &listchars != 'space:_,tab:>~'
    set listchars=space:_,tab:>~ list
  else
    set listchars=""
  endif
endfunction

set cindent

set path+=**
set wildmenu

set ignorecase
set incsearch
set hlsearch
set shortmess-=S "show search count message when searching, e.g. [1/5]
"hi Search ctermbg=blue
"hi Search ctermfg=black

"hi MatchParen cterm=none ctermbg=gray ctermfg=black

"hi DiffAdd ctermfg=black
"hi DiffChange ctermfg=black 
"hi DiffText ctermfg=white

set autoindent
set smartindent

set foldmethod=indent
set foldlevelstart=20
"set foldtext=''
"hi Folded ctermbg=black
"hi Folded ctermfg=gray

set nrformats+=alpha  "includes alphabetic characters when increasing or decreasing numbers


let mapleader = " "

"set pastetoggle=<leader>z
map <leader>z :setlocal paste!<cr>

map <silent> <leader><cr> :noh<cr>

inoremap jk <ESC>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>

nmap <S-Left> :tabm -1<CR>
nmap <S-Right> :tabm +1<CR>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" resize horzontal split window
"nmap <C-Left> <C-W><
"nmap <C-Right> <C-W>>
" resize vertical split window
"nmap <C-Up> <C-W>-
"nmap <C-Down> <C-W>+

"nmap <S-Left> 5<C-w>< 
"nmap <S-Right> 5<C-w>>
"nmap <S-Up> 5<C-w>-
"nmap <S-Down> 5<C-w>+

"-----------------------


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"noremap <BS> <Nop>
"noremap <Del> <Nop:>

"noremap <Tab> <Esc>
"inoremap <Tab> <Esc>
"noremap <C-I> <Tab>
"inoremap <C-I> <Tab>

"to avoid ctrl + arrow or alt + arrow delete lines
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
        
"noremap <C-Left> <Nop>
"noremap <C-Right> <Nop>
"noremap <C-Up> <Nop>
"noremap <C-Down> <Nop>

inoremap <C-Left> <Nop>
inoremap <C-Right> <Nop>
inoremap <C-Up> <Nop>
inoremap <C-Down> <Nop>

"noremap <S-Left> <Nop>
"noremap <S-Right> <Nop>
"noremap <S-Up> <Nop>
"noremap <S-Down> <Nop>

inoremap <S-Left> <Nop>
inoremap <S-Right> <Nop>
inoremap <S-Up> <Nop>
inoremap <S-Down> <Nop>

noremap <M-Left> <Nop>
noremap <M-Right> <Nop>
noremap <M-Up> <Nop>
noremap <M-Down> <Nop>

inoremap <M-Left> <Nop>
inoremap <M-Right> <Nop>
inoremap <M-Up> <Nop>
inoremap <M-Down> <Nop>

noremap <End> <Nop>
noremap <Home> <Nop>
inoremap <End> <Nop>
inoremap <Home> <Nop>

