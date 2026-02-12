return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = false, timeout_ms = 3000 })
      end,
      desc = "Format Buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "biome", "prettierd", stop_after_first = true },
      typescript = { "biome", "prettierd", stop_after_first = true },
      javascriptreact = { "biome", "prettierd", stop_after_first = true },
      typescriptreact = { "biome", "prettierd", stop_after_first = true },
      json = { "biome", "prettierd", stop_after_first = true },
      svelte = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      sh = { "shfmt" },
      nix = { "alejandra" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = false,
    },
    formatters = {
      biome = {
        condition = function(_, ctx)
          return vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true, path = ctx.filename })[1]
        end,
      },
      prettierd = {
        condition = function(_, ctx)
          local has_biome = vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true, path = ctx.filename })[1]
          return not has_biome or vim.bo[ctx.buf].filetype == "svelte"
        end,
      },
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
  },
}
