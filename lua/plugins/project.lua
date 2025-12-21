return {
  {
    "coffebar/neovim-project",
    keys = {
      { "<leader>fp", "<cmd>NeovimProjectHistory<CR>", desc = "select a project from your recent history" },
    },
    opts = {
      projects = {
        "~/projects/*",
        "~/p*cts/*",
        "~/projects/repos/*",
        "~/.config/*",
        "~/work/*",
      },
      datapath = vim.fn.stdpath("data"),
      last_session_on_startup = true,
      dashboard_mode = false,
      filetype_autocmd_timeout = 200,
      forget_project_keys = {
        i = "<C-d>",
        n = "d",
      },
      follow_symlinks = "full",
      per_branch_sessions = false,
      debug_logging = false,
      session_manager_opts = {
        autosave_ignore_dirs = {
          vim.fn.expand("~"),
          "/tmp",
        },
        autosave_ignore_filetypes = {
          "ccc-ui",
          "dap-repl",
          "dap-view",
          "dap-view-term",
          "gitcommit",
          "gitrebase",
          "qf",
          "toggleterm",
        },
      },
      picker = {
        type = "telescope",

        preview = {
          enabled = true,
          git_status = true,
          git_fetch = false,
          show_hidden = true,
        },
      },
    },
    init = function()
      vim.opt.sessionoptions:append("globals")
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
}
