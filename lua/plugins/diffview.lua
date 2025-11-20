-- ~/.config/nvim/lua/plugins/diffview.lua
return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: Current File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: All History" },
    { "<leader>gm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diffview: vs Main" },
    { "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "Diffview: Refresh" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
    },
    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "always",
      },
      win_config = {
        position = "left",
        width = 35,
      },
    },
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
            follow = true,
          },
          all_files = {
            diff_merges = "first-parent",
          },
        },
      },
      win_config = {
        position = "bottom",
        height = 16,
      },
    },
    keymaps = {
      disable_defaults = false,
      view = {
        ["<tab>"]     = "<cmd>DiffviewToggleFiles<cr>",
        ["<s-tab>"]   = "<cmd>DiffviewToggleFiles<cr>",
        ["<leader>e"] = "<cmd>DiffviewFocusFiles<cr>",
        ["q"]         = "<cmd>DiffviewClose<cr>",
        ["<c-c>"]     = "<cmd>DiffviewClose<cr>",
      },
      file_panel = {
        ["j"] = "next_entry",
        ["k"] = "prev_entry",
        ["<cr>"] = "select_entry",
        ["s"] = "stage_file",
        ["u"] = "unstage_file",
        ["R"] = "refresh_files",
        ["<tab>"] = "toggle_files",
      },
      file_history_panel = {
        ["g?"] = "help",
        ["<c-a-j>"] = "next_entry",
        ["<c-a-k>"] = "prev_entry",
      },
    },
    hooks = {
      diff_buf_read = function()
        vim.wo.signcolumn = "no"
        vim.wo.number = false
        vim.wo.relativenumber = false
      end,
    },
  },
  config = function(_, opts)
    require("diffview").setup(opts)
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "diffview" then
          vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>DiffviewClose<cr>", { noremap = true, silent = true })
        end
      end,
    })
  end,
}
