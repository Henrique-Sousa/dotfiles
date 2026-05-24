return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local languages = {
        "c", "cpp", "java", "bash", "python", "lua",
        "javascript", "typescript", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
      }

      require("nvim-treesitter").install(languages) 

      vim.api.nvim_create_autocmd('FileType', {
          pattern = languages,
          callback = function() vim.treesitter.start() end,
      })
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
