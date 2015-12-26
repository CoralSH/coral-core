. $(coral_bootstrap)
require "colors"
require "stacktrace"

general() {
  if [ "$#" -eq 2 ]; then
    printf "$(colors bright cyan 'coral') %s %s\n" "$1" "$(colors none "$2")"
  else
    printf "$(colors bright cyan 'coral') %s %s %s\n" "$1" "$(colors purple "$2")" "$3"
  fi
}

info() {
  if [ "$#" -eq 1 ]; then
    general "$(colors underline green 'info')" "$1"
  else
    general "$(colors underline green 'info')" "$1" "$2"
  fi
}

error() {
  if [ "$#" -eq 1 ]; then
    message=$(general "$(colors red 'ERR!')" "$1")
  else
    message=$(general "$(colors red 'ERR!')" "$1" "$2")
  fi

  stacktrace main "$message"
}

warn() {
  if [ "$#" -eq 1 ]; then
    general $(printf "\e[0;30;43mWARN\e[0m") "$1"
  else
    general $(printf "\e[0;30;43mWARN\e[0m") "$1" "$2"
  fi
}

http() {
  if [ "$#" -eq 1 ]; then
    general "$(colors green 'http')" "$1"
  else
    general "$(colors green 'http')" "$1" "$2"
  fi
}
