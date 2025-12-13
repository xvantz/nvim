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

local function is_git_conflicted_file(filepath)
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if not git_root or git_root == "" or git_root:match("^fatal:") then
    return false
  end

  local abs = vim.fn.fnamemodify(filepath, ":p")

  if not abs:find(git_root, 1, true) then
    return false
  end

  local relpath = abs:sub(#git_root + 2)
  local cmd = string.format(
    "cd %s && git diff --name-only --diff-filter=U -- %s",
    vim.fn.shellescape(git_root),
    vim.fn.shellescape(relpath)
  )

  local result = vim.fn.systemlist(cmd)
  return #result > 0 and result[1] ~= ""
end

au("BufReadPost", {
  group = "Core",
  callback = function(args)
    local bufnr = args.buf
    local name = vim.api.nvim_buf_get_name(bufnr)

    if name == "" or vim.bo[bufnr].buftype ~= "" then
      return
    end

    if not is_git_conflicted_file(name) then
      return
    end

    vim.schedule(function()
      vim.cmd("DiffviewOpen")
    end)
  end,
})
