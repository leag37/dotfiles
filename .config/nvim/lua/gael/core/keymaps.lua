-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- GENERAL
-----------
keymap.set("n", "<leader>vq", "<cmd>qa<CR>", { desc = "Exit NeoVim" })
keymap.set("n", "<leader>vQ", "<cmd>qa!<CR>", { desc = "Force exit NeoVim" })
keymap.set("n", "<leader>vs", "<cmd>w<CR>", { desc = "Save current file" })
keymap.set("n", "<leader>va", "<cmd>w!<CR>", { desc = "Save all files" })
keymap.set("n", "<leader>vx", "<cmd>wq!<CR>", { desc = "Save all files and quit" })

-- WINDOWS
-----------
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Split window equal size" })
keymap.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
keymap.set("n", "<C-H>", "<C-w>H", { desc = "Move window to the far left" })
keymap.set("n", "<C-L>", "<C-w>L", { desc = "Move window to the far right" })
keymap.set("n", "<C-K>", "<C-w>K", { desc = "Move window to the far top" })
keymap.set("n", "<C-J>", "<C-w>J", { desc = "Move window to the far bottom" })
keymap.set("n", "<C-w>", "<C-w>x", { desc = "Swap window with adjacent window" })
keymap.set("n", "<C->>", "<C-w>>", { desc = "Increase window width" })
keymap.set("n", "<C-><", "<C-w><", { desc = "Decrease window width" })
keymap.set("n", "<C->+", "<C-w>+", { desc = "Increase window height" })
keymap.set("n", "<C->-", "<C-w>-", { desc = "Decrease window height" })

-- TABS
-----------
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tm", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })


-- MISC
-----------

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })


