#Source Antigen
source ~/bin/antigen.zsh

#Antigen Load Things
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  git
  command-not-found
  zsh-users/zsh-syntax-highlighting
  brew
  npm
  adb
  ant
EOBUNDLES

# Antigen Load Theme
antigen theme agnoster

# Tell antigen that you're done.
antigen apply


###########################################################
# 'The Fuck' Intergration...                              #
###########################################################
eval $(thefuck --alias)



###########################################################
# iTerm's shell intergration                              #
###########################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"



###########################################################
# Do Ruby Things                                          #
###########################################################
# eval "$(rbenv init -)"


###########################################################
# This automatically switches Node Versions when a .nvmrc #
# file is found in the root of your project               #
###########################################################
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
