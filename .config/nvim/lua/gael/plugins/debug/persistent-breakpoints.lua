return {
  "Weissle/persistent-breakpoints.nvim",
  event = "VeryLazy",
  dependencies = {
    "mfussengger/nvim-dap",
  },
  config = function()
    local persistent_breakpoints = require("persistent-breakpoints")
    persistent_breakpoints.setup {
      load_breakpoints_event = { "BufReadPost" },
    }

    -- Keymaps
    local keymap = vim.keymap
    keymap.set("n", "<F9>", "<cmd>PBToggleBreakpoint<CR>", { desc = "Toggle a breakpoint" })
  end,
}
