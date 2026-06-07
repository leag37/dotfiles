return {
  "nvim-telescope/telescope-file-browser.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("file_browser")

    local keymap = vim.keymap
    keymap.set("n", "<leader>fB", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Open the telescope file browser at the current path" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { desc = "Open the telescope file browser" })
  end,
}
