-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Show dependency versions
vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })

-- Hide dependency versions
vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })

-- Toggle dependency versions
vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })

-- Update dependency on the line
vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })

-- Delete dependency on the line
vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })

-- Install a new dependency
vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })

-- Install a different dependency version
vim.keymap.set({ "n" }, "<LEADER>np", require("package-info").change_version, { silent = true, noremap = true })

local function toggle_inlay_hints()
  local inlay_hint = vim.lsp.inlay_hint
  if not inlay_hint then
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()

  if type(inlay_hint) == "table" and inlay_hint.enable then
    local enabled = false
    if inlay_hint.is_enabled then
      local ok, value = pcall(inlay_hint.is_enabled, { bufnr = bufnr })
      if ok then
        enabled = value
      else
        local ok_legacy, legacy_value = pcall(inlay_hint.is_enabled, bufnr)
        if ok_legacy then
          enabled = legacy_value
        end
      end
    end

    local ok = pcall(inlay_hint.enable, not enabled, { bufnr = bufnr })
    if not ok then
      pcall(inlay_hint.enable, bufnr, not enabled)
    end
  elseif type(inlay_hint) == "function" then
    vim.b.inlay_hints_enabled = not vim.b.inlay_hints_enabled
    inlay_hint(bufnr, vim.b.inlay_hints_enabled)
  end
end

vim.keymap.set("n", "<leader>ti", toggle_inlay_hints, { desc = "Toggle Inlay Hints", silent = true, noremap = true })
