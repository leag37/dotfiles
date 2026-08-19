return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "Shatur/neovim-tasks"
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local function cmake_status()
      local path = require("plenary.path")
      local project_config = require("tasks.project_config")
      local cmake_config = project_config:new()['cmake']
      local cmakelists_dir = cmake_config.source_dir and cmake_config.source_dir or vim.loop.cwd()
      if (path:new(cmakelists_dir) / 'CMakeLists.txt'):exists() then
        local cmake_utils = require("tasks.cmake_utils.cmake_utils")

        if cmake_utils.shouldUsePresets(cmake_config) then
          local preset = cmake_config.build_preset or 'not selected'
          local cmakeTarget = cmake_config.target and cmake_config.target or 'all'

          return 'CMake preset: ' .. preset .. ', target: ' .. cmakeTarget
        else
          local cmakeBuildType = cmake_config.build_type or 'no build type'
          -- local cmakeKit = cmake_config.build_kit or 'not selected'
          local cmakeTarget = cmake_config.target or 'all'

          return '[' .. cmakeTarget .. '|' .. cmakeBuildType .. ']'
          -- return 'CMake variant: ' .. cmakeBuildType .. ', kit: ' .. cmakeKit .. ', target: ' .. cmakeTarget
        end
      else
        return ''
      end
    end

    lualine.setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
          { cmake_status },
        },
      },
      inactive_sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
      },
    })
  end,
}
