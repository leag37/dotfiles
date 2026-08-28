return {
  {
    name = 'CMake Debugger',
    type = 'lldb',
    request = 'launch',
    -- program = function()
    -- end,
    cwd = function() return vim.fn.getcwd() end,
    -- cwd = '${workspaceFolder}',
    -- stopOnEntry = false,
    -- args = {},
    -- runInTerminal = false,
  }
}
