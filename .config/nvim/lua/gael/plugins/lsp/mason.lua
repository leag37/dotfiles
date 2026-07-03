return {
  "williamboman/mason.nvim",
  config = function()
    local mason = require("mason")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    
    -- Helper for installing Mason packages
    ---@param packages string[]
    local function InstallPackages(packages)
      local commands = require("mason.api.command")
      local registry = require("mason-registry")

      local to_install = {}
      for _, v in ipairs(packages) do
        if not registry.is_installed(v) then
          table.insert(to_install, v)
        end

        if next(to_install) ~= nil then
          commands.MasonInstall(to_install, {})
        end
      end
    end

    -- Install packages
    -- LSPs
    local lsps = {
      "clangd", -- C, C++
      "neocmakelsp", -- cmake
      "css-lsp", -- CSS
      "html-lsp", -- HTML
      "lua-language-server", -- Lua
      "pyright", -- Python
      "roslyn-language-server", -- C#
      "rust-analyzer", -- Rust
      "typescript-language-server", -- TypeScript
    }
    InstallPackages(lsps)

    -- DAPs
    local daps = {
      "codelldb", -- C, C++, Rust
      "js-debug-adapter", -- JS, TypeScript
      "local-lua-debugger-vscode", -- Lua
      "netcoredbg", -- C#
    }
    InstallPackages(daps)

    -- Linters
    local linters = {
      "bacon", -- Rust
      "cmakelang", -- cmake
      "cpplint", -- C, C++
      "luacheck", -- Lua
      "oxlint", -- JS, TypeScript
      "pylint", -- Python
      "semgrep", -- C#
      "stylelint", -- CSS
    }
    InstallPackages(linters)

    -- Formatters
    local formatters = {
      "black", -- Python
      "clang-format", -- C, C#, C++
      "cmakelang", -- cmake
      "isort", -- Python
      "luaformatter", -- Lua
      "prettier", -- CSS, JSON, HTML, JS, Markdown, TypeScript
    }
    InstallPackages(formatters)

    -- keymap
    local keymap = vim.keymap
    keymap.set("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Open Mason LSP manager" })

  end,
}
