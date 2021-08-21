source ~/.exrc

set ruler
set bg=dark
set laststatus=2
set expandtab
set tabstop=2
set shiftwidth=2
set splitbelow
set splitright
set path+=**
set wildmenu
set incsearch
set hlsearch
set shortmess-=S
set autoindent
set smartindent
set foldmethod=indent
set foldlevelstart=20
set nrformats+=alpha

let g:markdown_fenced_languages = ['asm', 'c', 'java', 'python', 'javascript', 'php', 'bash', 'sh', 'sed', 'awk', 'bc', 'sql', 'html', 'xml', 'css', 'sass', 'less', 'lisp', 'scheme', 'dockerfile']

imap jk <Esc>

autocmd BufRead * let &l:modifiable = !&readonly
autocmd FileType make setlocal noexpandtab

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
call plug#end()
