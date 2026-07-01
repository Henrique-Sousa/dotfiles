vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>qq", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })

-- vim.keymap.set("n", "<leader>ww", "<C-w><C-w>", { desc = "Window change" })

vim.keymap.set("n", "<leader>bn", ':bn<CR>')
vim.keymap.set("n", "<leader>bp", ':bp<CR>')
vim.keymap.set("n", "<leader>h", ':noh<CR>')
vim.keymap.set("n", "<leader>cn", ':cn<CR>')
vim.keymap.set("n", "<leader>cp", ':cp<CR>')

vim.keymap.set("n", "-", '<C-W>-')
vim.keymap.set("n", "+", '<C-W>+')
vim.keymap.set("n", "<M->>", '<C-W>>')
vim.keymap.set("n", "<M-<>", '<C-W><')

-- vim.keymap.set('n', '<leader>=', function()
--   local view = vim.fn.winsaveview()
--   vim.cmd("keepjumps normal! gg=G")
--   vim.fn.winrestview(view)
-- end, { desc = "Format entire file without moving cursor/scroll" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Map go to open the file and immediately return to the quickfix window
    -- so that I can just preview the errors in each file without leaving quickfix list
    vim.api.nvim_buf_set_keymap(0, "n", "go", "<CR><c-w>p", { noremap = true, silent = true, desc = "Quickfix preview"})
  end,
})
