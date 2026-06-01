# nvim-lsp — Neovim config

This is `~/.config/nvim-lsp`, a Neovim configuration managed by **lazy.nvim** (bootstrapped in `init.lua:4-14`). No npm/pip/build tooling — this is a runtime config only.

## Structure

| Path | Purpose |
|------|---------|
| `init.lua` | Entrypoint: loads `core/` then `lazy.setup({ import = "plugins" })` |
| `lua/core/options.lua` | Editor options (tabs, search, statusline, filetype-specific indent) |
| `lua/core/keymaps.lua` | Global leader maps (`<Space>` is leader) |
| `lua/plugins/*.lua` | One file per plugin, lazy.nvim spec format |
| `ftplugin/java.lua` | Java LSP only (nvim-jdtls + lombok), **not** via `lspconfig` |

## Keymaps (scattered, not in one place)

All use `<Space>` as leader:

- **Core**: `x`=Netrw, `q`=quit, `w`=write, `n`/`p`=next/prev buffer, `h`=nohl
- **LSP** (`lua/plugins/lsp.lua:57-81`): `gd`/`gc`/`gr`/`gi`/`gy`=navigate, `K`=hover, `<C-k>`=signature, `<leader>rn`=rename, `<leader>ca`=code action, `<leader>ws`=workspace symbol, `<leader>f`=format, `[d`/`]d`=diagnostics
- **Telescope** (`lua/plugins/telescope.lua:28-53`): `<leader>t{f,l,b,h,g,w,s,o,m,z,t,c,k,d}` — find files, live grep, buffers, etc.
- **Fugitive** (`lua/plugins/fugitive.lua:3-10`): `<leader>gs`=Git, `gd`=Gvdiffsplit, `gh`=Ghdiffsplit, `gw`=Git add %, `gc`=Git commit
- **NERDTree** (`lua/plugins/nerdtree.lua:3-8`): `<leader>l{f,l,t,F}` — focus/open/toggle/find
- **Refactoring** (`lua/plugins/refactor.lua:8-58`): `<leader>r{f,ff,v,if,iv,b,bf}` — extract/inline, visual mode aware
- **Undotree**: `<leader>u`
- **Java** (`ftplugin/java.lua:9-14`): `<leader>i`=organize imports, `<leader>em`/`ev`/`ec`=extract method/variable/constant

## Notable quirks

- **Harpoon is disabled** (`lua/plugins/harpoon.lua:3` — `enabled = false`)
- **Treesitter** has both a commented-out old config block and an active `opts`-based setup in the same file (`lua/plugins/treesitter.lua`)
- **Java LSP** is configured via `ftplugin/java.lua` using `nvim-jdtls` directly (not through `lspconfig`), with lombok agent and `nvim-cmp` capabilities
- **LSP servers** auto-enabled: `lua_ls` and `pyright` only (see `lua/plugins/lsp.lua:52-55`)
- **Completion**: nvim-cmp with LuaSnip snippet engine, mapped to `<C-c>` abort, `<CR>` confirm, `<C-n>`/`<C-p>` navigate
- **`.gitignore`** only ignores legacy `packer_compiled.lua` (leftover from packer.nvim, not used anymore)
- No `opencode.json` exists — add one if you need custom instructions or agents
