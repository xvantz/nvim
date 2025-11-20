return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs (Telescope)" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "TODOs in Trouble" },
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },
  },
  opts = {
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = { icon = " ", color = "#f38ba8", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " ", color = "#89b4fa", alt = { "WIP" } },
      HACK = { icon = " ", color = "#f9e2af" },
      WARN = { icon = " ", color = "#f9e2af", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = "#cba6f7", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰍩 ", color = "#94e2d5", alt = { "INFO", "HINT" } },
      TEST = { icon = "⏲ ", color = "#a6e3a1", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },
    merge_keywords = true,
    highlight = {
      multiline = true,
      multiline_pattern = "^.",
      multiline_context = 10,
      before = "fg",
      keyword = "wide_bg",
      after = "fg",
      pattern = [[.*<(KEYWORDS)\s*(\([^\)]*\))?:?]],
      comments_only = true,
      exclude = {},
    },
    colors = {
      error = { "DiagnosticError", "f38ba8" },
      warning = { "DiagnosticWarn", "f9e2af" },
      info = { "DiagnosticInfo", "94e2d5" },
      hint = { "DiagnosticHint", "89b4fa" },
      default = { "Identifier", "cba6f7" },
      test = { "Identifier", "a6e3a1" },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--hidden",
      },
      pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
    },
  },
}
