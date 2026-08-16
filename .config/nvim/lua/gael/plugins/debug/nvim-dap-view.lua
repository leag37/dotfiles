return {
  "igorlfs/nvim-dap-view",
  event = "VeryLazy",
  version = "1.*",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local nvim_dap_view = require("dap-view")
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
  end,
}
