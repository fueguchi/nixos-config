#!/usr/bin/env bash

exec > /tmp/wallpaper_script_output.log 2>&1
set -x
WAL_SYM="$HOME/.config/.sym/sym.png"
IMAGE_DIR="$HOME/.wallpapers/"
THEME_FILE="/tmp/theme_variant"
LOCAL_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

apply_theme () {
  wal --cols16 "lighten" -n -i "${WAL_SYM}"
  swaync-client -rs
  eww kill
  eww open bar
}

apply_wallpaper (){
  if [[ ! -f "${WAL_SYM}" ]]; then
    notify-send -a "No wallpaper found" "$WAL_SYM"
    exit 1
  fi
swww img "$WAL_SYM" \
  --transition-bezier .43,1.19,1,.4 \
  --transition-fps 120 \
  --transition-step 90 \
  --transition-type "grow" \
  --transition-duration 0.7 \
  --invert-y \
  --transition-pos "$(hyprctl cursorpos)"
}

images=("$IMAGE_DIR"/*)
image_list=""
for img in "${images[@]}"; do
  image_list+=$(basename "$img" | cut -d. -f1)"\x00icon\x1f${img}\n"
done

selected_image=$(printf '%b' "$image_list" | rofi -dmenu -theme ${LOCAL_PATH}/rofi-themes/glassy/wallpaper-select.rasi -p "Select wallpaper")

selected_image_path=""
for img in "${images[@]}"; do 
  if [[ "$(basename "$img" | cut -d. -f1)" = "$selected_image" ]]; then
    selected_image_path="$img"
    break
  fi
done

if [[ -n "${selected_image_path}" ]]; then
  ln -sf "${selected_image_path}" "${WAL_SYM}"

  if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    hyprctl reload
  fi
    notify-send -a "Wallpaper selector" "Wallpaper changed" "$selected_image_path" -i "$WAL_SYM"
apply_theme
apply_wallpaper
fi
