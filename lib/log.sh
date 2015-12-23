. $(coral bootstrap)
require "./util"
require "colors"

log() {
  printf "$(colors cyan 'coral') %s %s %s\n" "$1" "$(colors purple $2)" "$3"
}

info() {
  log "$(colors green 'info')" "$1" "$2"
}

error() {
  log "$(colors red 'ERR!')" "$1" "$2"
}

warn() {
  log $(printf "\e[0;30;43mWARN\e[0m") "$1" "$2"
}
