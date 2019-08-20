#!/bin/bash
set -e

main(){
  if [[ "$1" == "init" ]]; then
    source "scripts/set-env.bash"
    install_all
  elif [[ "$1" == "install-all" ]];
  fi
}

