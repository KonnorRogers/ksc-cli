#!/bin/bash

PHP_VERSION="7.3.8"

main(){
  curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer \ | bash


  source "../restart_shell.bash"

  # In case this isnt set by the user
  export PHPENV_ROOT="$HOME/.phpenv"
  if [ -d "${PHPENV_ROOT}" ]; then
    export PATH="${PHPENV_ROOT}/bin:${PATH}"
    eval "$(phpenv init -)"
  fi

  phpenv install --skip-existing "$PHP_VERSION"
  phpenv global "$PHP_VERSION"
}

main
