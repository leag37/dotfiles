return {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  }
}
