return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = {
      winopts = {
        layout = "vertical",
        -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
        preview = {
          hidden = "hidden",
        },
      },
      defaults = {
        formatter = "path.filename_first",
      },
      -- ui_select = function(fzf_opts, items)
      --   return vim.tbl_deep_extend("force", fzf_opts, {
      --     prompt = " ",
      --     winopts = {
      --       layout = "vertical",
      --       title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
      --       title_pos = "center",
      --       preview = {
      --         hidden = "hidden",
      --       },
      --     },
      --   }, fzf_opts.kind == "codeaction" and {
      --     winopts = {
      --       layout = "vertical",
      --       -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
      --       height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
      --       width = 0.5,
      --       preview = {
      --         layout = "vertical",
      --         vertical = "down:15,border-top",
      --         hidden = "nohidden",
      --       },
      --     },
      --   } or {
      --     winopts = {
      --       width = 0.5,
      --       -- height is number of items, with a max of 80% screen height
      --       height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
      --     },
      --   })
      -- end,
    },
  },
}
