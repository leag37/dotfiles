return {
  "igorlfs/nvim-dap-view",
  event = "VeryLazy",
  version = "1.*",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local nvim_dap_view = require("dap-view")
    local dap = require("dap")

    nvim_dap_view.setup({
      winbar = {
        default_section = "scopes",
        controls = {
          enabled = true,
        },
      },
      switchbuf = "useopen,newtab",
      auto_toggle = true,
      follow_tab = true,
    })

    -- Keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>br", "<cmd>DapViewOpen<cr><cmd>DapViewJump breakpoints<cr>", { desc = "Open breakpoints" })
    keymap.set("n", "<leader>bv", "<cmd>DapViewToggle<cr>", { desc = "Toggle the debug view" })

    -- dap.listeners.after.event_process["view_config"] = function()
    keymap.set("n", "<S-F5>", "<cmd>DapTerminate<CR>", { desc = "Stop the debugger" })
    dap.listeners.after.event_initialized["view_config"] = function()
    end

    dap.listeners.after.event_stopped["view_config"] = function()
      keymap.set("n", "<F10>", "<cmd>DapStepOver<cr>", { desc = "Step over" })
      keymap.set("n", "<F11>", "<cmd>DapStepInto<cr>", { desc = "Step into" })
      keymap.set("n", "<S-F11>", "<cmd>DapStepOut<cr>", { desc = "Step out" })
    end

    dap.listeners.after.event_terminated["view_config"] = function()
      -- keymap.del("n", "<F10>")
    end
  end,
}
