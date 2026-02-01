# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on LazyVim, a modern Neovim distribution. The configuration uses the Lazy.nvim plugin manager and follows LazyVim's conventions and structure.

## Commands

### Code Formatting
- `stylua .` - Format Lua code according to the stylua.toml configuration (2-space indentation, 120 column width)

### Plugin Management
- Inside Neovim: `:Lazy` - Open the Lazy.nvim plugin manager interface
- Inside Neovim: `:Lazy sync` - Sync plugins (install/update/clean)
- Inside Neovim: `:Lazy clean` - Remove unused plugins
- Inside Neovim: `:Lazy update` - Update plugins
- Inside Neovim: `:Lazy reload` - Reload plugin configurations after changes

### LSP and Development Tools
- Inside Neovim: `:Mason` - Open Mason package manager for LSP servers, formatters, and linters
- Inside Neovim: `:checkhealth` - Check health of Neovim and plugins
- Inside Neovim: `<leader>tt` - Toggle package-info display for package.json files

### Auto-installed Tools
Mason automatically installs these tools:
- **Formatters**: stylua, prettier, shfmt
- **Linters**: eslint-lsp, flake8, shellcheck
- **Language Servers**: vtsls (TypeScript/Vue), vue-language-server, tailwindcss-language-server

## Architecture

### Core Structure
- `init.lua` - Entry point that bootstraps the configuration by requiring `config.lazy`
- `lua/config/` - Core configuration files
  - `lazy.lua` - Lazy.nvim setup and plugin specification
  - `options.lua` - Neovim options (currently empty, inherits LazyVim defaults)
  - `keymaps.lua` - Custom keymaps (currently empty, inherits LazyVim defaults)
  - `autocmds.lua` - Auto commands (currently empty, inherits LazyVim defaults)
- `lua/plugins/` - Plugin specifications and overrides
  - `theme.lua` - Everforest colorscheme configuration
  - `lsp.lua` - LSP configurations for web development (Mason, vtsls, ESLint, Prettier)
  - `package-info.lua` - Package.json dependency version display for Node.js projects
  - `wakatime.lua` - WakaTime time tracking integration
  - `example.lua` - Example plugin configurations (currently disabled)

### Plugin Management Philosophy
The configuration follows LazyVim's layered approach:
1. **LazyVim core** - Provides sensible defaults and plugin configurations
2. **LazyVim extras** - Optional plugin bundles for specific languages/features
3. **Custom plugins** - User-defined plugin specifications in `lua/plugins/`

### Configuration Pattern
- Configuration files in `lua/config/` are automatically loaded by LazyVim
- Plugin files in `lua/plugins/` are automatically loaded by Lazy.nvim
- The `example.lua` plugin file demonstrates various configuration patterns but is disabled by default
- Custom configurations should extend or override LazyVim defaults rather than replace them entirely

### Key Configuration Files
- `lazy-lock.json` - Locks plugin versions for reproducible installs
- `lazyvim.json` - LazyVim-specific settings and enabled extras (Copilot, Harpoon2, mini-hipatterns)
- `stylua.toml` - Lua code formatting configuration
- `mise.toml` - Tool version management (Ruby)

### Current LazyVim Extras
The configuration includes these LazyVim extras:
- `lazyvim.plugins.extras.ai.copilot` - GitHub Copilot integration
- `lazyvim.plugins.extras.editor.harpoon2` - Quick file navigation
- `lazyvim.plugins.extras.util.mini-hipatterns` - Enhanced pattern highlighting

### Web Development Focus
This configuration is optimized for web development with:
- **TypeScript/Vue**: vtsls with Vue plugin support, replacing volar
- **ESLint**: Configured for real-time linting and code actions
- **Prettier**: Auto-formatting for JS/TS/Vue/HTML/CSS/JSON files
- **Tailwind CSS**: Language server with conflict detection and validation
- **Package Info**: Live package.json dependency version display (`<leader>tt` to toggle)

## Development Workflow

When modifying this configuration:
1. Edit files in `lua/config/` for core Neovim settings
2. Add new plugin specifications in `lua/plugins/` directory
3. Use the example patterns in `lua/plugins/example.lua` as reference
4. Test changes by restarting Neovim or using `:Lazy reload`
5. Format Lua code with `stylua .` before committing changes

## Plugin Configuration Patterns

The configuration supports several patterns for plugin management:
- **Adding new plugins**: Create plugin specs in `lua/plugins/`
- **Overriding LazyVim plugins**: Specify the same plugin with custom opts
- **Disabling plugins**: Set `enabled = false` in plugin spec
- **Importing extras**: Use `{ import = "lazyvim.plugins.extras.lang.typescript" }` pattern
- **Extending configurations**: Use opts functions to merge with existing config