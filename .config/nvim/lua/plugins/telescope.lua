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
      pickers = {
        colorscheme = {
          enable_preview = true, -- Enables live previewing
        }
      },
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
    { "<leader>tt", "<cmd>Telescope builtin<cr>", desc = "Telescope builtin" },

    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    { "<leader>fd", "<cmd>Telescope fd<cr>", desc = "Telescope fd" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Telescope oldfiles" },

    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>rg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
    { 
      "<leader>sw", 
      function()
        local word = vim.fn.expand("<cword>")
        require('telescope.builtin').grep_string({ search = word })
      end, 
      desc = "Telescope grep word under cursor" 
    },

    { "<leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope current buffer fuzzy find" },
    { "<leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope current buffer fuzzy find" },

    { "<leader>cd", "<cmd>Telescope diagnostics<cr>", desc = "Telescope diagnostics" },
    { "<leader>sr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope lsp references" },
    { "<leader>si", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope lsp implementations" },
    { "<leader>sT", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Telescope lsp type definitions" },

    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },

    { "<leader>gd", "<cmd>Telescope git_status<cr>", desc = "Telescope git commits" },
    { "<leader>gr", "<cmd>Telescope git_commits<cr>", desc = "Telescope git commits" },
    { "<leader>gb", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope git bcommits" },

    { "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
    { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Telescope keymaps" },
    { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Telescope commands" },
    { "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Telescope man pages" },
    { "<leader>ho", "<cmd>Telescope vim_options<cr>", desc = "Telescope vim options" },
  }
}
