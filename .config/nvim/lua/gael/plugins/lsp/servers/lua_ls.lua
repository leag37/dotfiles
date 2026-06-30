return {
  settings = {
    Lua = {
      -- make server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
    },
    workspace = {
      library = {
        vim.env.VIMRUNTIME,
      },
    },
  },
}
