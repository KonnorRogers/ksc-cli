#!/bin/bash
set -e

main(){
  # will error if running as root
  check_if_root

  # Installs various dependencies
  apt_setup
  install_language_version_managers

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

  echo "Installing prequisite libraries..."

  libs='software-properties-common gnupg2 less ufw ack-grep libfuse2
  apt-transport-https ca-certificates build-essential bison zlib1g-dev
  libyaml-dev libcurl4-openssl-dev libssl-dev libgdbm-dev libreadline-dev libffi-dev fuse
  make gcc ruby ruby-dev golang php'
  sudo apt-get install $libs -y

  sudo apt-get autoremove -y
}

main
