return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  opts = {
    signs = {
      left = " ",
      right = " ",
      diag = "●",
      arrow = "  ",
      up_arrow = "  ",
      vertical = " │ ",
      vertical_end = " └",
    },
    hi = {
      error = "DiagnosticError",
      warn = "DiagnosticWarn",
      info = "DiagnosticInfo",
      hint = "DiagnosticHint",
    },
    blend = {
      factor = 0.2,
    },
    options = {
      multiple_diag_under_cursor = true,
      show_source = true,
      overflow = {
        mode = "wrap",
      },
    },
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
