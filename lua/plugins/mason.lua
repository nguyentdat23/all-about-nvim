return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "eslint-lsp",
        "prettier",
      },
    },
  },
}
