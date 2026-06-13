return {
  "ThePrimeagen/harpoon",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ha",
      function() require("harpoon.mark").add_file() end,
      desc = "Harpoon Add File"
    },
    {
      "<leader>hm",
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "Harpoon Quick Menu"
    },
    {
      "<C-j>",
      function() require("harpoon.ui").nav_file(1) end,
      desc = "Harpoon File 1"
    },
    {
      "<C-k>",
      function() require("harpoon.ui").nav_file(2) end,
      desc = "Harpoon File 2"
    },
    {
      "<C-l>",
      function() require("harpoon.ui").nav_file(3) end,
      desc = "Harpoon File 3"
    },
    {
      "<C-h>",
      function() require("harpoon.ui").nav_file(4) end,
      desc = "Harpoon File 4"
    },
  },
}
