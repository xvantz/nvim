# Neovim Config Guide

An opinionated Neovim configuration powered by `lazy.nvim`, Catppuccin, Treesitter, and a hand-picked plugin suite for TypeScript/Svelte/Go/Lua workflows. This document explains what you need, how to install everything, and the key mappings and commands that make the setup tick.

## Requirements

- **Neovim** 0.11+ (0.11 recommended for `vim.lsp.config` and the new `vim.fs` helpers).
- **Git** for bootstrapping plugins via `lazy.nvim`.
- Build tooling: `gcc`/`clang`, `make`, and **Rust `cargo`** (required because `blink.cmp` compiles a Rust binary) plus **Go** if you rely on Go tooling.
- **ripgrep** (used by Telescope) and ideally `fd`.
- Runtime CLIs: `node` + `npm`/`pnpm`, `python3`, `go`, and `dotnet` to install/execute certain LSP servers or formatters that Mason does not ship (`csharp-ls`, `svelteserver`, `tailwindcss-language-server`, etc.).
- Optional but recommended: `lazygit`, `stylua`, `prettierd`, `eslint_d`, `black`, `isort`, `flake8`, `shellcheck`, `markdownlint`. Mason/Mason Tool Installer will attempt to install most of these automatically once the binaries above exist on your `$PATH`.

## Installation

