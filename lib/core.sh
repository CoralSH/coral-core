# Coral's inner workings. Contains all high-level Coral functions.

. $(coral_bootstrap)

display_help() {
  require "colors"
  require "./util"

  cat <<-EOF

  $(colors bold white "usage:")
    $(colors bright cyan "coral") $(colors bright cyan "[COMMAND]") $(colors bright yellow "[args]") $(colors bright black "[options]")

  $(colors bold white "commands:")
    $(colors bright cyan "coral")                              $(colors white "Display this help information")
    $(colors bright cyan "coral") $(colors bright cyan "help") $(colors bright yellow "command")                 $(colors white "Display help information about <command>")

$(util print_needs_internet_symbol)   $(colors bright cyan "coral") $(colors bright cyan "install")                      $(colors white "Locally install all dependencies in package.sh")
$(util print_needs_internet_symbol)   $(colors bright cyan "coral") $(colors bright cyan "install") $(colors bright yellow "package")              $(colors white "Locally install <package> from the Coral registry")
$(util print_needs_internet_symbol)   $(colors bright cyan "coral") $(colors bright cyan "install") $(colors bright yellow "user/package")         $(colors white "Locally install <user/package> from GitHub")
$(util print_needs_internet_symbol)   $(colors bright cyan "coral") $(colors bright cyan "install") $(colors bright yellow "package") $(colors bright black "-g")           $(colors white "Globally install <package> from the Coral registry")
$(util print_needs_internet_symbol)   $(colors bright cyan "coral") $(colors bright cyan "install") $(colors bright yellow "user/package") $(colors bright black "-g")      $(colors white "Globally install <user/package> from GitHub")

    $(colors bright cyan "coral") $(colors bright cyan "init")                         $(colors white "Interactively create a package.sh file")

    $(colors bright cyan "coral") $(colors bright cyan "info")                         $(colors white "Get information about the package here")
$(util print_needs_internet_symbol)   $(colors bright cyan "coral") $(colors bright cyan "info") $(colors bright yellow "package")                 $(colors white "Get information about <package>")

  $(colors bold white "options:")
    $(colors bright black "-V, --version")                      $(colors white "Output current version of Git Goodies")
    $(colors bright black "-h, --help")                         $(colors white "Display this help information")

EOF
	exit 0
}

command_install() {
  require "./install"

  install main $1 $2
}

command_init() {
  require "./init"

  init
}
