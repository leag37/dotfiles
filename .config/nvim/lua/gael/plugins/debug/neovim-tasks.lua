return {
  "Shatur/neovim-tasks",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  event = "VeryLazy",
  config = function()
    local tasks = require("tasks")
    tasks.setup({
      default_params = {
        cmake = {
          dap = {
            -- name = "lldb-dap",
            name = "lldb",
          },
        },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>bc", "<cmd>Task start auto configure<CR>", {})
    keymap.set("n", "<F5>", "<cmd>Task start auto debug<CR>", {})
    -- use auto for module name
  end,
}
