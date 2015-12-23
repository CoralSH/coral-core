get_modules_directory() {
  modules_directory=$(pwd)

  while [ ! -f "$modules_directory/package.sh" ]; do
    modules_directory=${modules_directory%/*}
    if [ "$modules_directory" = "/" ]; then
      echo "couldn't find shell_modules"
      exit
    fi
  done

  if [ ! -d "shell_modules" ]; then
    mkdir "shell_modules"
  fi

  echo "$modules_directory"
}

get_current_directory_name() {
  printf '%s\n' "${PWD##*/}"
}
