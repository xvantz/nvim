require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<C-z>", "u", { desc = "undo" })
map("n", "<C-b>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to defenition" })
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })
map("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<C-q>", function()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }

  if #bufs <= 1 then
    vim.cmd "q" -- последний буфер → закрываем Neovim
  else
    vim.cmd "bd" -- иначе просто закрываем буфер
  end
end, { desc = "Close buffer", silent = true })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Normal Mode: комментировать строку
map("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })

-- Visual Mode: комментировать выделение
map("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })

-- Insert Mode: выйти в normal, комментировать, вернуться
map("i", "<C-_>", "<Esc>gccgi", { remap = true, desc = "Toggle comment from insert" })
map({ "n", "i" }, "<C-k>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })
-- find mappings
map("n", "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Поиск по текущему файлу (Telescope)" })
map("n", "<leader>F", function()
  require("telescope.builtin").live_grep()
end, { desc = "Поиск по всем файлам (Telescope)" })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Список проектов (project.nvim)" })
