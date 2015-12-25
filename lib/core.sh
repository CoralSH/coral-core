# Coral's inner workings. Contains all high-level Coral functions.

. $(coral_bootstrap)

command_install() {
  require "./install"

  install main $1
}

command_init() {
  require "./init"

  init
}
