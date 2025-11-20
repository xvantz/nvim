return {
  "ggandor/leap.nvim",
  dependencies = {
    "ggandor/flit.nvim",
    "ggandor/leap-ast.nvim",
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    { "<leader>j", mode = { "n", "x", "o" }, desc = "Leap: Jump to word" },
    { "<leader>J", mode = { "n", "x", "o" }, desc = "Leap: Jump to line" },
    { "<leader>fa", mode = { "n", "x", "o" }, desc = "Leap: AST node (function/class)" },
  },
  config = function()
    local leap = require("leap")

    leap.add_default_mappings(true)

    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LeapMatch", { bg = "#f5c2e7", fg = "#1e1e2e", bold = true })
    vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#cba6f7", bold = true })
    vim.api.nvim_set_hl(0, "LeapLabelSecondary", { fg = "#89dceb", bold = true })

    leap.opts.highlight_unlabeled_phase_one_targets = true
    leap.opts.safe_labels = {}
    leap.opts.labels = "sfnjklhodweiraumbcvgt"

    require("flit").setup({ labeled_modes = "nv" })

    vim.keymap.set({ "n", "x", "o" }, "<leader>fa", function()
      require("leap-ast").leap()
    end, { desc = "Leap AST nodes" })

    vim.keymap.set({ "n", "x", "o" }, "<leader>j", function()
      leap.leap({
        target_windows = vim.tbl_filter(function(win)
          return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0)),
      })
    end, { desc = "Leap: Jump to word (all windows)" })

    vim.keymap.set({ "n", "x", "o" }, "<leader>J", function()
      leap.leap({ targets = require("leap.util").get_line_targets() })
    end, { desc = "Leap: Jump to line" })
  end,
}
