return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parser_list = {
        "c", "cpp", "java", "bash", "python", "lua",
        "javascript", "typescript", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
      }
      local installed = require("nvim-treesitter.config").get_installed()
      local to_install = vim.tbl_filter(function(p)
        for _, inst in ipairs(installed) do
          if inst == p then return false end
        end
        return true
      end, parser_list)
      if #to_install > 0 then
        vim.schedule(function()
          require("nvim-treesitter.install").install(to_install, { force = false, summary = true })
        end)
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")

      vim.keymap.set({"o", "x"}, "af", function() select.select_textobject("@function.outer") end, { desc = "around function" })
      vim.keymap.set({"o", "x"}, "if", function() select.select_textobject("@function.inner") end, { desc = "inner function" })
      vim.keymap.set({"o", "x"}, "ac", function() select.select_textobject("@class.outer") end, { desc = "around class" })
      vim.keymap.set({"o", "x"}, "ic", function() select.select_textobject("@class.inner") end, { desc = "inner class" })
      vim.keymap.set({"o", "x"}, "aC", function() select.select_textobject("@conditional.outer") end, { desc = "around conditional" })
      vim.keymap.set({"o", "x"}, "iC", function() select.select_textobject("@conditional.inner") end, { desc = "inner conditional" })
      vim.keymap.set({"o", "x"}, "aL", function() select.select_textobject("@loop.outer") end, { desc = "around loop" })
      vim.keymap.set({"o", "x"}, "iL", function() select.select_textobject("@loop.inner") end, { desc = "inner loop" })

      vim.keymap.set("n", "]f", function() move.goto_next_start("@function.outer") end, { desc = "next function start" })
      vim.keymap.set("n", "]c", function() move.goto_next_start("@class.outer") end, { desc = "next class start" })
      vim.keymap.set("n", "]F", function() move.goto_next_end("@function.outer") end, { desc = "next function end" })
      vim.keymap.set("n", "]C", function() move.goto_next_end("@class.outer") end, { desc = "next class end" })
      vim.keymap.set("n", "[f", function() move.goto_previous_start("@function.outer") end, { desc = "prev function start" })
      vim.keymap.set("n", "[c", function() move.goto_previous_start("@class.outer") end, { desc = "prev class start" })
      vim.keymap.set("n", "[F", function() move.goto_previous_end("@function.outer") end, { desc = "prev function end" })
      vim.keymap.set("n", "[C", function() move.goto_previous_end("@class.outer") end, { desc = "prev class end" })
    end,
  },
}
