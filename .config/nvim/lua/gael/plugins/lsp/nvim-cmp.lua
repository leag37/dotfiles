return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- vsnip
        end,
      },
      
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-Down>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion
        ["<C-q>"] = cmp.mapping.abort(), -- close completion window
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- complete
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp servers
        { name = "vsnip" }, -- snippets
        { name = "render-markdown" }, -- markdown plugin
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system path
      }),

      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipses_char = "...",
        }),
      },
    })
  end,
}
