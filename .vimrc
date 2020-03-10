set number
set ruler
set tabstop=4
set shiftwidth=4

set path+=**
set wildmenu

set ignorecase
set incsearch
set hlsearch
hi Search ctermbg=blue
hi Search ctermfg=black

hi MatchParen cterm=none ctermbg=gray ctermfg=black

hi DiffAdd ctermfg=black
hi DiffChange ctermfg=black 
hi DiffText ctermfg=white

set autoindent
set smartindent

set foldmethod=indent
set foldtext=''
set foldlevelstart=20
hi Folded ctermbg=black
hi Folded ctermfg=gray

inoremap jk <ESC>

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





"Vundle Plugins
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

"colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"Nerdree settings
"autocmd vimenter * NERDTree
nmap <C-n> :NERDTreeToggle<CR> 

"Color scheme
colorscheme	gruvbox
set bg=dark

"Vim airline
let g:airline_powerline_fonts = 1

	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	let g:airline_symbols.space = "\ua0"
	" unicode symbols
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
