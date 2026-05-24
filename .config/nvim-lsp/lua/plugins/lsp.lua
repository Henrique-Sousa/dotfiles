return {
  -- Install the package manager 
  { "williamboman/mason.nvim" },

  -- Setup the Language Server
  {
    'mfussenegger/nvim-jdtls',
    dependencies = 'hrsh7th/cmp-nvim-lsp',
  },

  -- Get code completion 
  {
    'hrsh7th/nvim-cmp',
    version = false, -- Ignore tags because nvim-cmp has a very old tag
    dependencies = {
      'L3MON4D3/LuaSnip',         -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet engine adapter
      'hrsh7th/cmp-nvim-lsp',     -- Source for LSP completion
    },
  },
  -- Native LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })

      vim.lsp.enable({ "lua_ls", "pyright" })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, remap = false }

          -- Standard LSP Mappings
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, opts)
        end,
      })
    end,
  },
}
