. $(coral_bootstrap)
require "./log"
require "colors"

main() {
  local starting_dir="$1"

  log "info" "install" "$2"

  cd "$1"

  if [ ! -d "shell_modules" ]; then
    mkdir "shell_modules"
  fi

  cd "shell_modules"

  if [ -d "$2" ]; then
    rm -rf "$2"
  fi

  clone_url="https://github.com/CoralSH/$2.git"
  git clone "$clone_url" --quiet

  cd "$starting_dir"

  log "info" "installed" "$2"
}

main
