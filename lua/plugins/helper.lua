return {
  -- {
  --   "iguanacucumber/magazine.nvim",
  --   name = "nvim-cmp", -- Otherwise highlighting gets messed up
  -- },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
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

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = "enter",
      windows = {
        autocomplete = {
          draw = function(ctx)
            local icon, cmp_item = ctx.kind_icon, ctx.item
            local cmp_source = ""

            if cmp_item.data and cmp_item.data.entryNames and cmp_item.data.entryNames[1] then
              local entryNames = cmp_item.data.entryNames[1]

              if entryNames and entryNames.source then
                cmp_source = entryNames.source
              end
            end

            return {
              {
                " " .. ctx.item.label,
                fill = true,
                -- hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
              },
              {
                string.format(" %s %-10s", icon, ctx.kind),
                hl_group = "BlinkCmpKind" .. ctx.kind,
              },
              {
                string.format("%-2s", cmp_source),
                hl_group = "BlinkCmpSource",
              },
            }
          end,
        },
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
