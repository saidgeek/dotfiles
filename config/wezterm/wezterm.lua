local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Victor Mono", { weight = "Bold" })
config.font_size = 12.0
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 5,
	right = 0,
	top = 0,
	bottom = 0,
}
-- config.window_decorations = "NONE"
config.front_end = "WebGpu"

config.color_scheme = "Catppuccin Macchiato"
-- config.default_prog = { "/usr/local/bin/tmux", "new-session", "-A", "-s", "Main" }

return config
