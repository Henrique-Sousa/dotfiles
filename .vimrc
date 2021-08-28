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

imap jk <Esc>

autocmd BufRead * let &l:modifiable = !&readonly
autocmd FileType make setlocal noexpandtab

if &term =~ '^screen'
  " to avoid ctrl + arrow or alt + arrow delete lines while using tmux
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " disable case-changing command to fix esc-esc-pagedown misbehavior.
  map ~ <Nop>
endif

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
call plug#end()
