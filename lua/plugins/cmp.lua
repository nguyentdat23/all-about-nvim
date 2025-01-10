return {
  {
    "ggandor/leap.nvim",
  },
  {
    "saghen/blink.cmp",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
        ghost_text = {
          enabled = false,
        },
        list = {
          max_items = 20,
          selection = {
            auto_insert = false,
          },
        },
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

              source_name = {
                width = { max = 30 },
                text = function(ctx)
                  return ctx.source_name
                end,
                highlight = "BlinkCmpSource",
              },
            },
          },
        },
      },
    },
  },
}
