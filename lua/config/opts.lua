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
  signs = true,
  underline = true,
  update_in_insert = false,
  float = { border = "rounded", source = "if_many" },
  severity_sort = true,
})
vim.o.signcolumn = "yes"
local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

o.clipboard = "unnamedplus"
