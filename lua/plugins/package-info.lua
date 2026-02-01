return {
  "vuki656/package-info.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  lazy = true,
  config = function()
    local package_info = require("package-info")
    vim.keymap.set({ "n" }, "<LEADER>tt", package_info.toggle, { silent = true, noremap = true })
    require("package-info").setup({
      highlights = {
        up_to_date = { fg = "#3C4048" },
        outdated = { fg = "#FF0000" },
      },
      autostart = true,
      hide_up_to_date = true,
      package_manager = "pnpm",
    })
  end,
}
