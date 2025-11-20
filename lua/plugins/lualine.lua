return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard", "neo-tree", "lazy" },
      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " },
        },
      },
      lualine_c = {
        { "filename", path = 1, symbols = { modified = "󰆓", readonly = "", unnamed = "[No Name]" } },
      },

      lualine_x = {
        {
          function()
            local ok, blink = pcall(require, "blink.cmp")
            if ok and blink.get_status then
              return blink.get_status() == "active" and "CMP" or ""
            end
            return ""
          end,
          color = { fg = "#89b4fa" },
        },
        {
          "lsp_progress",
          display_components = { "lsp_client_name", { "title", "percentage", "message" } },
          timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
          spinner_symbols = { "◜ ", "◠ ", "◝ ", "◞ ", "◡ ", "◟ " },
        },
        {
          function()
            local ok, ts = pcall(require, "nvim-treesitter.parsers")
            if not ok then
              return ""
            end
            local buf = vim.api.nvim_get_current_buf()
            local parser = ts.get_parser(buf)
            return parser and "TS" or ""
          end,
          color = { fg = "#94e2d5" },
        },

        "encoding",
        "fileformat",
        "filetype",
      },

      lualine_y = { "progress", "location" },
      lualine_z = {
        function()
          return os.date("%H:%M")
        end,
      },
    },

    inactive_sections = {
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
    },

    extensions = { "neo-tree", "lazy", "trouble", "mason", "toggleterm" },
  },
}
