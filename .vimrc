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

let g:markdown_fenced_languages = ['asm', 'c', 'java', 'python', 'javascript', 'php', 'bash', 'sh', 'sed', 'awk', 'bc', 'sql', 'html', 'xml', 'css', 'sass', 'less', 'lisp', 'scheme', 'dockerfile']

let mapleader = " "
map <leader>z :setlocal paste!<cr>
map <silent> <leader><cr> :noh<cr>
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

"to avoid ctrl + arrow or alt + arrow delete lines
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
