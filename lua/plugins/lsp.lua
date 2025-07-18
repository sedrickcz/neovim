return {
  -- Mason for managing LSP servers, formatters, and linters
  {
    "williamboman/mason.nvim",
    version = "v2.0.0",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}