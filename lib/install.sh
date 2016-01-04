. $(coral_bootstrap)
require "./log"
require "colors"

help() {
  require "colors"

  cat <<-EOF

  » $(colors bold cyan "coral") $(colors green "install") $(colors red "[[<user>/]<package>[@<version>]]") $(colors yellow "[-g|--global]")
  $(colors bright black "# install a package")

  ┌ $(colors green "install")                   Locally install all dependencies in package.sh
  ├ $(colors green "install") $(colors red "package")           Locally install $(colors red "package") from the registry
  ├ $(colors green "install") $(colors red "package@0.1.3")     Locally install $(colors red "package v0.1.3") from the registry
  ├ $(colors green "install") $(colors red "package") $(colors yellow "-g")        Globally install $(colors red "package") from the registry
  ├ $(colors green "install") $(colors red "user/package")      Locally install $(colors red "user/package") from GitHub
  └ $(colors green "install") $(colors red "user/package") $(colors yellow "-g")   Globally install $(colors red "user/package") from GitHub

EOF
}

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
