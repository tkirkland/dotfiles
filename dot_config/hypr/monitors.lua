-- MONITORS (split from upstream example/hyprland.lua)
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "DP-3",
    mode     = "3440x1440@60",
    position = "1920x0",
    scale    = 1,
})


---------------------
