require("nvchad.configs.lspconfig").defaults()
local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
  "html",
  "cssls",
  "lua-language-server",
  "gopls",
  "gradle_ls",
  "csharp-language-server",
  "css-lsp",
  "css-variables-language-server",
  "cssmodules-language-server",
  "json-lsp",
  "oxlint",
  "rust-analyzer",
  "svelte",
  "typescript-language-server"
  }


vim.lsp.config('gopls', {
  capabilities = blink_capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" }
    }, bufnr)
  end
})

vim.lsp.config('gradle_ls', {
  capabilities = blink_capabilities,
  cmd = { "gradle-language-server" },
  filetypes = {"groovy"},
  init_options = {
    settings = {
      gradleWrapperEnabled = true
    }
  },
  root_markers = {"settings.gradle", "build.gradle"}
})

vim.lsp.config('typescript-language-server', {
  capabilities = blink_capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "svelte", "vue" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" }
    }, bufnr)
  end
})

vim.lsp.config('csharp-language-server', {
  capabilities = blink_capabilities,
  cmd = {"csharp-ls"},
  filetypes = { "cs" },
  init_options = {AutomaticWorkspaceInit = true},
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" }
    }, bufnr)
  end
})

vim.lsp.config('css-lsp', {
  capabilities = blink_capabilities,
  cmd = {"vscode-css-language-server", "--stdio"},
  filetypes = {"css", "scss", "less"},
  init_options = {provideFormatter = true},
  root_markers = {"package.json", ".git"},
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" }
    }, bufnr)
  end
})

vim.lsp.config('cssmodules-language-server', {
  capabilities = blink_capabilities,
  cmd = {"cssmodules-language-server"},
  filetypes = { "javascriptreact", "typescriptreact", "svelte", "vue"},
  root_markers = {"package.json"},
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" }
    }, bufnr)
  end
})

vim.lsp.config('css-variables-language-server', {
  capabilities = blink_capabilities,
  cmd = {"css-variables-language-server", "--stdio"},
  filetypes = {"css", "scss", "less"},
  root_markers = {"package.json", ".git"},
  settings = {
    cssVariables = {
      blacklistFolders = { "**/.cache", "**/.DS_Store", "**/.git", "**/.hg", "**/.next", "**/.svn", "**/bower_components", "**/CVS", "**/dist", "**/node_modules", "**/tests", "**/tmp" },
      lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" }
    }
  }
})

vim.lsp.config('json-lsp', {
  capabilities = blink_capabilities,
  cmd = {"vscode-json-language-server", "--stdio"},
  filetypes = {"json", "jsonc"},
  init_options = {provideFormatter = true},
  root_markers = {".git"}
})

vim.lsp.config('oxlint', {
  capabilities = blink_capabilities,
  cmd = { "oxc_language_server" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
})

vim.lsp.config('rust_analyzer', {
  capabilities = {
    experimental = {
      serverStatusNotification = true
    }
  }
})

vim.lsp.config('svelte', {
  capabilities = blink_capabilities,
  cmd = {"svelteserver", "--stdio"},
  filetypes = {"svelte"},
  root_markers = {"package.json", ".git"},
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" }
    }, bufnr)
  end
})

vim.lsp.enable(servers)
