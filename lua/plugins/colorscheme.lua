return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { dark = "mocha", light = "latte" },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = { "bold" },
      keywords = { "italic" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { "bold" },
      operators = {},
    },
    integrations = {
      tiny_inline_diagnostic = true,
      noice = true,
      notify = true,
      diffview = true,
      bufferline = true,
      blink_cmp = true,
      lualine = {
        all = function(colors)
          ---@type CtpIntegrationLualineOverride
          return {
            normal = {
              a = { bg = colors.lavender, gui = "italic" },
              b = { fg = colors.lavender },
            },
          }
        end,
        macchiato = {
          normal = {
            a = { bg = "#abcdef" },
          },
        },
      },
      neo_tree = true,
      treesitter = true,
      mason = true,
      which_key = true,
      lazygit = true,
      telescope = { enabled = true },
      indent_blankline = { enabled = true },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
    },
    highlight_overrides = {
      mocha = function(c)
        return {
          CursorLineNr = { fg = c.flamingo, style = { "bold" } },
          LineNr = { fg = c.overlay0 },
          Comment = { fg = c.overlay1, style = { "italic" } },
        }
      end,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
