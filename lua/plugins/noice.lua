return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  keys = {
    { "<leader>sn", "<cmd>Noice telescope<cr>", desc = "Noice: Search Messages" },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        view = "mini",
      },
      {
        filter = { event = "msg_show", kind = "search_count" },
        view = "mini",
      },
      {
        filter = { event = "msg_show", find = "E%d+:" },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = {
        position = { row = 5, col = "50%" },
        size = { width = 60, height = "auto" },
        border = { style = "rounded" },
        win_options = { winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder" },
      },
      popupmenu = {
        relative = "editor",
        position = { row = 8, col = "50%" },
        size = { width = 60, height = 10 },
        border = { style = "rounded" },
        win_options = { winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder" },
      },
      mini = {
        timeout = 2000,
        position = { row = -2, col = -1 },
        size = "auto",
        border = "none",
        win_options = { winblend = 10 },
      },
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "messages",
      view_search = "virtualtext",
    },
    notify = {
      enabled = true,
      view = "mini",
    },
    commands = {
      history = {
        view = "split",
        opts = { enter = true, format = "details" },
        filter = { any = { { event = "msg_show" }, { event = "notify" } } },
      },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    require("notify").setup({
      background_colour = "#000000",
      fps = 60,
      render = "default",
      stages = "fade",
      timeout = 2000,
      top_down = false,
    })
  end,
}
