return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    lazy = false,
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "rust_analyzer",
        "gopls",
        "html",
        "cssls",
        "jsonls",
        "bashls",
        "marksman",
        "tailwindcss",
      },
      automatic_installation = true,
      automatic_enable = false,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = { "VeryLazy" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "prettierd",
          "black",
          "isort",
          "stylua",
          "gofmt",
          "rustfmt",
          "shfmt",
          -- Linters
          "eslint_d",
          "flake8",
          "selene",
          "shellcheck",
          "markdownlint",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
