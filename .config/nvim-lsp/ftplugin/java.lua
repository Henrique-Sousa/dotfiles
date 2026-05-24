local on_attach = function(client, bufnr)
  local jdtls = require('jdtls')
  local opts = { buffer = bufnr, remap = false }

  -- Disable LSP semantic tokens for jdtls to prevent syntax highlighting bugs.
  -- (I'm using treesitter for syntax higlighting instead)
    client.server_capabilities.semanticTokensProvider = nil

  -- Java Specific Mappings
  vim.keymap.set('n', '<leader>i', jdtls.organize_imports, { desc = 'Organize Imports', buffer = bufnr })
  vim.keymap.set('v', '<leader>em',
    [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { desc = 'Extract Method', buffer = bufnr })
  vim.keymap.set('n', '<leader>ev', jdtls.extract_variable, { desc = 'Extract Variable', buffer = bufnr })
  vim.keymap.set('n', '<leader>ec', jdtls.extract_constant, { desc = 'Extract Constant', buffer = bufnr })
end

local config = {
  cmd = {
    vim.fn.expand"$HOME/.local/share/nvim-lsp/mason/bin/jdtls",
    "-Xms256m",
    "-Xmx512m",

    -- Add Lombok Support
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand"$HOME/.local/share/nvim-lsp/mason/packages/jdtls/lombok.jar")
 },
  -- connect nvim-jdtls with nvim-cmp by adding completion capabilities
  capabilities = require"cmp_nvim_lsp".default_capabilities(),
  on_attach = on_attach,
}

require('jdtls').start_or_attach(config)
