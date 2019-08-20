#!/bin/bash
set -e

main(){
  echo "Installing PHPENV..."
  curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer \ | bash
}

main
