return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit: Open" },
    { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit: Current File" },
    { "<leader>gl", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit: File History" },
  },
  config = function()
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_use_neovim_remote = 1
  end,
}
