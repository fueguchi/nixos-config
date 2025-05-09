#!/usr/bin/env bash
image_dir="$HOME/.wallpapers/"
wallpaper_symlink="$HOME/.wallpaper/wallpaper.png"
theme_file="/tmp/theme_variant"


# function to apply the wal theme
apply_wal_theme() {
  if [ -s "$theme_file" ]; then
    case $(<"$theme_file") in
      "light") wal_arguments="lighten -l" ;;
      *) wal_arguments="" ;;
    esac
  fi
  wal -i "$selected_image_path"
  if pgrep -x "waybar" >/dev/null; then
    killall -SIGUSR2 waybar
    sleep 0.5
    if ! pgrep -x "waybar" >/dev/null; then
      waybar &
    fi
  fi
  swaync-client -rs
  eww kill
  eww open bar
}

# function to set the wallpaper using swww
set_swww_wallpaper() {
  if [ ! -f "$wallpaper_symlink" ]; then
    notify-send -a "swww" "No wallpaper found" "$wallpaper_symlink"
    exit 1
  fi
swww img "$wallpaper_symlink" \
  --transition-bezier .43,1.19,1,.4 \
  --transition-fps 60 \
  --transition-step 90 \
  --transition-type "grow" \
  --transition-duration 0.7 \
  --invert-y \
  --transition-pos "$(hyprctl cursorpos)"
}

images=("$image_dir"/*)
image_list=""
for img in "${images[@]}"; do
  image_list+=$(basename "$img" | cut -d. -f1)"\x00icon\x1f${img}\n"
done

selected_image=$(printf '%b' "$image_list" | rofi -dmenu -theme ~/.config/rofi/wallpaper-select.rasi -p "Select wallpaper")

selected_image_path=""
for img in "${images[@]}"; do
  if [[ "$(basename "$img" | cut -d. -f1)" = "$selected_image" ]]; then
    selected_image_path="$img"
    break
  fi
done

if [ -n "$selected_image_path" ]; then
  ln -sf "$selected_image_path" "$wallpaper_symlink"

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  . ~/set_wallpaper.sh
else
   i3-msg restart
fi
  notify-send -a "Wallpaper selector" "Wallpaper changed" "$selected_image_path" -i "$wallpaper_symlink"
  apply_wal_theme
  set_swww_wallpaper
fi
