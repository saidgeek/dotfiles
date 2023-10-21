local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("VictorMono Nerd Font", { weight = "Bold" })
config.font_size = 11.0
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	border_left_width = "0.2cell",
	border_right_width = "0.2cell",
	border_bottom_height = "0.2cell",
	border_top_height = "0.2cell",
	border_left_color = "#232323",
	border_right_color = "#232323",
	border_bottom_color = "#232323",
	border_top_color = "#232323",
}

config.initial_cols = 150
config.initial_rows = 35
-- config.window_decorations = "NONE"
config.front_end = "OpenGL"
-- config.front_end = "WebGpu"
-- config.enable_wayland = true

config.color_scheme = "Catppuccin Macchiato"
-- config.default_prog = { "tmux", "new-session", "-A", "-s", "Main" }

config.warn_about_missing_glyphs = true

return config
