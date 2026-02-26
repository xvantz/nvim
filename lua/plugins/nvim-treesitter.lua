return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local treesitter = require("nvim-treesitter")
    local languages = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
      "rust",
      "go",
      "python",
      "bash",
      "html",
      "css",
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "regex",
      "vue",
      "svelte",
      "prisma",
      "graphql",
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
        vim.wo.foldlevel = 99
      end,
    })
    treesitter.install(languages)
  end,
}
