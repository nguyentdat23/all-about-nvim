return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "typescript-language-server",
        "vtsls",
        "eslint_d",
        "eslint-lsp",
      },
    },
  },
}
