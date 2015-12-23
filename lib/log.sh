. $(coral bootstrap)
require "./util"
require "colors"

log() {
  printf "$(colors cyan coral) %4s %12s : %s" "$1" "$(colors purple $2)" "$3"
}
