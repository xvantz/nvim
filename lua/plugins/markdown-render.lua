return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    keys = {
      { "<leader>rm", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle Markdown Preview" },
    },
  },
}
