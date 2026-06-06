return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      ui.setup()

      dap.configurations.java = {
        {
          type = 'java',
          request = 'attach',
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }

      --   {
      --     type = 'java',
      --     request = 'launch', -- Crucial: Must be launch, NOT attach
      --     name = "Debug Plain Java File",
      --   },
      -- }

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
      -- vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "DAP: run to cursor" }) 

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end, { desc = "DAP: eval under cursor" })

      vim.keymap.set("n", "<F1>", dap.continue, { desc = "DAP: continue" })
      vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP: step into" })
      vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP: step over" })
      vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP: step out" })
      vim.keymap.set("n", "<F5>", dap.step_back, { desc = "DAP: step back" })
      vim.keymap.set("n", "<F13>", dap.restart, { desc = "DAP: restart" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
