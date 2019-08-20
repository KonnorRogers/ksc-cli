#!/bin/bash
set -e

source "$HOME/.ksc-cli/config.bash"
source "$KSC_REPO_PATH/scripts/set-ksc-dir.bash"
COMMANDS="$KSC_REPO_PATH/scripts/commands"

arg="$1"
if [[ "$arg" == "install-all" ]]; then
  source "$COMMANDS/install.bash"
  install_all
fi
