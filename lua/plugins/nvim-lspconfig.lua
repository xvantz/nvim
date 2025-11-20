return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  event = { "VeryLazy" },
  config = function()
    local lsp = require("lsp")
    for _, server_name in ipairs(lsp.enabled_servers) do
      vim.lsp.enable(server_name)
      end
  end,
}
