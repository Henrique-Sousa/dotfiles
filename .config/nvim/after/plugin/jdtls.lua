local jdtls = require('jdtls')

-- Workspace directory
local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- Start or attach jdtls
local config = {
    -- cmd = { 'jdtls' },  -- make sure jdtls is installed and in PATH
    cmd = {
        home .. "/.local/share/nvim/mason/bin/jdtls",
        "--jvm-arg=-Xms128m",
        "--jvm-arg=-Xmx512m",
        "--data", workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {},
    },
}

jdtls.start_or_attach(config)

-- Keymaps for Java refactoring (visual mode)
vim.keymap.set("n", "<leader>ep", function() print(vim.inspect(require('jdtls'))) end, { desc = "List" })
vim.keymap.set("v", "<leader>em", function() jdtls.extract_method() end, { desc = "Extract Method" })
vim.keymap.set("v", "<leader>ev", function() jdtls.extract_variable() end, { desc = "Extract Variable" })

-- Optional: other useful LSP mappings
vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.execute_command({
    command = "java.edit.organizeImports",
    arguments = { vim.uri_from_bufnr(0) },
  })
end, { desc = "Organize Imports" })
