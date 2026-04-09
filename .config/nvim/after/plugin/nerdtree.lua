vim.keymap.set('n', '<leader>nf', vim.cmd.NERDTreeFocus, { noremap = true })
vim.keymap.set('n', '<leader>l', vim.cmd.NERDTree, { noremap = true })
vim.keymap.set('n', '<leader>nt', vim.cmd.NERDTreeToggle, { noremap = true })
vim.keymap.set('n', '<leader>nF', vim.cmd.NERDTreeFind , { noremap = true })

vim.g.NERDTreeIgnore = { '^node_modules$' }
