return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "vtsls",
        "eslint-lsp",
      },
    },
  },
}
