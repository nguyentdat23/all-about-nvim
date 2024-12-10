return {
  { "hrsh7th/nvim-cmp", enabled = false },
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets", "mikavilpas/blink-ripgrep.nvim" },

    -- use a release tag to download pre-built binaries
    version = "v0.*",

    ---@module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        menu = {
          draw = {
            components = {
              label_description = {
                width = { max = 30 },
                text = function(ctx)
                  local cmp_item = ctx.item

                  if cmp_item.data and cmp_item.data.entryNames and cmp_item.data.entryNames[1] then
                    local entryNames = cmp_item.data.entryNames[1]

                    if entryNames and entryNames.source then
                      return entryNames.source
                    end
                  end

                  return ctx.label_description
                end,
                highlight = "BlinkCmpLabelDescription",
              },
            },
          },
        },
        list = {
          max_items = 50,
        },
      },

      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        completion = {
          enabled_providers = { "lsp", "snippets" },
        },
        providers = {
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            -- the options below are optional, some default values are shown
            ---@module "blink-ripgrep"
            ---@type blink-ripgrep.Options
            opts = {
              -- For many options, see `rg --help` for an exact description of
              -- the values that ripgrep expects.

              -- the minimum length of the current word to start searching
              -- (if the word is shorter than this, the search will not start)
              prefix_min_len = 3,

              -- The number of lines to show around each match in the preview window
              context_size = 3,

              -- The maximum file size that ripgrep should include in its search.
              -- Useful when your project contains large files that might cause
              -- performance issues.
              -- Examples: "1024" (bytes by default), "200K", "1M", "1G"
              max_filesize = "1M",
            },
          },
        },
      },
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.completion.enabled_providers" },
  },
  {
    "ggandor/leap.nvim",
  },
}
