return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    ---@module 'snacks'
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    local opencode = require("opencode")
    vim.g.opencode_opts = {}
    vim.o.autoread = true
    vim.keymap.set({ "n", "x" }, "<leader>cc", function()
      opencode.ask("@this: ", { submit = true })
    end, { desc = "AI: Ask about this" })
    vim.keymap.set({ "n", "x" }, "<leader>cx", function()
      opencode.select()
    end, { desc = "AI: Select Action" })
    vim.keymap.set({ "n", "t" }, "<leader>c", function()
      opencode.toggle()
    end, { desc = "AI: Toggle Chat" })
    vim.keymap.set({ "n", "x" }, "go", function()
      return opencode.operator("@this ")
    end, { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n", "goo", function()
      return opencode.operator("@this ") .. "_"
    end, { desc = "Add line to opencode", expr = true })
    vim.keymap.set("n", "<C-Up>", function()
      opencode.command("session.half.page.up")
    end, { desc = "AI: Scroll Up" })
    vim.keymap.set("n", "<C-Down>", function()
      opencode.command("session.half.page.down")
    end, { desc = "AI: Scroll Down" })
  end,
}
