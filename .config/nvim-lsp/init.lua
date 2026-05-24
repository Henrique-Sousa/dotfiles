require("core.keymaps")
require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-surround",
  -- {"puremourning/vimspector"} -- debugging (on top of DAP)

  -- Import all files from the lua/plugins/ directory
  { import = "plugins" }
})

require'mason'.setup()

-- configure the snippet engine, essential mappings, and the LSP completion source
require'cmp'.setup({
    snippet = {
        -- Exclusive to LuaSnip, check nvim-cmp documentation for usage with a different snippet engine
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    mapping = {
        -- Sample but necessary mappings, read nvim-cmp documentation to customize them
        ['<C-c>'] = require'cmp'.mapping.abort(),
        ['<CR>'] = require'cmp'.mapping.confirm(),
        ['<C-n>'] = require'cmp'.mapping.select_next_item(),
        ['<C-p>'] = require'cmp'.mapping.select_prev_item(),
    },
    sources = {
        { name = 'nvim_lsp' },
    },
})
