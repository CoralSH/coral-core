. $(coral_bootstrap)
require "./log"

main() {
  local starting_dir="$(pwd)"
  modules_directory=$(pwd)

  while [ ! -f "$modules_directory/package.sh" ]; do
    modules_directory=${modules_directory%/*}
    if [ x"$modules_directory" = "x" ]; then
      echo "couldn't find shell_modules"
      exit
    fi
  done

  cd "$modules_directory"

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
