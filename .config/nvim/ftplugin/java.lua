-- Check if the plugin is actually loaded
local ok, jdtls = pcall(require, 'jdtls')
if not ok then
  return -- Plugin not loaded yet, abort to prevent errors
end

-- Find project root
local root_dir = vim.fs.root(0, {".git", "gradlew", "mvnw", "pom.xml"})
if not root_dir then return end -- No project found

local mason_path = vim.fn.stdpath("data") .. "/mason"
local jdtls_bin = mason_path .. "/bin/jdtls"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

local config = {
  cmd = { jdtls_bin, "-data", workspace_dir },
  root_dir = root_dir,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

jdtls.start_or_attach(config)
