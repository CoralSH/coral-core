get() {
  [ -z "$1" ] && echo "no key specified" && return

  config="$(cat ~/.coralrc)"

  for line in "$config"; do
    IFS=' : ' read -r -a line_array <<< "$line"

    [ "${line_array[0]}" = "$1" ] && echo "${line_array[1]}" && return

    echo "$1 not found"
  done
}
