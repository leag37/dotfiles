return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function()
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
  end,
}
