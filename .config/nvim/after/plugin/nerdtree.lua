vim.keymap.set('n', '<leader>lf', vim.cmd.NERDTreeFocus, { noremap = true })
vim.keymap.set('n', '<leader>ll', vim.cmd.NERDTree, { noremap = true })
vim.keymap.set('n', '<leader>lt', vim.cmd.NERDTreeToggle, { noremap = true })
vim.keymap.set('n', '<leader>lF', vim.cmd.NERDTreeFind , { noremap = true })

vim.g.NERDTreeIgnore = { '^node_modules$' }
