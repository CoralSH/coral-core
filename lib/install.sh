. $(coral_bootstrap)
require "./log"
require "colors"

main() {
  local starting_dir="$1"

  cd "$1"

  if [ ! -d "shell_modules" ]; then
    mkdir "shell_modules"
  fi

  echo "installing $2"

  cd "shell_modules"

  if [ -d "$2" ]; then
    rm -rf "$2"
  fi

  git clone "https://github.com/CoralSH/$2.git" --quiet

  cd "$starting_dir"

  echo "installed $2!"
}
