local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

M.on_attach = function(client, bufnr)
  local map = function(m, k, f, d)
    vim.keymap.set(m, k, f, { buffer = bufnr, desc = "LSP: " .. d })
  end

  map("n", "gd", function()
    require("glance").open("definitions")
  end, "Goto Definition (Glance)")
  map("n", "gD", vim.lsp.buf.declaration, "Declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Implementation")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, "Format")

  if client.supports_method("textDocument/documentHighlight") then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local config_path = vim.fn.stdpath("config") .. "/lua/lsp"
local lsp_files = vim.fn.glob(config_path .. "/*.lua", false, true)

local custom_configs = {}
for _, file in ipairs(lsp_files) do
  local filename = vim.fn.fnamemodify(file, ":t:r")
  if filename ~= "init" then
    local ok, config = pcall(require, "lsp." .. filename)
    if ok then
      custom_configs[filename] = config
    else
      vim.notify("LSP config error: " .. filename, vim.log.levels.WARN)
    end
  end
end

M.enabled_servers = {}

for server_name, _ in pairs(custom_configs) do
  table.insert(M.enabled_servers, server_name)
end

for _, server_name in ipairs(M.enabled_servers) do
  local config = {
    capabilities = M.capabilities,
    on_attach = M.on_attach,
  }

  if custom_configs[server_name] then
    config = vim.tbl_deep_extend("force", config, custom_configs[server_name])
  end

  vim.lsp.config(server_name, config)
end

return M
