-- Multicursor
local mc = require("multicursor-nvim")

-- Add cursors above/below the main cursor.
vim.keymap.set({ "n", "v" }, "<M-Up>", function()
  mc.addCursor("k")
end)
vim.keymap.set({ "n", "v" }, "<M-Down>", function()
  mc.addCursor("j")
end)

-- Add a cursor and jump to the next word under cursor.
vim.keymap.set({ "n", "v" }, "<c-n>", function()
  mc.addCursor("*")
end)

-- Jump to the next word under cursor but do not add a cursor.
-- vim.keymap.set({ "n", "v" }, "<c-s>", function()
--   mc.skipCursor("*")
-- end)

-- Rotate the main cursor.
vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

-- Delete the main cursor.
vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

vim.keymap.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    -- Stop other cursors from moving.
    -- This allows you to reposition the main cursor.
    mc.disableCursors()
  else
    mc.addCursor()
  end
end)

vim.keymap.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler.
  end
end)

-- Align cursor columns.
vim.keymap.set("n", "<leader>a", mc.alignCursors)

-- Split visual selections by regex.
vim.keymap.set("v", "S", mc.splitCursors)

-- Append/insert for each line of visual selections.
vim.keymap.set("v", "<M-I>", mc.insertVisual)
vim.keymap.set("v", "<M-A>", mc.appendVisual)

-- match new cursors within visual selections by regex.
vim.keymap.set("v", "M", mc.matchCursors)

-- Rotate visual selection contents.
vim.keymap.set("v", "<leader>t", function()
  mc.transposeCursors(1)
end)
vim.keymap.set("v", "<leader>T", function()
  mc.transposeCursors(-1)
end)

-- show duration to save current buffer
vim.keymap.set("", "<C-s>", function()
  local start_time = vim.loop.hrtime()
  vim.cmd("write")
  local elapsed = (vim.loop.hrtime() - start_time) / 1e6

  print(string.format("Saved in %.2f ms", elapsed))
end, { desc = "Save with timing" })

-- typescript-tools: remove all unused
vim.keymap.set("", "<leader>cm", function()
  vim.cmd("TSToolsRemoveUnused")
end, { desc = "TS remove unused" })
