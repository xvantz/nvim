return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      },
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblRainbowRed", { fg = "#f38ba8" })
      vim.api.nvim_set_hl(0, "IblRainbowYellow", { fg = "#f9e2af" })
      vim.api.nvim_set_hl(0, "IblRainbowBlue", { fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "IblRainbowOrange", { fg = "#fab387" })
      vim.api.nvim_set_hl(0, "IblRainbowGreen", { fg = "#a6e3a1" })
      vim.api.nvim_set_hl(0, "IblRainbowViolet", { fg = "#cba6f7" })
      vim.api.nvim_set_hl(0, "IblRainbowCyan", { fg = "#94e2d5" })
    end)

    require("ibl").setup({
      indent = {
        highlight = {
          "IblRainbowRed",
          "IblRainbowYellow",
          "IblRainbowBlue",
          "IblRainbowOrange",
          "IblRainbowGreen",
          "IblRainbowViolet",
          "IblRainbowCyan",
        },
      },
    })
  end,
}
