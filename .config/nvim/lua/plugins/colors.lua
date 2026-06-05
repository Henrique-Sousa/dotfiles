return {
  "vague2k/vague.nvim", -- color theme
  -- "vxlz/vague.nvim", -- Replace with the correct GitHub repository if different
  priority = 1000,   -- Ensure the colorscheme loads before other plugins
  config = function()
    -- Define the autocommand BEFORE setting the colorscheme so it triggers
    -- immediately and re-triggers on any future theme changes.
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function(_, opts)
        -- apply Transparency
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        -- modify comments
        vim.api.nvim_set_hl(0, "Comment", { fg = "#606079", italic = false })

        -- remove italics
        vim.api.nvim_set_hl(0, "String", { fg = "#e8b589", italic = false })

        -- remove undercurl in informational diagnostics
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
          undercurl = false,
        })
      end,
    })

    -- Execute the colorscheme (this triggers the autocommand defined above)
   	-- local color = "habamax"
   	local color = "vague"
    -- local colocar = "catppuccin"
    -- local color = "slate"
   	vim.cmd.colorscheme(color)
  end
}
