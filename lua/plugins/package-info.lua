return {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    lazy = true,
    config = function()
      local package_info = require("package-info")
      vim.keymap.set({ "n" }, "<LEADER>nt", package_info.toggle, { silent = true, noremap = true })
      require('package-info').setup({
        colors = {
          up_to_date = '#3C4048',
          outdated = '#FF0000',
        },
        autostart = true,
        hide_up_to_date = true,
      })
    end,
  }
