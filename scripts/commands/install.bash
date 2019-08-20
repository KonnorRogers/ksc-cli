#!/bin/bash
set -e

install_all(){
  install_all_packages
  install_all_languages
  install_all_additional
}

install_all_packages(){
  install_apt_packages
  install_gems_packages
  install_npm_packages
  install_pip_packages
  install_snap_packages
}
export -f install_all_packages

install_apt_packages(){
  packages="${1:-$KSC_APT_ALL}"
  sudo apt update
  sudo apt upgrade -y
  sudo apt install -y $packages
}
export -f install_apt_packages

install_gems_packages(){
  gems="${1:-$KSC_GEMS}"
  gem install $gems
}
export -f install_gems_packages

install_npm_packages(){
  npm_packages="${1:-$KSC_NPM_PACKAGES}"
  npm install --global $npm_packages
}
export -f install_npm_packages

install_pip2_packages(){
  pip2="${1:-$KSC_PIP2_PACKAGES}"
  pip2 install --user --upgrade $pip2
}
export -f install_pip2_packages

install_pip3_packages(){
  pip3="${1:-$KSC_PIP3_PACKAGES}"
  pip3 install --user --upgrade $pip3
}
export -f install_pip3_packages

install_snap_packages(){
  snap="${1:-$KSC_SNAP_PACKAGES}"
  sudo snap install $snap
}
export -f install_snap_packages

# Installing languages
install_all_languages(){
  install_php
  install_ruby
  install_node
}
export -f install_all_languages

handle_error(){
  echo "$1 failed to install" 1>&2
}

install_php(){
  echo "Compiling PHP..."
  VER="${1:-$KSC_PHP_VERSION}"
  (phpenv install "$VER" --skip-existing && phpenv global "$VER") || handle_error "PHP"

}
export -f install_php

install_ruby(){
  echo "Compiling Ruby..."
  VER="${1:-$KSC_RUBY_VERSION}"
  ruby-install "$VER" --no-reinstall || handle_error "Ruby"
  chruby "$VER" || echo "Unable to use $VER with chruby." 1&>2
}
export -f install_ruby

install_node(){
  echo "Compiling NodeJS.."
  VER="${1:-$KSC_NODE_VERSION}"
  (nvm install "$VER" && nvm use "$VER") || handle_error "NodeJS"
}
export -f install_node

install_additional(){
  echo "install additional"
}
export -f install_additional

