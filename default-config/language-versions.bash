export KSC_PHP_VERSION="7.3.8"
export KSC_RUBY_VERSION="2.6.2"
export KSC_NODE_VERSION="11.15.0"

main(){
  install_php
  install_ruby
  install_node
}

handle_error(){
  echo "$1 failed to install" 1>&2 && exit 1
}

install_php(){
  echo "Compiling PHP..."
  phpenv install "$KSC_PHP_VERSION" --skip-existing || handle_error "PHP"
  phpenv global "$KSC_PHP_VERSION"
}

install_ruby(){
  echo "Compiling Ruby..."
  ruby-install "$KSC_RUBY_VERSION" --no-reinstall || handle_error "Ruby"
  chruby "$RUBY_VERSION" || echo "Unable to use $RUBY_VERSION with chruby." 1&>2 && exit 1
}

install_node(){
  echo "Compiling NodeJS.."
  nvm install "$KSC_NODE_VERSION" || handle_error "NodeJS"
  nvm use "$KSC_NODE_VERSION"
}

main
