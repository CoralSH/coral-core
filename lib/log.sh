. $(coral bootstrap)
require "./util"
require "colors"

log() {
  printf "$(colors cyan coral) %s %20s %s\n" "$1" "$(colors purple $2) :" "$3"
}

info() {
  log "$(colors green info)" $1 $2
}

error() {
  log "$(colors red 'ERR!')" "$1" "$2"
}
