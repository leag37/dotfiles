return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function()
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })

    -- DAPs
    local function SetupDap(dap)
      local config = require("gael.plugins.debug.daps." .. dap)
      local nvim_dap = require("dap")
      nvim_dap.adapters[dap] = config
    end

    SetupDap("lldb")

    -- Languages
    local function SetupLanguage(language)
      local config = require("gael.plugins.debug.languages." .. language)
      local nvim_dap = require("dap")
      nvim_dap.configurations[language] = config
    end

    SetupLanguage("cpp")
  end,
}
