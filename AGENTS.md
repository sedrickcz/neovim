# Repository Guidelines

## Project Structure & Module Organization
This config is anchored by `init.lua`, which bootstraps LazyVim and wires the local modules. Runtime tuning lives in `lua/config/` (per-file tables for options, keymaps, autocmds, and lazy setup). Plugin specs reside in `lua/plugins/`, each returning a table consumed by lazy.nvim; keep related tweaks in a dedicated file. Post-load adjustments belong under `plugin/after/`. `lazy-lock.json` is auto-generated; update it only through Lazy commands. `stylua.toml` controls formatting defaults.

## Build, Test, and Development Commands
Use `nvim --headless "+Lazy! sync" +qa` after dependency changes to install or update plugins. Run `nvim --headless -c "checkhealth"` to confirm core providers are available. `nvim --headless "+MasonUpdate" +qa` keeps language servers aligned. When changing tooling versions, run `mise install` to refresh local runtimes.

## Coding Style & Naming Conventions
Format Lua with `stylua lua/ plugin/ init.lua`. Follow the repo defaults: two-space indents, 120 column width, double-quoted strings for plugin ids, and trailing commas in multi-line tables. Use snake_case for local variables and option keys; reserve PascalCase for modules exported via `return`. Prefer concise inline comments over block comments and align plugin opts in the order LazyVim expects (`lazy`, `priority`, `opts`, `config`).

## Testing Guidelines
For plugin edits, reload in place with `nvim --headless "+lua require('lazy').reload()" +qa` and confirm there are no startup errors. Validate visual changes by launching Neovim normally and using `:Lazy show` for plugin status. When altering LSP tooling, open a target language file and ensure diagnostics or inlay hints behave as intended, noting any regressions in the PR.

## Commit & Pull Request Guidelines
Commits follow Conventional Commits (`feat:`, `fix:`, `chore:`), with imperative summaries under 72 characters. One logical change per commit keeps diffs reviewable. Pull requests should include: concise description, testing commands run, screenshots for UI shifts, and references to related issues or discussion. Highlight any impacts to `lazy-lock.json` or runtime dependencies so reviewers can reproduce quickly.

## Agent Tips
Work within this repo only; avoid touching the user's broader Neovim config directory. Skip manual edits to generated files and prefer configuration overrides via `lua/plugins/` modules. Document new commands or workflows directly in this guide to keep future automation aligned.
