#!/bin/bash
set -e

main(){
  install_chruby_and_ruby-install
}

# this installs ruby & chruby under the .tmp folder within the repo
install_chruby_and_ruby-install(){
  temp_dir=".tmp"
  mkdir -p "$temp_dir"
  cd "$temp_dir" || exit 2
  install_ruby
  install_chruby
  cd ..
  rm -rf "$temp_dir"
}

install_ruby(){
  RUBY_INSTALL_TAR="ruby-install-0.7.0.tar.gz"
  RUBY_INSTALL_DIR="ruby-install-0.7.0/"

  if [[ ! -e "$RUBY_INSTALL_TAR" ]]; then
    wget -O "$RUBY_INSTALL_TAR" https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
  fi

  if [[ ! -e "$RUBY_INSTALL_DIR" ]]; then
    tar -xzvf "$RUBY_INSTALL_TAR"
  fi

  tar -xzvf "$RUBY_INSTALL_TAR"
  cd "$RUBY_INSTALL_DIR" || exit 2
  sudo make install
  cd ..
}

install_chruby(){
  CHRUBY_TAR="chruby-0.3.9.tar.gz"
  CHRUBY_DIR="chruby-0.3.9"
  if [[ ! -e "$CHRUBY_TAR" ]]; then
    wget -O "$CHRUBY_TAR" https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
  fi

  if [[ ! -e "$CHRUBY_DIR" ]]; then
    tar -xzvf "$CHRUBY_TAR"
  fi

  cd "$CHRUBY_DIR" || exit 2
  sudo ./scripts/setup.sh
  cd ..
}

main
