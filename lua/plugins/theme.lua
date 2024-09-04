return {
  { "vimpostor/vim-lumen" },
  {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    opts = {
      better_performance = 1,
      enable_italic = 1,
    },
    config = function()
      vim.cmd.colorscheme("edge")
    end,
  },
}
