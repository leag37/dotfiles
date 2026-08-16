return {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  }
}
