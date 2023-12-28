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

local xcursor_size = nil
local xcursor_theme = nil

local success, stdout = wezterm.run_child_process({ "gsettings", "get", "org.gnome.desktop.interface",
  "cursor-theme" })
if success then
  xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
end

success, stdout = wezterm.run_child_process({ "gsettings", "get", "org.gnome.desktop.interface",
  "cursor-size" })
if success then
  xcursor_size = tonumber(stdout)
end

config.xcursor_theme = xcursor_theme
config.xcursor_size = xcursor_size

return config
