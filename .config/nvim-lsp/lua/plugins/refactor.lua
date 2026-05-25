return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {}, -- This automatically handles require('refactoring').setup({})
  keys = {
    {
      "<leader>rf",
      function() return require('refactoring').refactor('extract function') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Extract function"
    },
    {
      "<leader>rff",
      function() return require('refactoring').refactor('extract function to file') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Extract function to file"
    },
    {
      "<leader>rv",
      function() return require('refactoring').refactor('extract variable') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Extract variable"
    },
    {
      "<leader>rif",
      function() return require('refactoring').refactor('inline function') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Inline function"
    },
    {
      "<leader>riv",
      function() return require('refactoring').refactor('inline variable') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Inline variable"
    },
    {
      "<leader>rb",
      function() return require('refactoring').refactor('extract block') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Extract block"
    },
    {
      "<leader>rbf",
      function() return require('refactoring').refactor('extract block to file') end,
      mode = { "n", "x" },
      expr = true,
      desc = "Extract block to file"
    },
  },
}
