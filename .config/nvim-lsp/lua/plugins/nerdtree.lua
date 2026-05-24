return {
  "preservim/nerdtree",
  keys = {
    { "<leader>lf", "<cmd>NERDTreeFocus<cr>", desc = "NERDTree Focus" },
    { "<leader>ll", "<cmd>NERDTree<cr>", desc = "NERDTree Open" },
    { "<leader>lt", "<cmd>NERDTreeToggle<cr>", desc = "NERDTree Toggle" },
    { "<leader>lF", "<cmd>NERDTreeFind<cr>", desc = "NERDTree Find" },
  },
  init = function()
    -- The `init` function runs BEFORE the plugin is loaded.
    -- Traditional Vimscript plugins usually require global variables to be set prior to loading.
    vim.g.NERDTreeIgnore = { '^node_modules$' }
  end,
}
