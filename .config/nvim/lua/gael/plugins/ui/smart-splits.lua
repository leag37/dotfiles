return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    local smart_splits = require("smart-splits")
    local keymap = vim.keymap

    keymap.set({ "n", "t" }, "<C-Left>", smart_splits.move_cursor_left, { desc = "Go to the left window" })
    keymap.set({ "n", "t" }, "<C-Right>", smart_splits.move_cursor_right, { desc = "Go to the right window" })
    keymap.set({ "n", "t" }, "<C-Up>", smart_splits.move_cursor_up, { desc = "Go to the up window" })
    keymap.set({ "n", "t" }, "<C-Down>", smart_splits.move_cursor_down, { desc = "Go to the down window" })

    keymap.set({ "n", "t" }, "<C-h>", smart_splits.move_cursor_left, { desc = "Go to the left window" })
    keymap.set({ "n", "t" }, "<C-l>", smart_splits.move_cursor_right, { desc = "Go to the right window" })
    keymap.set({ "n", "t" }, "<C-k>", smart_splits.move_cursor_up, { desc = "Go to the up window" })
    keymap.set({ "n", "t" }, "<C-j>", smart_splits.move_cursor_down, { desc = "Go to the down window" })

    keymap.set("n", "<leader>wl", smart_splits.swap_buf_left, { desc = "Move window left" })
    keymap.set("n", "<leader>wh", smart_splits.swap_buf_right, { desc = "Move window right" })
    keymap.set("n", "<leader>wk", smart_splits.swap_buf_up, { desc = "Move window up" })
    keymap.set("n", "<leader>wj", smart_splits.swap_buf_down, { desc = "Move window down" })

    keymap.set("n", "<A-h>", smart_splits.resize_left, { desc = "Increase window width" })
    keymap.set("n", "<A-l>", smart_splits.resize_right, { desc = "Decrease window width" })
    keymap.set("n", "<A-k>", smart_splits.resize_up, { desc = "Increase window height" })
    keymap.set("n", "<A-j>", smart_splits.resize_down, { desc = "Decrease window height" })

    keymap.set("n", "<A-e>", "<C-w>=", { desc = "Split window equal size" })
  end,
}
