return {
  -- Development helper to dynamically map workspace paths for lua_ls
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {}
  },

  -- Install the package manager
  {
    "williamboman/mason.nvim",
    opts = {}
  },

  -- Setup the Language Server
  {
    'mfussenegger/nvim-jdtls',
    dependencies = 'hrsh7th/cmp-nvim-lsp'
  },

  -- Get code completion
  {
    "hrsh7th/nvim-cmp",
    version = false,              -- Ignore tags because nvim-cmp has a very old tag
    dependencies = {
      'L3MON4D3/LuaSnip',         -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet engine adapter
      'hrsh7th/cmp-nvim-lsp'      -- Source for LSP completion
    },
    config = function()
      require('cmp').setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = {
          ['<C-c>'] = require('cmp').mapping.abort(),
          ['<CR>'] = require('cmp').mapping.confirm(),
          ['<C-n>'] = require('cmp').mapping.select_next_item(),
          ['<C-p>'] = require('cmp').mapping.select_prev_item()
        },
        sources = {
          { name = 'nvim_lsp' }
        }
      })
    end
  },

  -- Native LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- vim.lsp.config("pyright", { capabilities = capabilities })
      -- vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config('ts_ls', {
        -- Make sure this is on your path
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        -- This is a hint to tell nvim to find your project root from a file within the tree
        root_dir = vim.fs.root(0, { 'package.json', '.git' }),
        capabilities = capabilities
      })

      vim.lsp.enable({
        -- "lua_ls",
        -- "pyright",
        "ts_ls"
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf

          local base_opts = { buffer = bufnr, remap = false }

          -- Helper to add a description to base options
          local function opts(desc)
            return vim.tbl_extend("force", base_opts, { desc = desc })
          end

          -- Navigation
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts("LSP: Go to definition"))
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts("LSP: Go to declaration"))
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts("LSP: Show references"))
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts("LSP: Go to implementation"))
          vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts("LSP: Go to type definition"))

          -- Interaction
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts("LSP: Show hover information"))
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts("LSP: Show signature help"))
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts("LSP: Rename symbol"))
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts("LSP: Code action"))
          vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts("LSP: Workspace symbol"))
          vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts("LSP: Format code"))

          -- Diagnostics
          vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts("Diagnostics: Open float"))
          vim.keymap.set('n', '<space>cl', vim.diagnostic.setqflist, opts("Diagnostics: Set quickfix list"))

          vim.keymap.set('n', '[d', function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, opts("Diagnostics: Jump to previous"))

          vim.keymap.set('n', ']d', function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, opts("Diagnostics: Jump to next"))
        end
      })
    end
  },
}
