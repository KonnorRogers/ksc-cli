A more linear and less bulky version of my original VpsCli / VpsSetup implementations.

## Usage

```bash
./setup.bash
# Make sure you export proper variables for the language version managers
# Ensure $PATH contains "$HOME/bin"
# export "$PATH:$HOME/bin"

ksc-cli init
# Creates a $HOME/.kps-cli directory or wherever you specified

ksc-cli cp-config
ksc-cli install-all

```

## List of ENV variables

# ~/.ksc/config.bash
* KSC_CONFIG_FILES
* KSC_DOTFILES
* KSC_GNOME_TERMINAL_SETTINGS

# ~/.ksc/language-versions.bash
* KSC_PHP_VERSION
* KSC_RUBY_VERSION
* KSC_NODE_VERSION

# ~/.ksc/packages/\*.bash
* KSC_APT_ALL
* KSC_GEMS
* KSC_NPM_PACKAGES
* KSC_PIP2_PACKAGES
* KSC_PIP3_PACKAGES
* KSC_SNAP_PACKAGES

