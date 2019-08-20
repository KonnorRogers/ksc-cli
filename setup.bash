#!/bin/bash
set -e

main(){
  # will error if running as root
  check_if_root

  # Installs various dependencies
  apt_setup
  install_language_version_managers

  symlink_ksc_cli_into_bin
}

symlink_ksc_cli_into_bin(){
  ln -f -s "./ksc-cli.bash" "$HOME/bin/ksc-cli"
}

check_if_root(){
  if [[ $(id -u) == 0 ]]; then
    echo "Do not run this as sudo / root. Rerun this script." 1>&2
    exit 1
  fi
}

# Install nvm, phpenv, chruby etc
install_language_version_managers(){
  cd "scripts/language-version-managers" || echo "unable to cd to scripts/language-version-managers" 1>&2 && exit 1

  echo "Installing language version managers..."

  for file in *.bash; do
    source "$file"
  done

  cd "../../" || echo "Unable to return to base directory" 1>&2 && exit 1
}

# Update, upgrade, then install libraries
apt_setup(){
  sudo apt update || sudo apt-get update
  sudo apt upgrade -y || sudo apt-get upgrade -y

  set_ksc_apt_all
  # libs='software-properties-common gnupg2 less ufw ack-grep libfuse2
  # apt-transport-https ca-certificates build-essential bison zlib1g-dev
  # libyaml-dev libcurl4-openssl-dev libssl-dev libgdbm-dev libreadline-dev libffi-dev fuse
  # make gcc ruby ruby-dev golang php'

  # Purposely not double quoted to only send one sudo apt install and not error
  sudo apt-get install $KSC_APT_ALL -y

  sudo apt-get autoremove -y
}

set_ksc_apt_all(){
  if [[ "$KSC_APT_ALL" ]]; then
    echo "\$KSC_APT_ALL env var already set."
    return
  elif [[ -e "$KSC_DIR/packages/apt.bash" ]]; then
    source "$KSC_DIR/packages/apt.bash"
  elif [[ -e "$HOME/.ksc/packages/apt.bash" ]]; then
    source "$HOME/.ksc/packages/apt.bash"
  elif [[ -e "" ]]; then
    source "./default-config/packages/apt.bash"
  fi
}

main
