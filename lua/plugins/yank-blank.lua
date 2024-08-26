return {
  "ptdewey/yankbank-nvim",
  config = function()
    require("yankbank").setup({
      max_entries = 50,
      sep = "-----",
      num_behavior = "jump",
      focus_gain_poll = true,
      keymaps = {
        paste = "<CR>",
      },
      registers = {
        yank_register = "+",
      },
    })
  end,
}
