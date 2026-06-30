return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Gutter symbols
    -- Change the Diagnostic symbols in the gutter
    local info = vim.diagnostic.severity.INFO
    local hint = vim.diagnostic.severity.HINT
    local warn = vim.diagnostic.severity.WARN
    local error = vim.diagnostic.severity.ERROR
    vim.diagnostic.config({
      signs = {
        text = {
          [info] = "",
          [hint] = "",
          [warn] = "󰠠",
          [error] = "",
        },
        numhl = {
          [info] = "",
          [hint] = "",
          [warn] = "",
          [error] = "",
        },
      },
    })

    -- Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- See `:help vim.lsp.*` for documentation on the functions below
        local keymap = vim.keymap
        local opts = { buffer = ev.buf, silent = true }

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
        keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definition" })
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufrn=0<CR>", { desc = "Show buffer diagnostics" })
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
        keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
        keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
        keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
      end,
    })

    -- LSPs
    local function SetupLSP(lsp)
      local settings = require("gael.plugins.lsp.servers." .. lsp)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config(lsp, {
        capabilities = capabilities,
        settings = settings,
      })

      vim.lsp.enable(lsp)
    end

    SetupLSP("clangd")
    SetupLSP("rust_analyzer")

  end,
}
