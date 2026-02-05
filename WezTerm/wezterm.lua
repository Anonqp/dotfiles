local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox Material (Gogh)"
config.window_background_opacity = 0.6
config.win32_system_backdrop = "Acrylic"
config.window_decorations = "NONE | RESIZE"
config.front_end = "OpenGL"
config.freetype_load_target = "Light"
config.freetype_render_target = "Light"
config.max_fps = 144
config.term = "xterm-256color"
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.prefer_egl = true
config.cell_width = 0.9
config.initial_cols = 80

config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500

config.colors = {
	background = "#000000",
}

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Regular" }),
	}

config.font = wezterm.font_with_fallback({
    { 
        family = "Iosevka Custom", 
        stretch = "Expanded",
        weight = "Regular",
        harfbuzz_features = { 
            "calt=1", -- Ligatures
            "clig=1", -- Contextual Ligatures
            "liga=1", -- Standard Ligatures
            "cv02",   -- Alternate 'g'
            "ss01", "cv24", "cv31" 
        },
    },
    { family = "Symbols Nerd Font" },
})

config.font_size = 11.0

config.check_for_updates = false
config.warn_about_missing_glyphs = false
config.scrollback_lines = 10000
config.default_domain = "WSL:Arch"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
