return {
  "stevearc/overseer.nvim",
  keys = {
    { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Overseer: Run task" },
    { "<leader>rq", "<cmd>OverseerQuickRun<CR>", desc = "Overseer: Quick run last" },
    { "<leader>rt", "<cmd>OverseerToggle<CR>", desc = "Overseer: Toggle panel" },
    { "<leader>rc", "<cmd>OverseerClearCache<CR>", desc = "Overseer: Clear cache" },
    { "<leader>rl", "<cmd>OverseerLoadBundle<CR>", desc = "Overseer: Load bundle" },
  },
  opts = {
    strategy = "toggleterm",
    task_list = {
      direction = "bottom",
      min_height = 15,
      max_height = 0.4,
      default_detail = 2,
    },
    component_aliases = {
      { "display_duration", "on_start", "on_complete_notify", "on_exit_save_output" },
    },
    templates = {
      "builtin",
      "user.cpp_build_run",
      "user.node_run",
      "user.python_run",
      "user.go_run",
      "user.rust_run",
    },
  },
  config = function(_, opts)
    require("overseer").setup(opts)

    require("overseer.template").register("user.node_run", {
      name = "npm run dev",
      builder = function()
        return { cmd = { "npm" }, args = { "run", "dev" }, cwd = vim.fn.getcwd() }
      end,
      tags = { overseer.TAG.BUILD },
    })

    require("overseer.template").register("user.python_run", {
      name = "python current file",
      builder = function()
        return { cmd = { "python" }, args = { vim.fn.expand("%:p") } }
      end,
    })

    require("overseer.template").register("user.go_run", {
      name = "go run .",
      builder = function()
        return { cmd = { "go" }, args = { "run", "." }, cwd = vim.fn.getcwd() }
      end,
    })

    require("overseer.template").register("user.rust_run", {
      name = "cargo run",
      builder = function()
        return { cmd = { "cargo" }, args = { "run" }, cwd = vim.fn.getcwd() }
      end,
    })
  end,
}
