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

              require("telescope.builtin").live_grep({ search_dirs = { path } })
            end,
            desc = "live_grep in current dir",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      -- first setup telescope
      telescope.setup({
        -- your config
      })
      telescope.load_extension("live_grep_args")
    end,
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "bottom" },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
      },
    },
  },
}
