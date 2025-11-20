return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
  },
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = "^$",

      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },

      toggler = { line = "gcc", block = "gbc" },
      mappings = {
        basic = true,
        extra = true,
      },
    })

    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })
  end,
}
