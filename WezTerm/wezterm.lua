local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-- =========================================================
-- THEME & APPEARANCE
-- =========================================================
config.color_scheme = 'Gruvbox Material (Gogh)'
config.win32_system_backdrop = "Acrylic"
config.window_background_opacity = 0.60
config.window_decorations = "RESIZE" 
config.window_close_confirmation = "AlwaysPrompt"
config.front_end = "WebGpu"
config.freetype_load_target = "Light"
config.freetype_render_target = "Light"
config.enable_tab_bar = false

config.default_cursor_style = "BlinkingBlock"

config.cursor_blink_rate = 600

config.colors = {
  background = "#000000",
}



-- =========================================================
-- FONTS & TYPOGRAPHY
-- =========================================================
config.font = wezterm.font_with_fallback({
    { 
        family = "JetBrains Mono", 
        weight = "Medium",
        harfbuzz_features = { 
            "calt=1", -- Ligatures
            "clig=1", -- Contextual Ligatures
            "liga=1", -- Standard Ligatures
            "zero",   -- Slashed Zero (Crucial for coding!)
            "cv02",   -- Alternate 'g' (optional, looks cleaner)
            -- Keep your specific ones if you know what they do:
            "ss01", "cv24", "cv31" 
        },
    },
    { family = "Symbols Nerd Font" },
})

config.font_size = 11.0
config.line_height = 1.15


-- =========================================================
-- GENERAL SETTINGS
-- =========================================================
config.check_for_updates = false
config.warn_about_missing_glyphs = false
config.scrollback_lines = 10000
config.default_domain = "WSL:Arch"

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 0,
}

-- =========================================================
-- KEY BINDINGS (Leader: Space)
-- =========================================================
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Standard
  { key = "R", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
  { key = "Enter", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
  
  -- Panes (TMUX style)
  { key = "\\", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "-",  mods = "LEADER", action = act.SplitVertical   { domain = "CurrentPaneDomain" } },
  { key = "w",  mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  
  -- Navigation
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  
  -- Tabs
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
}

return config