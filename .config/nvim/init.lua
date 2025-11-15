require("config")

-- remove undercurl in TODO: comments

-- Wait for the ColorScheme event to ensure this runs after the colorscheme plugin loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*", -- Run on any colorscheme change
  callback = function()
    -- Override the main diagnostic highlight for informational severity
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
      -- You can link it to another group, like DiagnosticInfo, or keep its attributes
      -- If you want to keep the color but remove the curl:
      undercurl = false,
      -- underline = false, -- Use both for maximum compatibility
    })

    -- Optional: If CocInfoHighlight is the primary one, you can override it directly
    -- vim.api.nvim_set_hl(0, "CocInfoHighlight", {
    --   undercurl = false,
    --   underline = false,
    -- })
  end,
})

-- If the above doesn't work, sometimes it needs a slight delay or a later autocmd
-- This is a more aggressive approach but can fix timing issues with plugins like Coc
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     vim.defer_fn(function()
--       vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
--         undercurl = false,
--         underline = false,
--       })
--     end, 500) -- 500ms delay to ensure Coc/diagnostics are fully loaded
--   end,
-- })
