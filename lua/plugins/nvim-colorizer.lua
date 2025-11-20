return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup({
      "*",
      css = { rgb_fn = true, hsl_fn = true, tailwind = true },
      html = { names = true },
    }, {
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      names = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      tailwind = "both",
      mode = "background",
    })
  end,
}
