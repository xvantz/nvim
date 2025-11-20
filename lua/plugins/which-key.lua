return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 400,
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
      wo = { winblend = 10 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 4,
      align = "center",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "󰉗 ",
    },
    show_help = true,
    show_keys = true,
  },
  config = function(_, opts)
    local wk = require("which-key")

    wk.setup(opts)

    wk.add({
      { "<leader>b", group = "Buffers" },
      { "<leader>f", group = "Find/Telescope" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>r", group = "Run/Overseer" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Toggle/Terminal" },
      { "<leader>u", group = "UI/Zen" },
      { "<leader>w", group = "Windows/Splits" },
      { "<leader>x", group = "Trouble/Diagnostics" },
      { "<leader>M", group = "Mason" },
      { "<leader>j", group = "Leap/Jump" },
      { "<leader>fa", desc = "Leap AST" },
    })

    wk.add({ "gx", desc = "Open link under cursor", mode = { "n", "v" } })
  end,
}
