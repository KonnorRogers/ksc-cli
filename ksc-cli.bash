#!/bin/bash
set -e

source "./scripts/set-env.bash"
COMMANDS="scripts/commands"

arg="$1"
if [[ "$arg" == "init" ]]; then
  source "$COMMANDS/init.bash"
elif [[ "$arg" == "install-all" ]]; then
  source "$COMMANDS/install-all.bash"
fi

main

