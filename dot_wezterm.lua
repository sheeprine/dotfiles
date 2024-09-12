local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Monokai Soda'
config.font = wezterm.font('MesloLGS NF')
config.font_size=13
config.enable_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
