local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("VictorMono Nerd Font", { weight = "Bold" })
config.font_size = 9.0
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

-- config.window_background_opacity = 0.8

config.window_frame = {
	border_left_width = "0.2cell",
	border_right_width = "0.2cell",
	border_bottom_height = "0.1cell",
	border_top_height = "0.1cell",
	border_left_color = "#cdcdcd",
	border_right_color = "#cdcdcd",
	border_bottom_color = "#cdcdcd",
	border_top_color = "#cdcdcd",
}

config.initial_cols = 160
config.initial_rows = 40
config.window_decorations = "NONE"
-- config.window_decorations = "RESIZE"
-- config.front_end = "OpenGL"
-- config.front_end = "WebGpu"
config.enable_wayland = false

config.color_scheme = "Github Dark"
config.colors = {
	background = "#22272e",
}
-- config.color_scheme = "Catppuccin Macchiato"
-- config.default_prog = { "tmux", "new-session", "-A", "-s", "Main" }

config.warn_about_missing_glyphs = true

return config
