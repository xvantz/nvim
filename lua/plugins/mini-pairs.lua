return {
  "echasnovski/mini.pairs",
  event = "InsertEnter",
  version = "*",
  config = function()
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },

      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],

      markdown = true,

      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
      },
    })

    local map = function(lhs, rhs, desc)
      vim.keymap.set("i", lhs, rhs, { buffer = true, desc = desc })
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        local pairs = { ")", "]", "}", '"', "'", "`" }
        for _, close in ipairs(pairs) do
          local open = close
          if close == ")" then
            open = "("
          elseif close == "]" then
            open = "["
          elseif close == "}" then
            open = "{"
          end
          map(close, function()
            local col = vim.fn.col(".") - 1
            if vim.fn.getline("."):sub(col + 1, col + 1) == close then
              return "<Right>"
            else
              return close
            end
          end, "Skip closing " .. close, { expr = true })
        end
      end,
    })
  end,
}
