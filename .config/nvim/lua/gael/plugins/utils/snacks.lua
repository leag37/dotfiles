return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = true },
    indent = { 
      enabled = true,
      indent = {
        char = "┊",
      },
      scope = {
        char = "┊",
      },
    },
    input = { enabled = true },
    keymap = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    picker = { enabled = true },
    scroll = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>pf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>p,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>p/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>p:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>pn", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>pe", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
