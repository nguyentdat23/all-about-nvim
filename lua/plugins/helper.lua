return {
  -- {
  --   "iguanacucumber/magazine.nvim",
  --   name = "nvim-cmp", -- Otherwise highlighting gets messed up
  -- },
  { "hrsh7th/nvim-cmp", enabled = false },
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    opts = {
      keymap = {
        preset = "enter",
      },
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "normal",
    },
  },
  {
    "ggandor/leap.nvim",
  },
}
