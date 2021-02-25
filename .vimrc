set number
set ruler
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright
set path+=**
set wildmenu
set ignorecase
set incsearch
set hlsearch
set shortmess-=S
set autoindent
set foldmethod=indent
set foldlevelstart=20
set nrformats+=alpha

let mapleader = " "
map <leader>z :setlocal paste!<cr>
map <silent> <leader><cr> :noh<cr>
imap jk <ESC>
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
