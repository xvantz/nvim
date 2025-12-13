return {
  "stevearc/overseer.nvim",
  dependencies = {
    "akinsho/toggleterm.nvim",
  },
  keys = {
    { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Overseer: Run task" },
    { "<leader>rt", "<cmd>OverseerToggle!<CR>", desc = "Overseer: Toggle panel" },
    {
      "<leader>rs",
      function()
        local overseer = require("overseer")

        vim.ui.input({
          prompt = "Overseer shell> ",
          -- completion = "shellcmd",
          default = "",
        }, function(cmdline)
          if cmdline == nil or cmdline:match("^%s*$") then
            print("Task cancelled or empty.")
            return
          end
          vim.cmd("OverseerShell " .. cmdline)
        end)
      end,
      desc = "Overseer: run shell command",
    },
  },
  opts = {
    strategy = "toggleterm",
    task_list = {
      direction = "bottom",
      min_height = 15,
      max_height = 0.4,
      default_detail = 2,
    },
    templates = {
      "builtin",
    },
  },
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    overseer.register_template({
      name = "npm run dev",
      builder = function()
        return {
          cmd = { "npm" },
          args = { "run", "dev" },
          cwd = vim.fn.getcwd(),
        }
      end,
      tags = { overseer.TAG.BUILD },
    })

    overseer.register_template({
      name = "python current file",
      builder = function()
        return {
          cmd = { "python" },
          args = { vim.fn.expand("%:p") },
        }
      end,
    })

    overseer.register_template({
      name = "go run .",
      builder = function()
        return {
          cmd = { "go" },
          args = { "run", "." },
          cwd = vim.fn.getcwd(),
        }
      end,
    })

    overseer.register_template({
      name = "cargo run",
      builder = function()
        return {
          cmd = { "cargo" },
          args = { "run" },
          cwd = vim.fn.getcwd(),
        }
      end,
    })
  end,
}
