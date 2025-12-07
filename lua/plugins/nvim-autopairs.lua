return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {},
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",
  },
  config = function(_, opts)
    local npairs = require("nvim-autopairs")

    npairs.setup(opts)
  end,
}
