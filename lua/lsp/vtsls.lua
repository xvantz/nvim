return {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
          entriesLimit = 5000,
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
  on_attach = function(_, bufnr)
    vim.keymap.set(
      "n",
      "<leader>lo",
      "<cmd>VtsExec organize_imports<CR>",
      { buffer = bufnr, desc = "Organize Imports" }
    )
    vim.keymap.set("n", "<leader>lu", "<cmd>VtsExec remove_unused<CR>", { buffer = bufnr, desc = "Remove Unused" })
    vim.keymap.set(
      "n",
      "<leader>la",
      "<cmd>VtsExec add_missing_imports<CR>",
      { buffer = bufnr, desc = "Add Missing Imports" }
    )
    vim.keymap.set(
      "n",
      "<leader>lr",
      "<cmd>VtsExec rename_file<CR>",
      { buffer = bufnr, desc = "Rename File + Update Imports" }
    )
  end,
}
