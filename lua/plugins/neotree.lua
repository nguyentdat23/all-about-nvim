return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        components = {
          name = function(config, node, state)
            local components = require("neo-tree.sources.common.components")
            local name = components.name(config, node, state)
            if node:get_depth() > 3 then
              name.text = vim.fn.pathshorten(name.text, 2)
            end

            return name
          end,
        },
      },
      window = {
        mappings = {
          ["R"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              require("fzf-lua").live_grep({ cwd = path })
            end,
            desc = "live_grep in current dir",
          },
        },
      },
    },
  },
}
