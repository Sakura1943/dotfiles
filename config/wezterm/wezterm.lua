local wezterm = require("wezterm")

return {
    font = wezterm.font_with_fallback({
        "JetBrains Mono",
        "FiraCode Nerd Font",
        "Noto Sans CJK SC",
        "DejaVu Sans Mono",
        "Noto Sans Symbols2",
    }),
    font_size = 12,
    color_scheme = "Gruvbox Dark",
    window_background_opacity = 0.9,
    text_background_opacity = 0.9,
    enable_tab_bar = false,
    line_height = 1.1,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    default_prog = {'/usr/bin/zsh'},
    exit_behavior = "Close",
}
