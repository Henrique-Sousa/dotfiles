return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'BufReadPost', -- Load after buffer is read for better performance
    init = function()
      -- Neovim fold options
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider needs a large value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      -- Keymaps
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}

        -- Calculate actual hidden lines
        local foldedLines = endLnum - lnum

        -- Determine singular vs plural text
        local lineWord = foldedLines == 1 and "line" or "lines"

        -- Format string exactly as you want: "... 14 lines"
        local suffix = ('... %d %s '):format(foldedLines, lineWord)

        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - (curWidth + chunkWidth))
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end

        -- Apply the native 'UfoFoldedEllipsis' highlight group for default look
        table.insert(newVirtText, {suffix, 'UfoFoldedEllipsis'})
        return newVirtText
      end

      -- -- Option 1: nvim lsp as LSP client
      -- -- Tell the server the capability of foldingRange
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities.textDocument.foldingRange = {
      --   dynamicRegistration = false,
      --   lineFoldingOnly = true
      -- }
      --
      -- local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      -- for _, ls in ipairs(language_servers) do
      --     require('lspconfig')[ls].setup({
      --         capabilities = capabilities
      --         -- you can add other fields for setting up lsp server in this table
      --     })
      -- end
      --
      -- require('ufo').setup({
      --   fold_virt_text_handler = handler
      -- })
      -- --

      -- Option 2: treesitter as a main provider instead
      -- (Note: the `nvim-treesitter` plugin is *not* needed.)
      -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()
      require('ufo').setup({
          fold_virt_text_handler = handler,
          provider_selector = function(bufnr, filetype, buftype)
              return {'treesitter', 'indent'}
          end
      })

    end,
  }
}
