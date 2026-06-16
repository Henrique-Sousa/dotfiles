return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end,
  config = function()
    vim.g.vimtex_format_enabled = 1

    vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "LaTeX: Compile" })
    vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", { desc = "LaTeX: View PDF" })
  end
}
