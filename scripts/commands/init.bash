#!/bin/bash

main(){
  ksc_dir="${1:-$KSC_DIR}"

  # Runs in case $KSC_DIR not set
  source "set-ksc-dir.bash"
  kcs_dir_path "$ksc_dir"

  mkdir -p "$ksc_dir"
  cp -r ../../default-config/**/* "$ksc_dir"
}

main "$@"
