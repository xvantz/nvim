return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    local colorizer = require("colorizer")

    colorizer.setup({
      "css",
      "scss",
      "sass",
      "less",
      "html",
      "svelte",
      "vue",
      "javascriptreact",
      "typescriptreact",
      "javascript",
      "typescript",
    }, {
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      names = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      tailwind = true,
      mode = "background",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "TelescopePrompt", "TelescopeResults", "TelescopePreviewer" },
      callback = function(args)
        pcall(colorizer.detach_from_buffer, args.buf)
      end,
    })
  end,
}
