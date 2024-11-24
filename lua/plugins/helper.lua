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

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = "enter",
      fuzzy = {
        sorts = { "score", "kind", "label" },
      },
      sources = {
        providers = {
          snippets = {
            name = "Snippets",
            module = "blink.cmp.sources.snippets",
            score_offset = -40,
            opts = {
              friendly_snippets = true,
              search_paths = { vim.fn.stdpath("config") .. "/snippets" },
              global_snippets = { "all" },
              extended_filetypes = {},
              ignored_filetypes = {},
              get_filetype = function(context)
                return vim.bo.filetype
              end,
            },

            --- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
            -- enabled = function(ctx) return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter end,
          },
        },
      },
      windows = {
        autocomplete = {
          draw = function(ctx)
            local icon, cmp_item = ctx.kind_icon, ctx.item
            local cmp_source = ""

            if cmp_item.labelDetails and cmp_item.labelDetails.description then
              cmp_source = cmp_item.labelDetails.description
            end

            return {
              {
                " " .. ctx.item.label,
                fill = true,
                hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
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
