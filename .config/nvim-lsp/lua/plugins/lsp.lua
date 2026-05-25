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
    -- Alternatively, replacing the config block with `opts = {}` achieves the same result.
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ts_ls", "lua_ls" } -- Ensures your servers are auto-installed
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig"
    }
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
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config('tsserver', {
        -- Make sure this is on your path
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        -- This is a hint to tell nvim to find your project root from a file within the tree
        root_dir = vim.fs.root(0, { 'package.json', '.git' }),
        capabilities = capabilities
      })

      -- vim.lsp.enable({ "lua_ls", "pyright" })
      vim.lsp.enable({ "lua_ls", "tsserver" })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, remap = false }

          -- Navigation
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)

          -- Interaction
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

          -- Diagnostics (Updated for Neovim v0.11+)
          vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<space>cl', vim.diagnostic.setqflist, opts)

          vim.keymap.set('n', '[d', function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, opts
          )

          vim.keymap.set('n', ']d', function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, opts
          )
        end
      })
    end
  }
}
