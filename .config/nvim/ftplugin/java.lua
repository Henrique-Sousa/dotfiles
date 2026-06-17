local on_attach = function(client, bufnr)
  local jdtls = require("jdtls")
  local opts = { buffer = bufnr, remap = false }

  -- Disable LSP semantic tokens for jdtls to prevent syntax highlighting bugs.
  -- (I'm using treesitter for syntax higlighting instead)
  client.server_capabilities.semanticTokensProvider = nil

  -- Java Specific Mappings
  vim.keymap.set("n", "<leader>ci", jdtls.organize_imports, opts)
  vim.keymap.set("n", "<leader>cev", jdtls.extract_variable, opts)
  vim.keymap.set("n", "<leader>cec", jdtls.extract_constant, opts)
  vim.keymap.set("v", "<leader>cem", [[<ESC><CMD>lua require("jdtls").extract_method(true)<CR>]], opts)
end

local config = {

  cmd = {
    vim.fn.expand "$HOME/.local/share/nvim/mason/bin/jdtls",
    "--jvm-arg=-Xms128m",                  -- Lower initial heap to save RAM on startup
    "--jvm-arg=-Xmx512m",                  -- Keep max heap at 512MB
    "--jvm-arg=-XX:+UseSerialGC",          -- Crucial: Uses much less memory than default G1GC
    "--jvm-arg=-XX:MaxMetaspaceSize=256m", -- Caps the memory used for class metadata
    "--jvm-arg=-XX:CICompilerCount=2",     -- Reduces JIT compiler threads and their memory overhead
    "--jvm-arg=-Xss256k",                  -- Reduces memory allocated per thread stack

    -- Add Lombok Support
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand "$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")
  },

  -- connect nvim-jdtls with nvim-cmp by adding completion capabilities
  capabilities = require "cmp_nvim_lsp".default_capabilities(),

  -- Debugger
  init_options = {
    bundles = {
      vim.fn.expand(
        '$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'
      )
    }
  },

    on_attach = on_attach,
  }

  require("jdtls").start_or_attach(config)
