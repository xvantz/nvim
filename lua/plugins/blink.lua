return {
  "saghen/blink.cmp",
  lazy = false,
  version = "v0.*",
  build = "cargo build --release",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = {
      preset = "super-tab",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = { score_offset = 2 },
        path = { score_offset = 1 },
        snippets = { score_offset = 0 },
        buffer = { score_offset = -1 },
      },
    },

    completion = {
      trigger = {
        show_on_keyword = true,
      },
      menu = {
        auto_show = true,
      },
    },

    fuzzy = {
      implementation = "rust",
    },

    cmdline = {
      keymap = { preset = "inherit" },

      completion = {
        menu = {
          auto_show = function()
            local t = vim.fn.getcmdtype()
            return t == ":" or t == "@"
          end,
        },
      },
    },
  },
  config = function(_, opts)
    require("blink.cmp").setup(opts)
  end,
}
