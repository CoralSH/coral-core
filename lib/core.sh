# Coral's inner workings. Contains all high-level Coral functions.

. $(coral_bootstrap)

display_help() {
  if [ $# -ge 1 ]; then
    require "./$1"
    $1 help

    return
  fi

  require "colors"
  require "./util"

  cat <<-EOF

  » $(colors bold cyan "coral") $(colors green "command") $(colors red "arguments") $(colors yellow "--option")

  ┌ $(colors green "help")                      Display help information
  ├ $(colors green "init")                      Interactively create a package.sh file
  ├ $(colors green "info")                      Information about a package
  ├ $(colors green "install")                   Install a package
  ├ $(colors green "uninstall")                 Uninstall a package
  ├ $(colors green "publish")                   Publish a package to the registry
  ├ $(colors green "unpublish")                 Remove a package from the registry
  ├ $(colors green "version")                   Work with package versions
  └ $(colors green "whoami")                    Information about yourself

  ┌ $(colors yellow "-h, --help")                Display this help information
  └ $(colors yellow "-V, --version")             Output current version

  $(colors bright black "# version $VERSION")

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

command_whooo() {
  require "./whooo"

  whooo
}
