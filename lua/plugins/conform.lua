return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = false })
      end,
      desc = "Format Buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      sh = { "shfmt" },
      svelte = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = false,
    },
    formatters = {
      prettier = {
        prepend_args = { "--single-quote", "--jsx-single-quote" },
      },
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
  },
}
