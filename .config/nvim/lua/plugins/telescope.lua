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
    -- { "<leader>fd", "<cmd>Telescope fd<cr>", desc = "Telescope fd" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Telescope oldfiles" },
    { 
      "<leader>fd",
      function()
        require('telescope.builtin').find_files({
          cwd = vim.fn.expand('%:p:h') -- Expands to the directory of the current active buffer
        })
      end,
      desc = "Search files in current buffer's directory"
    },

    { "<leader>rg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
    { 
      "<leader>tw", 
      function()
        local word = vim.fn.expand("<cword>")
        require('telescope.builtin').grep_string({ search = word })
      end, 
      desc = "Telescope grep word under cursor" 
    },

    { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope current buffer fuzzy find" },
    { 
      "<leader>rd",
      function()
        require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') -- Expands to the directory of the current active buffer
        })
      end,
      desc = "Grep files in current buffer's directory"
    },

    { "<leader>cd", "<cmd>Telescope diagnostics<cr>", desc = "Telescope diagnostics" },
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope lsp references" },
    { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope lsp implementations" },
    { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Telescope lsp type definitions" },

    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },

    { "<leader>gd", "<cmd>Telescope git_status<cr>", desc = "Telescope git commits" },
    { "<leader>gr", "<cmd>Telescope git_commits<cr>", desc = "Telescope git commits" },
    { "<leader>gb", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope git bcommits" },

    { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
    { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Telescope keymaps" },
    { "<leader>tc", "<cmd>Telescope commands<cr>", desc = "Telescope commands" },
    { "<leader>tm", "<cmd>Telescope man_pages<cr>", desc = "Telescope man pages" },
    { "<leader>to", "<cmd>Telescope vim_options<cr>", desc = "Telescope vim options" },
  }
}
