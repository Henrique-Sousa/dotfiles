vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Map go to open the file and immediately return to the quickfix window
    vim.api.nvim_buf_set_keymap(0, "n", "go", "<CR><c-w>p", { noremap = true, silent = true })
  end,
})
