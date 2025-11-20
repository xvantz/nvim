local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

aug("Core", { clear = true })

au("TextYankPost", {
  group = "Core",
  callback = function()
    vim.highlight.on_yank()
  end,
})

au("BufWritePre", {
  group = "Core",
  callback = function()
    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({ lsp_fallback = true, timeout_ms = 2000 })
    end
  end,
})
