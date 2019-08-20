APT_LIBS="software-properties-common gnupg2 less ufw ack-grep libfuse2
                    apt-transport-https ca-certificates build-essential bison
                    zlib1g-dev libyaml-dev libcurl4-openssl-dev libssl-dev
                    libgdbm-dev libreadline-dev libffi-dev fuse make gcc libxml2-dev
                    re2c libbz2-dev libjpeg-turbo8-dev libpng-dev
                    libzip-dev libtidy-dev libxslt-dev automake libtool autoconf
                    flex libkrb5-dev libonig-dev"

APT_LANGUAGES="ruby ruby-dev golang php python3 python3-pip python-dev
                          python3-dev python-pip python3-neovim nodejs"

APT_TOOLS="curl tmux git vim zsh sqlite3 ctags rdoc libsqlite3-dev
                      openssh-client openssh-server dconf-cli gnome-terminal
                      postgresql pry rubygems fail2ban
                      neovim asciinema docker mosh yarn
                      silversearcher-ag virtualbox"

export KSC_APT_ALL="$APT_LIBS $APT_LANGUAGES $APT_TOOLS"
