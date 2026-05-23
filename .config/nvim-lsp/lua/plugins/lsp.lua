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
  -- --
  -- -- Java plugin (Managed separately)
  -- { "mfussenegger/nvim-jdtls" },
  --
  -- -- Native LSP config
  -- {
    --   "neovim/nvim-lspconfig",
    --   config = function()
      --     local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --
      --     vim.lsp.config("lua_ls", { capabilities = capabilities })
      --     vim.lsp.config("pyright", { capabilities = capabilities })
      --
      --     vim.lsp.enable({ "lua_ls", "pyright" })
      --
      --     vim.api.nvim_create_autocmd("LspAttach", {
        --       callback = function(ev)
          --         local opts = { buffer = ev.buf }
          --         vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          --         vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          --         vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          --         vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
          --       end,
          --     })
          --   end,
          -- },
}
