vim.opt.statusline = '%<%F %h%w%m%r%=%-14.(%l/%L,%c%) %P'

vim.opt.encoding = 'utf-8'

vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.showcmd = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "fortran" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tsv",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.path:append '**' 
vim.opt.path:append '$HOME/notas/**'
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,full:noselect"
vim.opt.tags = './tags,./TAGS,tags;~,TAGS;~'

vim.opt.ignorecase = true
vim.opt.smartcase = true -- case sensitive search if the search pattern contains upper case characters
vim.opt.incsearch = true
vim.opt.hlsearch = true
-- vim.opt.nowrapscan = true

vim.opt.shortmess:remove 'S' -- show search count message when searching

vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 20

vim.opt.nrformats:append 'alpha'

vim.opt.hidden = true

vim.opt.formatoptions:append 'j'

--  vim.opt.spell = true
vim.opt.dictionary = '$XDG_STATE_HOME/dictionaries/br-utf8.txt'

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*",
  callback = function()
    vim.opt_local.modifiable = not vim.opt_local.readonly:get()
  end,
})

-- vim.g.markdown_fenced_languages  = {
--     'asm', 'c', 'cpp',
--     'java',
--     'basic',
--     'javascript', 'typescript', 'php', 'ruby', 'python',
--     'perl', 'bash', 'sh', 'sed', 'awk', 'bc',
--     'vim',
--     'tex', 'html', 'css', 'sass', 'less',
--     'sql',
--     'lisp', 'scheme', 'haskell',
--     'tmux', 'make', 'dockerfile', 'xml', 'yaml', 'json'
-- }

-- vim.cmd.colorscheme("vague")
