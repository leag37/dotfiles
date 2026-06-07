return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup({
      -- syntax highlighting
      highlight = {
        enable = true,
      }
    })

    -- install parsers
    treesitter.install({
      "asm",
      "bash",
      "c",
      "c_sharp",
      "cmake",
      "cpp",
      "css",
      "desktop",
      "disassembly",
      "dockerfile",
      "fish",
      "gitignore",
      "html",
      "ini",
      "javascript",
      "json",
      "json5",
      "kitty",
      "lua",
      "make",
      "markdown",
      "python",
      "rasi",
      "rust",
      "sql",
      "tmux",
      "toml",
      "typescript",
      "vim",
      "xml",
      "yaml",
      "zsh",
    })
  end,
}