1. Back up your existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   ```
2. Clone this repository into `~/.config/nvim`:
   ```bash
   git clone https://github.com/xvantz/nvim.git ~/.config/nvim
   ```
3. Start Neovim. `lazy.nvim` bootstraps itself, syncs plugins, and then `mason-tool-installer` will fetch the declared LSP/formatter binaries. The first launch can take a bit—watch the status-line spinner and Noice notifications.
4. Trigger a health check when everything settles:
   ```vim
   :checkhealth
   ```
5. Install any remaining external tools Mason cannot provide (see Requirements) and restart Neovim.

### Updating / Maintenance

- `:Lazy sync` installs new plugins/updates. `:Lazy check` reports available updates.
- `:Mason` opens the mason UI to manage language servers manually.
- Commit `lazy-lock.json` whenever plugin versions change to keep machines in sync.

## Language Tooling

| Language / Domain          | LSP Server                                                                                                                | Notes                                                                                                                          |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Lua                        | `lua_ls`                                                                                                                  | Picks up Neovim runtime files, disables telemetry.                                                                             |
| TypeScript/JavaScript/Vue  | `vtsls`                                                                                                                   | Extra commands: `<leader>lo` organize imports, `<leader>lu` remove unused, `<leader>la` add missing, `<leader>lr` rename file. |
| Tailwind / CSS / HTML      | `tailwindcss-language-server`, `cssls`, `html`                                                                            | Tailwind server auto-detects configs and enforces linting rules.                                                               |
| Svelte                     | `svelteserver`                                                                                                            | Includes `:LspMigrateToSvelte5`. Watches `.ts/.js` writes to keep the compiler in sync.                                        |
| Go                         | `gopls`                                                                                                                   | Staticcheck + gofumpt enabled.                                                                                                 |
| C#                         | `csharp-ls`                                                                                                               | Install via `dotnet tool install -g csharp-ls`.                                                                                |
| Markdown, JSON, Bash, Rust | Mason ensures `marksman`, `jsonls`, `bashls`, `rust_analyzer` are installed; drop new configs into `lua/lsp` to add more. |

Formatting is handled by **Conform** (`<leader>f` or auto on save), and linting by **nvim-lint** (runs after every write). Tree-sitter parsers for the listed languages auto-install and register colorful indentation guides (indent-blankline) and advanced text-objects.

## Daily Workflow Cheat Sheet

### Core habits

- **Leader** is `<Space>`. Press `<Space>` and pause to see the **which-key** pop-up describing the next keys.
- `jj` exits insert mode. `<leader>w` saves, `<leader>q` quits.
- Diagnostics: `K` hover, `gd/gr` go to definition/references, `[c` / `]c` jump between Git hunks, `<leader>ca` code actions, `<leader>rn` rename.

### Navigation & files

- File explorer (**neo-tree**): `<leader>e` toggle, `<leader>o` focus; closes automatically when returning to a file window.
- Buffers (**bufferline**): `<S-h>/<S-l>` cycle, `<leader>1-9` jump directly, `<leader>bp` pin, `<leader>bo` close others.
- Window management (**smart-splits**):
  - Move with `<C-h/j/k/l>`
  - Resize with `<C-Left/Down/Up/Right>`
  - Swap buffers with `<leader>wh/wj/wk/wl>`
- Jumping (**leap + flit**): `s` and `S` leap forward/backward, `<leader>j` search all windows, `<leader>J` jump by line, `<leader>fa` select AST nodes.

### Search & Telescope

- `<leader>ff` files, `<leader>fg` live grep (respects `rg` ignore rules), `<leader>fb` buffers, `<leader>fr` recent files, `<leader>ft` TODO comments, `<leader>f:` command history, `<leader>fk` keymaps.
- Prompt mappings: `<C-j>/<C-k>` move selection, `<C-l>` toggle preview, `<C-h>` pop which-key hints, `<C-q>` send to quickfix.

### Git

- **Gitsigns**: `[c`/`]c` next/prev hunk, `<leader>hs` stage hunk, `<leader>hu` undo stage, `<leader>hp` preview, `<leader>tb` toggle inline blame.
- **LazyGit** integration: `<leader>gg` main UI, `<leader>gf` current file, `<leader>gc` file history.
- **Diffview**: `<leader>gD` open diff, `<leader>gm` diff vs `origin/main`, `<leader>gh` file history, `<leader>gc` close pane.

### LSP, completion, diagnostics

- **blink.cmp** provides `super-tab` completion (`<Tab>/<S-Tab>` to navigate, `<CR>` to confirm).
- **tiny-inline-diagnostic** inlines diagnostic messages with clean Catppuccin colors. Toggle floating windows with `K`.
- **Noice + nvim-notify** replace native messages (`<leader>sn` Telescope picker, `<leader>sd` clear, `<leader>nl` last notification, `<leader>nh` history).

### Formatting, linting & commenting

- `<leader>f` format with Conform (sync). Formats automatically on save with tool-specific settings (e.g., `stylua`, `prettierd`, `black`, `gofmt`, `shfmt`).
- `gcc`, `gc`, `gbc`, etc., from **Comment.nvim** (with context-aware comment strings).
- Autopairs, autotagging, and rainbow indentation are enabled whenever Treesitter supports the language.

### Tasks & sessions

- **Overseer** task runner:
  - `<leader>rr` run a task template (includes ready-made `npm run dev`, `python current file`, `go run .`, `cargo run`).
  - `<leader>rq` quick-run previous, `<leader>rt` toggle task pane, `<leader>rc` clear cache, `<leader>rl` load bundle.
- **persistence.nvim** sessions:
  - `<leader>qs` restore last session, `<leader>ql` restore previous workspace, `<leader>qd` stop saving sessions.

### Miscellaneous helpers

- `<leader>ft` / `<leader>xt` list TODO/FIXME comments (Telescope or Trouble).
- `<leader>sn` / `<leader>sd` for Noice messages.
- Inline color highlighting for CSS/Svelte/JS thanks to `nvim-colorizer`.
- Lualine shows LSP/Treesitter/Completion status plus the current time.

## Customization Tips

- Basic options in `lua/config/opts.lua`, additional mappings in `lua/config/keymaps.lua`, and autocommands in `lua/config/autocmds.lua`.
- Plugins live under `lua/plugins/*.lua`. Each file returns a Lazy spec, so you can remove/disable features by deleting or editing an individual file rather than touching `init.lua`.
- Language-specific overrides reside in `lua/lsp/<server>.lua`. Add a new server alongside the others, and `lua/lsp/init.lua` automatically registers it with `vim.lsp.config`.
- Colorscheme tweaks happen inside `lua/plugins/colorscheme.lua`; adjust Catppuccin integrations there.

## Troubleshooting

- Run `:checkhealth` after installing new toolchains.
- If Treesitter highlights misbehave, run `:TSUpdate` or delete the `parser` directory inside `~/.local/share/nvim`.
- Mason errors usually indicate a missing external runtime (e.g., no `npm` or `go`). Install the runtime and rerun `:Mason`.
- Blink completion fails to compile without Rust—install `rustup` and rerun `:Lazy build blink.cmp`.
- When in doubt, remove `~/.local/share/nvim/lazy` and restart Neovim to let `lazy.nvim` rebuild.

Happy editing!
