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
    { "<leader>gc", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit: File History" },
  },
  config = function()
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_use_neovim_remote = 1

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "lazygit",
      callback = function()
        local opts = { buffer = true, silent = true }
        vim.keymap.set("n", "q", "<cmd>close<cr>", opts)
        vim.keymap.set("n", "<esc>", "<cmd>close<cr>", opts)
        vim.keymap.set("n", "<c-c>", "<cmd>close<cr>", opts)
        vim.keymap.set("n", "gg", "<cmd>top<cr>", opts)
        vim.keymap.set("n", "G", "<cmd>bot<cr>", opts)
      end,
    })
  end,
}
