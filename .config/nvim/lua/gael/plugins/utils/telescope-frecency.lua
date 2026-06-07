return {
  "nvim-telescope/telescope-frecency.nvim",
  event = "VeryLazy",
  version = "^0.9.0",
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("frecency")
  end,
}
