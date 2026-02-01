-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function disable_ts_vue_inlay_hints(event)
  local inlay_hint = vim.lsp.inlay_hint
  if not inlay_hint then
    return
  end

  local ft = vim.bo[event.buf].filetype
  if ft ~= "typescript" and ft ~= "typescriptreact" and ft ~= "vue" then
    return
  end

  if type(inlay_hint) == "table" and inlay_hint.enable then
    local ok = pcall(inlay_hint.enable, false, { bufnr = event.buf })
    if not ok then
      pcall(inlay_hint.enable, event.buf, false)
    end
  elseif type(inlay_hint) == "function" then
    inlay_hint(event.buf, false)
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Disable inlay hints for TS and Vue buffers",
  callback = disable_ts_vue_inlay_hints,
})
