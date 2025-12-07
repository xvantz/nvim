return {
  "windwp/nvim-ts-autotag",
  events = "InsertEnter",
  opts = {
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close_on_slash = true,
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "xml",
      },
    },
  },
}
