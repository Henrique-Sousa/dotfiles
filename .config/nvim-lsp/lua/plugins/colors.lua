return {
  "vague2k/vague.nvim", -- color theme
  -- "vxlz/vague.nvim", -- Replace with the correct GitHub repository if different
  priority = 1000,   -- Ensure the colorscheme loads before other plugins
  config = function()
    -- Define the autocommand BEFORE setting the colorscheme so it triggers
    -- immediately and re-triggers on any future theme changes.
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- 1. Apply Transparency
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        
        -- 2. Modify Comments
        vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = false })

        -- 3. Remove undercurl in informational diagnostics
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
          undercurl = false,
        })
      end,
    })

    -- Execute the colorscheme (this triggers the autocommand defined above)
   	-- color = color or "rose-pine"
   	-- color = color or "gruvbox"
   	-- color = color or "habamax"
   	color = color or "vague"
   	vim.cmd.colorscheme(color)
  end
}
