#!/bin/bash

set -e

kcs_dir_path(){
  ksc_dir="${1:-$KSC_DIR}"
  if [[ "$ksc_dir" ]]; then
    return
  fi

  KSC_DIR="$HOME/.ksc-cli"
}

export kcs_dir_path
