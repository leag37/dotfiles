require("gael.core")
require("gael.lazy")

-- Text highlighting on yank
vim.cmd([[autocmd TextYankPost * silent! lua vim.hl.on_yank {higroup='Visual', timeout=300}]])
