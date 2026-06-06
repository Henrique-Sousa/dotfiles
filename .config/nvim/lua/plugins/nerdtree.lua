return {
  "preservim/nerdtree",
  dependencies = {
    "ryanoasis/vim-devicons",
    "Xuyuanp/nerdtree-git-plugin",
    "tiagofumo/vim-nerdtree-syntax-highlight",
  },
  keys = {
    -- { "<leader>lf", "<cmd>NERDTreeFocus<cr>", desc = "NERDTree Focus" },
    -- { "<leader>ll", "<cmd>NERDTree<cr>", desc = "NERDTree Open" },
    { "<leader>et", "<cmd>NERDTreeToggle<cr>", desc = "NERDTree Toggle" },
    { "<leader>ef", "<cmd>NERDTreeFind<cr>", desc = "NERDTree Find" },
    { "<leader>nt", "<cmd>NERDTreeToggle<cr>", desc = "NERDTree Toggle" },
    { "<leader>nf", "<cmd>NERDTreeFind<cr>", desc = "NERDTree Find" },
    { "<leader>lt", "<cmd>NERDTreeToggle<cr>", desc = "NERDTree Toggle" },
    { "<leader>lf", "<cmd>NERDTreeFind<cr>", desc = "NERDTree Find" },
    { "<leader>tf", "<cmd>NERDTreeFind<cr>", desc = "NERDTree Find" },
    -- ou <leader>n ou <leader>t ou <leader>l
  },
  init = function()
    -- The `init` function runs BEFORE the plugin is loaded.
    -- Traditional Vimscript plugins usually require global variables to be set prior to loading.
    vim.g.NERDTreeIgnore = { '^node_modules$' }
  end,
}
