return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cmake = { "cmakelang" },
        cpp = { "clang-format" },
        csharp = { "clang-format" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        json = { "prettier" },
        lua = { "stylelua" },
        markdown = { "prettier" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        typescript = { "prettier" },
        yaml = { "prettier" },
      },
      default_format_opts = {
        lsp_fallback = true,
        async = true,
      },
      format_on_save = {
        lsp_fallback = true,
        async = true,
      },
    })

    local keymap = vim.keymap
    keymap.set({ "n", "v" }, "<leader>af", function()
    end,
    { desc = "Format file or range (in visual mode)" }
    )
  end,
}
