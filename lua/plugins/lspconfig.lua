return {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "javascript",
        "json",
        "lua",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "java",
      },
    },
  },
}
