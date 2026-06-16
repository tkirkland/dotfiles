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

-- Autostart additional processes (like status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)


-------------------------------
