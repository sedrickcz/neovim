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

### LSP and Development Tools
- Inside Neovim: `:Mason` - Open Mason package manager for LSP servers, formatters, and linters
- Inside Neovim: `:checkhealth` - Check health of Neovim and plugins

## Architecture

### Core Structure
- `init.lua` - Entry point that bootstraps the configuration by requiring `config.lazy`
- `lua/config/` - Core configuration files
  - `lazy.lua` - Lazy.nvim setup and plugin specification
  - `options.lua` - Neovim options (currently empty, inherits LazyVim defaults)
  - `keymaps.lua` - Custom keymaps (currently empty, inherits LazyVim defaults)
  - `autocmds.lua` - Auto commands (currently empty, inherits LazyVim defaults)
- `lua/plugins/` - Plugin specifications and overrides
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
- `lazyvim.json` - LazyVim-specific settings
- `stylua.toml` - Lua code formatting configuration

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