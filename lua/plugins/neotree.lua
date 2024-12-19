return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["R"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              vim.print(path)
              require("fzf-lua").live_grep({ cwd = path })
            end,
            desc = "live_grep in current dir",
          },
        },
      },
    },
  },
}
