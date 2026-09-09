# What changed

## Deleted

| File | Why |
| --- | --- |
| `lua/plugins/lsp-configue.lua` | Its `config` function replaced LazyVim's entire LSP setup, which killed inlay hints, the diagnostics config, and `go.lua`'s gopls settings. It also installed `ts_ls` alongside the extra's `vtsls`, so every TS diagnostic appeared twice. |
| `lua/plugins/treesitter.lua` | Same override problem, plus it used the old `nvim-treesitter.configs` API that doesn't exist on the `main` branch. LazyVim configures treesitter already. |
| `lua/plugins/lualine.lua` | Same override problem, and `option` was a typo for `options` so the theme never applied. LazyVim's statusline picks up catppuccin on its own. |
| `lua/plugins/telescop.lua` | LazyVim no longer uses telescope as its picker. `<C-p>` and `<leader>fw` now go through `LazyVim.pick`, in `config/keymaps.lua`. |
| `lua/plugins/example.lua` | Started with `if true then return {} end` — inert. |
| `lua/set.lua`, `lua/remaps.lua` | Never loaded by anything. Contents merged into `config/options.lua` and `config/keymaps.lua`. |
| `lua/.luarc.json`, `lua/plugins/.luarc.json` | Duplicates of the root one. |

## Added / rewritten

- **`lua/plugins/lsp.lua`** — new. Turns on inlay hints and switches diagnostics to `virtual_lines`, so long messages wrap instead of disappearing off the right edge.
- **`lua/plugins/neotree.lua`** — the old `config` function never called `require("neo-tree").setup()`, so neo-tree ran with no configuration at all. Now just a `keys` entry for `<C-n>`.
- **`lua/plugins/motions.lua`** — the mappings contained a stray `<C-U>` inside `<cmd>`, which made them invalid. Also dropped `lazy = false`, which contradicted `keys`.
- **`lua/plugins/conform.lua`** — removed the `format_on_save` block; LazyVim owns format-on-save and its version respects `<leader>uf`.
- **`lazyvim.json`** — added the `ui.alpha` extra, which stops alpha and `snacks.dashboard` fighting over the start screen.

## Unchanged

`init.lua`, `config/lazy.lua`, `config/autocmds.lua`, `plugins/go.lua`, `plugins/theme.lua`, `plugins/surround.lua`, `plugins/alpha.lua`, `plugins/opencode.lua`, `lazy-lock.json`.

`go.lua` was silently doing nothing before, since the old LSP file ignored `opts`. It works now.

## Things to check yourself

- **`:version`** — `virtual_lines` needs Neovim 0.11+. If you're older, open `lua/plugins/lsp.lua` and delete the `virtual_lines` line; use `<leader>cd` to read long diagnostics in a float instead.
- **`:checkhealth mason`** — look at the Languages section for `Go`. Mason builds gopls with `go install`, so a missing or outdated Go toolchain is the usual cause of that install error. `brew install go`, then `:MasonInstall gopls`.
- **Indentation and `hlsearch`** — these were in `set.lua`, which never ran, so they're commented out in `config/options.lua`. Uncomment if you want 4-space indents and no search highlight.

## Useful LazyVim keys you now have back

| Key | Does |
| --- | --- |
| `<leader>uh` | Toggle inlay hints |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uf` | Toggle format-on-save |
| `K` | Hover / type info |
| `<C-s>` | Save |
| `<leader>qq` | Quit |
