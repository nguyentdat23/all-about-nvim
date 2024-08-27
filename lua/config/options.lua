-- enable soft wrap
vim.opt.wrap = true

vim.g.neovide_window_blurred = true
vim.g.neovide_position_animation_length = 0.15
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.0
vim.opt.linespace = 1
vim.o.guifont = "CaskaydiaCove Nerd Font:h16:#e-subpixelantialias:#h-none"

-- Helper function for transparency formatting
-- local alpha = function()
--   return string.format("%x", math.floor(255 * vim.g.transparency or 0.85))
-- end
--
-- vim.g.neovide_transparency = 0.85
-- vim.g.transparency = 0.85
-- vim.g.neovide_background_color = "#333545" .. alpha()
--
vim.g.neovide_theme = "auto"
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.8
