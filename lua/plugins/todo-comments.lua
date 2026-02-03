return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  -- TODO
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
    keywords = {
      FIX = { icon = " ", color = "#f38ba8", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " ", color = "#89b4fa", alt = { "WIP" } },
      HACK = { icon = " ", color = "#f9e2af" },
      WARN = { icon = " ", color = "#f9e2af", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = "#cba6f7", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰍩 ", color = "#94e2d5", alt = { "INFO", "HINT" } },
      TEST = { icon = "⏲ ", color = "#a6e3a1", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
      multiline = false,
      keyword = "bg",
      pattern = [[<(KEYWORDS)]],
    },
    search = {
      command = "rg",
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
}
