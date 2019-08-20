#!/bin/bash
set -e

main(){
  # will error if running as root
  check_if_root

  # Installs various dependencies
  apt_setup "$1"
  install_language_version_managers

  symlink_ksc_cli_into_bin
  copy_default_config
}

copy_default_config(){
  echo "Creating default ksc-cli config directory @ $HOME/.ksc-cli..."
  mkdir -p "$HOME/.ksc-cli"
  cp -r ./default-config/* "$HOME/.ksc-cli"
}

symlink_ksc_cli_into_bin(){
  mkdir -p "$HOME/bin"

  echo "Symlinking ./ksc-cli/.bash to $HOME/bin/ksc-cli"
  echo "Make sure you run the following in your bashrc or zshrc file:"
  echo "export PATH=\$PATH:\$HOME/bin"

  ln -f -s "$(pwd)/ksc-cli.bash" "$HOME/bin/ksc-cli"
}

check_if_root(){
  if [[ $(id -u) == 0 ]]; then
    echo "Do not run this as sudo / root. Rerun this script." 1>&2
    exit 1
  fi
}

# Install nvm, phpenv, chruby etc
install_language_version_managers(){
  cd "scripts/language-version-managers" || (echo "unable to cd to scripts/language-version-managers" 1>&2 && exit 1)

  echo "Installing language version managers..."

  for file in *.bash; do
    source "$file"
  done

  cd "../../" || (echo "Unable to return to base directory" 1>&2 && exit 1)
}

# Update, upgrade, then install libraries
apt_setup(){
  apt_all="${1:-$KSC_APT_ALL}"
  sudo apt update || sudo apt-get update
  sudo apt upgrade -y || sudo apt-get upgrade -y

  # IF no arguments given, set KSC_APT_ALL
  if [[ -z "$1" ]]; then
    set_ksc_apt_all
  fi
  sudo apt-get install $apt_all -y

  sudo apt-get autoremove -y
}

set_ksc_apt_all(){
  echo "Setting KSC_APT_ALL to install packages"

  if [[ "$KSC_APT_ALL" ]]; then
    echo "\$KSC_APT_ALL env var already set."
  elif [[ -e "$KSC_DIR/packages/apt.bash" ]]; then
    source "$KSC_DIR/packages/apt.bash"
    echo "Sourcing $KSC_DIR/packages/apt.bash..."
  elif [[ -e "$HOME/.ksc/packages/apt.bash" ]]; then
    source "$HOME/.ksc/packages/apt.bash"
    echo "Sourcing $HOME/.ksc/packages/apt.bash..."
  elif [[ -e "./default-config/packages/apt.bash" ]]; then
    source "./default-config/packages/apt.bash"
    echo "Sourcing ./default-config/packages/apt.bash..."
  else
    echo "Unable to find a config to source" 1>&2; exit 1
  fi

  echo "$KSC_APT_ALL"
}

main "$1"
