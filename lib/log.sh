. $(coral_bootstrap)
require "colors"

general() {
  printf "$(colors dark cyan 'coral') %s %s %s\n" "$1" "$(colors dark red "$2")" "$3"
}

info() {
  general "$(colors underline green 'info')" "$1" "$2"
}

error() {
  general "$(colors red 'ERR!')" "$1" "$2"
}

warn() {
  general $(printf "\e[0;30;43mWARN\e[0m") "$1" "$2"
}

http() {
  general "$(colors green 'http')" "$1" "$2"
}
