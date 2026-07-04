return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local keymap = vim.keymap
      local opts = {
        buffer = bufnr,
      }

      -- Navigation
      opts.desc = "Next hunk"
      keymap.set("n", "]h", gs.next_hunk, opts)
      opts.desc = "Prev hunk"
      keymap.set("n", "[h", gs.prev_hunk, opts)


      -- Actions
      opts.desc = "Stage hunk"
      keymap.set("n", "<leader>gs", gs.stage_hunk, opts)
      keymap.set("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, opts)

      opts.desc = "Reset hunk"
      keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
      keymap.set("v", "<leader>gr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, opts)

      opts.desc = "Stage buffer"
      keymap.set("n", "<leader>gS", gs.stage_buffer, opts)

      opts.desc = "Stage buffer"
      keymap.set("n", "<leader>gR", gs.reset_buffer, opts)

      opts.desc = "Undo stage hunk"
      keymap.set("n", "<leader>gu", gs.undo_stage_hunk, opts)

      opts.desc = "Preview hunk"
      keymap.set("n", "<leader>gp", gs.preview_hunk, opts)

      opts.desc = "Blame line"
      keymap.set("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, opts)

      opts.desc = "Toggle line blame"
      keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, opts)

      opts.desc = "Diff this"
      keymap.set("n", "<leader>gd", gs.diffthis, opts)

      opts.desc = "Diff this ~"
      keymap.set("n", "<leader>gD", function()
        gs.diffthis("~")
      end, opts)

      -- Text object
      opts.desc = "Gitsigns select hunk"
      keymap.set({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", opts)
    end,
  }
}
