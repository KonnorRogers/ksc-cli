#!/bin/bash
set -e

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

main
