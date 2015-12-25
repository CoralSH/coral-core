. $(coral_bootstrap)
require "./log"
require "colors"

main() {
  local starting_dir="$PWD"

  cd "$PWD"

  if [ ! -d "shell_modules" ]; then
    mkdir "shell_modules"
  fi

  echo "installing $1"

  cd "shell_modules"

  if [ -d "$1" ]; then
    rm -rf "$1"
  fi

  git clone "https://github.com/CoralSH/$1.git" --quiet

  cd "$starting_dir"

  echo "installed $1!"
}
