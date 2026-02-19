return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
    "DiffviewClose",
  },
  keys = {
    { "<leader>td", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>th", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    { "<leader>tq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
