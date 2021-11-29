source ~/.exrc

set ruler
set bg=dark
set laststatus=2
set expandtab
set splitbelow
set splitright
set path+=**
set wildmenu
set incsearch
set hlsearch
set shortmess-=S
set smartindent
set foldmethod=indent
set foldlevelstart=20
set nrformats+=alpha
set hidden

let g:markdown_fenced_languages = ['asm', 'c', 'cpp', 'java', 'python', 'javascript', 'typescript', 'php', 'perl', 'bash', 'sh', 'sed', 'awk', 'bc', 'vim', 'sql', 'html', 'xml', 'css', 'sass', 'less', 'lisp', 'scheme', 'haskell', 'dockerfile', 'yaml', 'json']

imap jk <Esc>

autocmd BufRead * let &l:modifiable = !&readonly
autocmd FileType make setlocal noexpandtab
" hide errors for comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType json syntax match Comment +\/\*.\+\*\/+

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim'
call plug#end()

colorscheme gruvbox

let g:coc_global_extensions = [ 'coc-tsserver' ]

hi CocFloating ctermbg=darkgray
hi FgCocErrorFloatBgCocFloating ctermfg=white ctermbg=darkgray

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gR <Plug>(coc-references)
