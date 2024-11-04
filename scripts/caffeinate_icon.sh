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
    local status
    if pgrep -x "caffeinate" > /dev/null; then
        status=$icon_on
    else
        status=$icon_off
    fi

  printf "%s" "$status"
}

main() {
  get_icon_settings
  print_icon
}
main
