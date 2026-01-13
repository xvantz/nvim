local o = vim.opt
vim.g.mapleader = " "

o.fileformats = "unix,dos"
o.fileformat = "unix"
o.fixendofline = true
o.endofline = true
o.bomb = false

o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.splitright = true
o.splitbelow = true

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.wrap = false

o.updatetime = 200
o.timeoutlen = 400

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  underline = true,
  update_in_insert = false,
  float = { border = "rounded", source = "if_many" },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})
vim.o.signcolumn = "yes"

if vim.fn.has("wsl") and vim.fn.executable("wl-copy") and vim.fn.executable("wl-paste") then
  vim.g.clipboard = {
    name = "wl-clipboard (wsl)",
    copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
    paste = { ["+"] = "wl-paste --no-newline", ["*"] = "wl-paste --no-newline" },
    cache_enabled = 0,
  }
end
o.clipboard = "unnamedplus"

if vim.fn.has("wsl") and vim.env.TMUX and not vim.fn.executable("wl-copy") then
  vim.schedule(function()
    vim.notify(
      "WSL detected + tmux clipboard active.\nInstall wl-clipboard for Windows clipboard integration.",
      vim.log.levels.INFO
    )
  end)
end
