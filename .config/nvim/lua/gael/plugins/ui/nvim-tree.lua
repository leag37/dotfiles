return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvim_tree = require("nvim-tree")
    local api = require("nvim-tree.api")

    -- Recommended settings from  nvim-tree documentaion
    vim.g.loaded_netrw = 1
    vim.g.loadad_netrwPlugin = 1

    nvim_tree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },

      -- folder icons
      renderer = {
        indent_markers = {
          enable = true,
        },

        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },

      -- disable window picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },

      filters = {
        custom = { },
      },

      git = {
        ignore = false,
      },
    })

    -- Automatically open file upon creation
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
    end)

    -- Find and focus directory (with Telescope)
    function find_directory_and_focus()
      local actions = require("telescope.actions")
      local actions_state = require("telescope.actions.state")

      local function open_nvim_tree(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = actions_state.get_selected_entry()
          if (selection ~= nil) then
            api.tree.open()
            api.tree.find_file(selection.cwd .. "/" .. selection.value)
          end
        end)

        return true
      end

      local telescope_builtin = require("telescope.builtin")
      telescope_builtin.find_files({
        find_command = { "fdfind", "--type", "d", "--hidden", "--exclude", ".git/*" },
        attach_mappings = open_nvim_tree,
      })
    end

    -- keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>eo", "<cmd>NvimTreeOpen<CR>", { desc = "Open file explorer" })
    keymap.set("n", "<leader>eq", "<cmd>NvimTreeClose<CR>", { desc = "Close file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Go to the current file in the file explorer" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse the file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh the file explorer" })
    keymap.set("n", "<leader>ed", find_directory_and_focus, { desc = "Open file explorer to the current file's directory" })

  end,
}
