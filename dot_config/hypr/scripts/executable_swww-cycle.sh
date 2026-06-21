#!/usr/bin/env bash
# Cycle swww wallpapers: assign a different random image to each connected
# output. Bound to SUPER + W in keybindings.lua. Pairs with the swww-daemon
# autostart in autostart.lua; if the daemon somehow is not running yet, start
# it first. WAYLAND_DISPLAY/XDG_RUNTIME_DIR are inherited from the compositor.
set -euo pipefail

dir="${SWWW_WALLPAPER_DIR:-$HOME/Pictures/Wallpaper-Bank/wallpapers}"
transition="${SWWW_TRANSITION:-any}"

# Ensure the daemon is up (autostart normally handles this).
if ! swww query >/dev/null 2>&1; then
  swww-daemon >/dev/null 2>&1 &
  for _ in 1 2 3 4 5 6 7 8 9 10; do
    swww query >/dev/null 2>&1 && break
    sleep 0.2
  done
fi

# Connected outputs, parsed from `swww query` ("<: NAME: ...>").
mapfile -t outputs < <(swww query | awk -F: 'NF>1 { gsub(/ /, "", $2); print $2 }')
[ "${#outputs[@]}" -gt 0 ] || { echo "swww-cycle: no outputs" >&2; exit 1; }

# Shuffled pool of images; consecutive picks are distinct.
mapfile -t imgs < <(find "$dir" -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) \
  | shuf)
[ "${#imgs[@]}" -gt 0 ] || { echo "swww-cycle: no images in $dir" >&2; exit 1; }

i=0
for out in "${outputs[@]}"; do
  img="${imgs[$(( i % ${#imgs[@]} ))]}"
  swww img -o "$out" "$img" --transition-type "$transition"
  i=$(( i + 1 ))
done
