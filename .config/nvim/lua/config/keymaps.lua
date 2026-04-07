vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", ':q<CR>')
vim.keymap.set("n", "<leader>w", ':w<CR>')
vim.keymap.set("n", "<leader>n", ':bn<CR>')
vim.keymap.set("n", "<leader>p", ':bp<CR>')
vim.keymap.set("n", "<leader>h", ':noh<CR>')
-- vim.keymap.set("n", "<leader>cn", ':cn<CR>')
-- vim.keymap.set("n", "<leader>cp", ':cp<CR>')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Map go to open the file and immediately return to the quickfix window
    vim.api.nvim_buf_set_keymap(0, "n", "go", "<CR><c-w>p", { noremap = true, silent = true })
  end,
})
