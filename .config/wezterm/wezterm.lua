local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.font = wezterm.font('Fira Code', { weight = 'Medium' })
config.font_size = 11.0

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
