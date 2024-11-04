#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${CURRENT_DIR}/helpers.sh"

# script global variables
icon_on=''
icon_off=''

# script global variables
icon_on_default='󰅶'
icon_off_default='󰛊'

# icons are set as script global variables
get_icon_settings() {
  icon_on=$(get_tmux_option '@caffeinate_icon_on' "${icon_on_default}")
  icon_off=$(get_tmux_option '@caffeinate_icon_off' "${icon_off_default}")
}

print_icon() {
  if pgrep -x "caffeinate" > /dev/null
  then
    icon_name = "icon_${icon_on}"
  else
    icon_name = "icon_${icon_off}"
  fi

  printf "%s" "${!icon_name}"
}

main() {
  get_icon_settings
  print_icon
}
main
