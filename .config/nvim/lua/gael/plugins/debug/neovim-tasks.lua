return {
  "Shatur/neovim-tasks",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  event = "VeryLazy",
  config = function()
    local tasks = require("tasks")
    local path = require("plenary.path")
    tasks.setup({
      default_params = {
        cmake = {
          dap = {
            name = "lldb",
            -- cwd = '${workspaceFolder}',
            cwd = tostring(path:new('{cwd}')),
          },
        },
      },
      dap_open_command = function() end,
    })

    -- Keymaps
    -- Use auto for module name, tasks will use the first possible option
    local keymap = vim.keymap
    local dap = require("dap")

    -- Contextual start/resume
    local start_or_resume = function()
      if dap.session() == nil then
        vim.cmd("Task start auto debug")
      else
        dap.continue()
      end
    end

    keymap.set("n", "<F5>", start_or_resume, { silent = true, desc = "Start debugger" })
    keymap.set("n", "<leader>bd", start_or_resume, { silent = true, desc = "Start debugger" })

    keymap.set("n", "<C-F5>", "<cmd>Task start auto run<CR>", { silent = true, desc = "Run the build (no debugger)" })
    keymap.set("n", "<leader>bt", "<CMD>Task set_module_param auto target<CR>",
      { silent = true, desc = "Set the build target" })
    keymap.set("n", "<leader>bT", "<CMD>Task set_module_param auto build_type<CR>",
      { silent = true, desc = "Set the build type" })
    keymap.set("n", "<leader>bc", "<cmd>Task start auto configure<CR>", { silent = true, desc = "Configure the build" })
    keymap.set("n", "<leader>bk", "<cmd>Task start auto clean<CR>", { silent = true, desc = "Clean the build" })
    keymap.set("n", "<leader>bb", "<cmd>Task start auto build<CR>", { silent = true, desc = "Build" })
    keymap.set("n", "<leader>bs", "<cmd>Task cancel auto build<CR>", { silent = true, desc = "Stop build" })
  end,
}
