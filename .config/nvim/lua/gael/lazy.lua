local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    { import = "gael.plugins" },
    { import = "gael.plugins.ui" },
  },
  {
    change_detection = {
      notify = false,
    },
  })

-- KEYMAPS
------------
local keymap = vim.keymap

keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" })
