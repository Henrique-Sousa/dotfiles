source ~/.exrc

set encoding=utf-8

set ruler
set colorcolumn=80
set bg=dark
set laststatus=2
"set relativenumber
set showcmd

set expandtab

set splitbelow
set splitright

set path+=**
set wildmenu
set tags=./tags,./TAGS,tags;~,TAGS;~

set incsearch
set hlsearch
set nowrapscan

set shortmess-=S

set smartindent
set foldmethod=indent
set foldlevelstart=20

set nrformats+=alpha

set hidden


syntax on


let g:markdown_fenced_languages = ['asm', 'c', 'cpp', 'java', 'python', 'javascript', 'typescript', 'php', 'ruby', 'perl', 'bash', 'sh', 'sed', 'awk', 'bc', 'vim', 'sql', 'html', 'xml', 'css', 'sass', 'less', 'lisp', 'scheme', 'haskell', 'dockerfile', 'yaml', 'json', 'tex', 'tmux', 'make', 'chuck']


imap jk <Esc>


autocmd BufRead * let &l:modifiable = !&readonly
autocmd FileType make setlocal noexpandtab
" hide errors for comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType json syntax match Comment +\/\*.\+\*\/+

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
