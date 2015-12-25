# Coral's inner workings. Contains all high-level Coral functions.

. $(coral_bootstrap)

display_help() {
  require "colors"

  cat <<-EOF

  $(printf "\e[2musage:\e[22m")
    $(colors bright cyan "coral") $(colors bright yellow "[options]") $(colors bright red "[COMMAND]") $(colors bright green "[args]")

  $(printf "\e[2mcommands:\e[22m")
    $(colors bright cyan "coral")                              $(colors bright yellow "Display this help information")
    $(colors bright cyan "coral i")                            $(colors bright yellow "Initialize new Git repository")
    $(colors bright cyan "coral ig")                           $(colors bright yellow "List available .gitignore templates")
    $(colors bright cyan "coral ig <template>")                $(colors bright yellow "Add .gitignore file from <template>")
    $(colors bright cyan "coral igf <file ...>")               $(colors bright yellow "Add all <file>(s) to .gitignore")
    $(colors bright cyan "coral cl <url>")                     $(colors bright yellow "Clone repository from <url>")
    $(colors bright cyan "coral a")                            $(colors bright yellow "Add all files")
    $(colors bright cyan "coral a <file ...>")                 $(colors bright yellow "Add all <file>(s)")
    $(colors bright cyan "coral c <message>")                  $(colors bright yellow "Add all files and commit with <message>")
    $(colors bright cyan "coral cn <message>")                 $(colors bright yellow "Commit with <message>")
    $(colors bright cyan "coral uc <count>")                   $(colors bright yellow "Go back (uncommit) <count> commits")
    $(colors bright cyan "coral rc <message>")                 $(colors bright yellow "Add all files and recommit (amend) with <message>")
    $(colors bright cyan "coral rcn <message>")                $(colors bright yellow "Recommit (amend) with <message>")
    $(colors bright cyan "coral p")                            $(colors bright yellow "Push all commits to remote")
    $(colors bright cyan "coral pl")                           $(colors bright yellow "Pull all commits from remote")
    $(colors bright cyan "coral f")                            $(colors bright yellow "Fetch all commits from remote")
    $(colors bright cyan "coral s")                            $(colors bright yellow "Display repository status")
    $(colors bright cyan "coral l")                            $(colors bright yellow "Display repository commit log")
    $(colors bright cyan "coral b")                            $(colors bright yellow "List all branches in repository")
    $(colors bright cyan "coral b <branch>")                   $(colors bright yellow "Create and checkout <branch>")
    $(colors bright cyan "coral ch")                           $(colors bright yellow "List all branches in repository")
    $(colors bright cyan "coral ch <branch>")                  $(colors bright yellow "Checkout <branch>")
    $(colors bright cyan "coral in <hash>")                    $(colors bright yellow "Display info about <hash>")

  $(printf "\e[2moptions:\e[22m")
    $(colors bright cyan "-V, --version")                      $(colors bright yellow "Output current version of Git Goodies")
    $(colors bright cyan "-h, --help")                         $(colors bright yellow "Display this help information")

EOF
	exit 0
}

command_install() {
  require "./install"

  install main $1
}

command_init() {
  require "./init"

  init
}
