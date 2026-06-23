-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- GENERAL
-----------
keymap.set("n", "<leader>vq", "<cmd>qa<CR>", { desc = "Exit NeoVim" })
keymap.set("n", "<leader>vQ", "<cmd>qa!<CR>", { desc = "Force exit NeoVim" })
keymap.set("n", "<leader>vs", "<cmd>w<CR>", { desc = "Save current file" })
keymap.set("n", "<leader>va", "<cmd>wa<CR>", { desc = "Save all files" })
keymap.set("n", "<leader>vx", "<cmd>wqa<CR>", { desc = "Save all files and quit" })

-- WINDOWS
-----------
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Split window equal size" })
keymap.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split" })

-- TABS
-----------
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tw", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tm", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- TERMINAL
------------
keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle the terminal" } )


-- MISC
-----------

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })


