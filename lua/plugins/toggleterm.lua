return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { [[<C-\>]], "<cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Toggle main terminal" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.4)
      end
      return 15
    end,

    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    vim.keymap.set("t", "jj", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
  end,
}
