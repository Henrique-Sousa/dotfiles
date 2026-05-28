return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-web-devicons",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<Up>"] = actions.cycle_history_prev,
            ["<Down>"] = actions.cycle_history_next,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case", -- Change to "--case-sensitive" for strict matching
          -- "--case-sensitive"
        }
      },
    })
  end,
  keys = {
    { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    { "<leader>tl", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
    { "<leader>tg", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
    { 
      "<leader>tw", 
      function()
        local word = vim.fn.expand("<cword>")
        require('telescope.builtin').grep_string({ search = word })
      end, 
      desc = "Telescope grep word under cursor" 
    },
    -- { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    -- { "<leader>sg", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
    { "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
    { "<leader>to", "<cmd>Telescope oldfiles<cr>", desc = "Telescope oldfiles" },
    { "<leader>tm", "<cmd>Telescope man_pages<cr>", desc = "Telescope man pages" },
    { "<leader>tz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope current buffer fuzzy find" },
    { "<leader>tt", "<cmd>Telescope builtin<cr>", desc = "Telescope builtin" },
    { "<leader>tc", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope git bcommits" },
    { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Telescope keymaps" },
    { "<leader>td", "<cmd>Telescope diagnostics<cr>", desc = "Telescope diagnostics" },
    -- { "<leader>tr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope lsp references" },
    -- { "<leader>ti", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope lsp implementations" },
    -- { "<leader>tT", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Telescope lsp type definitions" },
  }
}
