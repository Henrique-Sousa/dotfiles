return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gs", vim.cmd.Git, desc = "Git" },
    -- { "<leader>gs", "<cmd>Git status<cr>", desc = "Git status" },
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff split (vertical)" },
    { "<leader>gh", "<cmd>Ghdiffsplit<cr>", desc = "Git diff split (horizontal)" },
    { "<leader>ga", "<cmd>Git add %<cr>", desc = "Git add current file" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
  },
}
