-- AUTOSTART (split from upstream example/hyprland.lua)
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  -- Signal readiness to UWSM so it activates graphical-session.target,
  -- imports the environment, and runs XDG autostart. Harmless no-op when
  -- the session was not launched through UWSM.
  --
  -- Session daemons are NOT started here: under UWSM they are managed as
  -- systemd user units bound to graphical-session.target (e.g. mako, enabled
  -- with `systemctl --user enable mako.service`), and apps shipping XDG
  -- autostart .desktop entries (lxpolkit, gnome-keyring, ...) start
  -- automatically. Reserve this hook for things that genuinely need the
  -- compositor as parent and have no unit or .desktop.
  hl.exec_cmd("uwsm finalize")
end)

-- Wallpaper daemon (swww). Started from this hook because it needs the
-- compositor's Wayland session as parent and ships neither a systemd user
-- unit nor an XDG autostart .desktop -- exactly the reserved-hook case noted
-- above. swww-daemon restores the last-set wallpaper from its cache on launch,
-- so no `swww img` call is needed here once a wallpaper has been set once
-- (`swww img <path>`).
hl.on("hyprland.start", function()
  hl.exec_cmd("swww-daemon")
end)

-- Autostart additional processes (like status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)


-------------------------------
