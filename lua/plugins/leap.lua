return {
  "ggandor/leap.nvim",
  lazy = false,
  dependencies = {
    "ggandor/flit.nvim",
    "ggandor/leap-ast.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local leap = require("leap")
    leap.add_default_mappings()
    leap.opts.highlight_unlabeled_phase_one_targets = true
    leap.opts.safe_labels = "sfjklhodweiraumbcvgt"
    leap.opts.labels = "sfnjklhodweiraumbcvgt"

    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LeapMatch", { fg = "#f5c2e7", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#1e1e2e", bg = "#cba6f7", bold = true })

    require("flit").setup({
      labeled_modes = "nv",
      multiline = false,
    })

    vim.keymap.set({ "n", "x", "o" }, "<leader>a", function()
      require("leap-ast").leap()
    end, { desc = "Leap AST (Blocks/Functions)" })
  end,
}
