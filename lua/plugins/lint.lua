return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "flake8" },
      lua = { "selene" },
      markdown = { "markdownlint" },
      sh = { "shellcheck" },
    }

    local function get_js_linters()
      local root = vim.fs.find(
        { "biome.json", "biome.jsonc", ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js" },
        { upward = true, path = vim.api.nvim_buf_get_name(0) }
      )[1]
      if not root then
        return {}
      end
      local filename = vim.fn.fnamemodify(root, ":t")

      if filename:find("biome") then
        return { "biomejs" }
      elseif filename:find("eslint") then
        return { "eslint_d" }
      end

      return {}
    end

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        local ft = vim.bo.filetype
        local js_ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

        if vim.tbl_contains(js_ft, ft) then
          lint.try_lint(get_js_linters())
        else
          lint.try_lint()
        end
      end,
    })
  end,
}
