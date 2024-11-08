local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

config.font = wezterm.font 'Hack'
config.font_size = 16.0

config.color_scheme = 'Sonokai (Gogh)'

config.keys = {
    {
        key = '\r',
        mods = 'SUPER',
        action = wezterm.action.SplitPane {
            direction = 'Down'
        }
    },
    {
        key = '\r',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.SplitPane {
            direction = 'Right'
        }
    },
    {
        key = 'l',
        mods = 'SUPER',
        action = wezterm.action.RotatePanes 'Clockwise'
    },
    {
        key = 'l',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.RotatePanes 'CounterClockwise'
    },
    {
        key = '[',
        mods = 'SUPER',
        action = wezterm.action.ActivatePaneDirection 'Prev'
    },
    {
        key = ']',
        mods = 'SUPER',
        action = wezterm.action.ActivatePaneDirection 'Next'
    },
    {
        key = ',',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.MoveTabRelative(-1)
    },
    {
        key = '.',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.MoveTabRelative(1)
    }
}

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
