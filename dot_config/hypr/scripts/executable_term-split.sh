#!/usr/bin/env bash
# Launch a terminal that splits the focused kitty window in place, instead of
# opening a new tiled Hyprland window. Falls back to a fresh kitty when the
# focused window isn't kitty.
#
# Relies on kitty.conf:
#   allow_remote_control socket-only
#   listen_on unix:@mykitty        # per-instance socket is @mykitty-<PID>
# where <PID> == the kitty process PID == Hyprland's activewindow .pid

win=$(hyprctl activewindow -j)

if [[ "$(jq -r '.class' <<<"$win")" == "kitty" ]]; then
    pid=$(jq -r '.pid' <<<"$win")
    kitten @ --to "unix:@mykitty-$pid" launch --location=hsplit --cwd=current
else
    kitty
fi
