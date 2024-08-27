return {
  { "vimpostor/vim-lumen" },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    opts = {
      everforest_background = "hard",
      better_performance = 1,
      enable_italic = 1,
    },
  },
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
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          light = "frappe",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        integration_default = false,
        integrations = {
          barbecue = { dim_dirname = true, bold_basename = false, dim_context = false, alt_background = false },
          cmp = true,
          gitsigns = true,
          hop = true,
          illuminate = { enabled = true },
          native_lsp = { enabled = true, inlay_hints = { background = true } },
          neogit = true,
          neotree = true,
          semantic_tokens = true,
          treesitter = true,
          treesitter_context = true,
          vimwiki = true,
          which_key = true,
        },
      })

      vim.api.nvim_command("colorscheme catppuccin-macchiato")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "edge",
    },
  },
}
