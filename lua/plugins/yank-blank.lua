return {
  "ptdewey/yankbank-nvim",
  config = function()
    require("yankbank").setup({
      max_entries = 9,
      sep = "-----",
      num_behavior = "jump",
      focus_gain_poll = true,
      persist_type = "sqlite",
      keymaps = {
        paste = "<CR>",
      },
      registers = {
        yank_register = "+",
      },
    })
  end,
}
