-- return {
--   "catppuccin/nvim",
--   opts = {
--     transparent = true,
--     styles = {
--       sidebars = "transparent",
--       floats = "transparent",
--     },
--   },
-- }
return {
  { "neanias/everforest-nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      background = "soft",
    },
  },
}
-- return {
--   "ribru17/bamboo.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("bamboo").setup({})
--     require("bamboo").load()
--   end,
-- }
