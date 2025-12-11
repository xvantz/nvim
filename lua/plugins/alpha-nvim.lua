return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local ok, alpha = pcall(require, "alpha")
    if not ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "██╗  ██╗██╗   ██╗ █████╗ ███╗   ██╗████████╗███████╗",
      "╚██╗██╔╝██║   ██║██╔══██╗████╗  ██║╚══██╔══╝╚══███╔╝",
      " ╚███╔╝ ██║   ██║███████║██╔██╗ ██║   ██║     ███╔╝ ",
      " ██╔██╗ ╚██╗ ██╔╝██╔══██║██║╚██╗██║   ██║    ███╔╝  ",
      "██╔╝ ██╗ ╚████╔╝ ██║  ██║██║ ╚████║   ██║   ███████╗",
      "╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝",
      "              ✦  x v a n t z . n v i m  ✦             ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":lua require('telescope.builtin').find_files()<CR>"),
      dashboard.button("g", "󰈭  Fuzzy grep", ":lua require('telescope.builtin').live_grep()<CR>"),
      dashboard.button("e", "  Explorer   (SPC e)", ":Neotree toggle<CR>"),
      dashboard.button("s", "󰦕  Restore session (SPC q s)", ":lua require('persistence').load()<CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = "  xvantz neovim setup — crafted mode on"

    local height = vim.fn.winheight(0)
    local header_height = #dashboard.section.header.val
    local buttons_height = #dashboard.section.buttons.val
    local footer_height = 1

    local total_height = header_height + buttons_height + footer_height

    local top_padding = math.floor((height - total_height) * 0.3)

    dashboard.opts.layout = {
      { type = "padding", val = top_padding },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    local hl = vim.api.nvim_set_hl
    hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
    hl(0, "AlphaFooter", { fg = "#565f89", italic = true })
    hl(0, "AlphaButtons", { fg = "#a9b1d6" })
    hl(0, "AlphaShortcut", { fg = "#bb9af7" })

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    alpha.setup(dashboard.opts)

    if vim.fn.argc() > 0 then
      return
    end
  end,
}
