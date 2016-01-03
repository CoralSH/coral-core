# Initialize a Coral Project

. $(coral_bootstrap)
require "./util"

prompt() {
  local key=${3:-${1// /_}}
  [ ! -z $2 ] && local default="($2) "
  read -p "$1: $default" "$key"
  key_var=$(eval "echo \$$key")
  if [ -z "$key_var" ]; then
    eval "$key=\"$2\""
  fi
}

main() {
  prompt "name" "$(util get_current_directory_name)"
  output="name=\"$name\""

  prompt "version" "1.0.0"
  output="$output\nversion=\"$version\""

  prompt "description"
  output="$output\ndescription=\"$description\""

  prompt "entry point" "index.sh" "main"
  output="$output\nmain=\"$main\""

  prompt "keywords"
  keywords=${keywords//,/ }
  keywords=($keywords)
  keywords_string="("
  for keyword in "${keywords[@]}"; do
    keywords_string="$keywords_string\"$keyword\", "
  done
  keywords_string=${keywords_string%??}
  keywords_string="$keywords_string)"
  output="$output\nkeywords=$keywords_string"

  prompt "license" "MIT"
  output="$output\nlicense=\"$license\""

  manifest="$(pwd)/package.sh"
  echo "About to write to $manifest:"

  printf "\n$output\n\n"

  prompt "Is this ok?" "yes" "ok"
  if [ "$ok" = "yes" ]; then
    printf "$output" > "$manifest"
  else
    echo "Aborted."
    exit
  fi
}
