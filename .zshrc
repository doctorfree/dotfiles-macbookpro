#
## @file zshrc
## @brief Zsh .zshrc file with shell environment setup
## @author Ronald Joe Record (rr at ronrecord dot com)
## @copyright Copyright (c) 2012, Ronald Joe Record, all rights reserved.
## @date Written 17-Sep-2012
## @version 1.0.1
##

### Setup and Configuration # Begin
#
## Install ZSH
# Install with package manager on most platforms
# Use 'brew install zsh' on Mac OS to get version 5.9
# To get version 5.9 on Ubuntu 20.04 build from source:
#   download source release archive from
#     https://zsh.sourceforge.io/Arc/source.html
#   extract archive, ./configure; make; sudo make install
#   add /usr/local/bin/zsh to /etc/shells
#   change login shell with 'chsh -s /usr/local/bin/zsh'
#
## Install Oh My Zsh:
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
## Install Powerlevel10k theme for Oh My Zsh:
# git clone https://github.com/romkatv/powerlevel10k.git \
#   $ZSH_CUSTOM/themes/powerlevel10k
#
## Set ZSH_THEME in $HOME/.zshrc
# ZSH_THEME="powerlevel10k/powerlevel10k"
#
## Install Zsh Plugins:
# git clone https://github.com/zsh-users/zsh-autosuggestions \
#   ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
#   ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-completions \
#   ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
#
## Install Meslo Nerd Font patched for Powerlevel10k
# See https://github.com/romkatv/powerlevel10k#fonts
# Configure terminal emulator, e.g. kitty.conf: 'font_family MesloLGS NF'
#
## Tab titles on Mac OS
# I needed to install the zsh-tab-title plugin to get Kitty tab titles right
#
#   git clone https://github.com/trystan2k/zsh-tab-title \
#     ~/.oh-my-zsh/custom/plugins/zsh-tab-title
#
# Add zsh-tab-title into plugins array in .zshrc
# Add the following:
#   ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
#   ZSH_TAB_TITLE_ONLY_FOLDER=true
#
### Setup and Configuration # End

# If using GPG_TTY=$(tty) this needs to happen before p10k instant prompt
# as p10k instant prompt redirects stdin. Or, just use $TTY as that is a zsh
# environment variable available at all times regardless of stdin redirection
export GPG_TTY=$TTY

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -d /usr/local/bin ] && PATH="/usr/local/bin:$PATH"
[ -d /usr/local/opt/curl/bin ] && PATH="/usr/local/opt/curl/bin:$PATH"
[ -d /usr/local/opt/libiconv/bin ] && PATH="/usr/local/opt/libiconv/bin:$PATH"
[ -d /opt/local/sbin ] && PATH="/opt/local/sbin:$PATH"
[ -d /opt/local/bin ] && PATH="/opt/local/bin:$PATH"
# To pickup GNU coreutils from the Brew installation path
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
[ -d /opt/homebrew/bin ] && PATH=/opt/homebrew/bin:$PATH
[ -d ~/bin ] && PATH=~/bin:$PATH

# Go paths
[ -d ~/go ] && export GOPATH=$HOME/go
[ "$GOPATH" ] && [ -d "$GOPATH/bin" ] && PATH="$PATH:$GOPATH/bin"
#if [ -x /opt/homebrew/bin/go ]; then
#  export GOROOT=/opt/homebrew
#else
#  [ -d /usr/local/go ] && export GOROOT=/usr/local/go
#fi
[ -d /usr/local/go/bin ] && {
  if [ `echo $PATH | grep -c /usr/local/go/bin` -ne "1" ]; then
    PATH="$PATH:/usr/local/go/bin"
  fi
}
[ -d $HOME/go/bin ] && {
  if [ `echo $PATH | grep -c $HOME/go/bin` -ne "1" ]; then
    PATH="$PATH:$HOME/go/bin"
  fi
}
# If you need to have openjdk first in your PATH:
PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH

# For compilers to find openjdk you may need to set:
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

[ -r .p4config ] && export P4CONFIG=.p4config
[ -d /build/toolchain ] && export TCROOT=/build/toolchain

# Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew Python path
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

[ -d $HOME/.rbenv/bin ] && export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# ConTeXt PATH
# export PATH=$PATH:$HOME/context/tex/texmf-osx-64/bin

# The next line updates PATH for the Google Cloud SDK.
# if [ -f ~/Google/google-cloud-sdk/path.zsh.inc ]; then . ~/Google/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
# if [ -f ~/Google/google-cloud-sdk/completion.zsh.inc ]; then . ~/Google/google-cloud-sdk/completion.zsh.inc; fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Highlighters to activate
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

typeset -A ZSH_HIGHLIGHT_STYLES
#
# Override main highlighter styles
#
# Differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
# Have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
# Disable highlighting of globbing expressions
ZSH_HIGHLIGHT_STYLES[globbing]='none'
#
# Override brackets highlighter styles
#
# Define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'

# MAGIC_ENTER_GIT_COMMAND='git status -u .'
# MAGIC_ENTER_OTHER_COMMAND='ls -lh .'
MAGIC_ENTER_GIT_COMMAND='git status'
MAGIC_ENTER_OTHER_COMMAND='ls'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# Not used but useful: common-aliases, fzf, themes
# Available plugins: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  magic-enter
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
)

# Check if git, gh, and thefuck are available
if command -v gh > /dev/null; then
  plugins+=(gh)
fi
if command -v git > /dev/null; then
  plugins+=(git)
fi
if command -v thefuck > /dev/null; then
  plugins+=(thefuck)
fi

# What OS are we running?
if [[ `uname` == "Darwin" ]]; then
  plugins+=(macos zsh-tab-title)
  ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
  ZSH_TAB_TITLE_ONLY_FOLDER=true
  if command -v brew > /dev/null; then
    HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    [ -f "$HB_CNF_HANDLER" ] && {
      source "$HB_CNF_HANDLER"
      plugins+=(command-not-found)
    }
    plugins+=(brew)
  fi
  if command -v port > /dev/null; then
    plugins+=(macports)
  fi
elif command -v apt > /dev/null; then
  plugins+=(debian command-not-found)
elif command -v pacman > /dev/null; then
  plugins+=(archlinux command-not-found)
elif command -v dnf > /dev/null; then
  plugins+=(dnf command-not-found)
fi

# Do we have systemd on board?
if command -v systemctl > /dev/null; then
  plugins+=(systemd)
fi

# Ditto Kubernetes?
if command -v kubectl > /dev/null; then
  plugins+=(kubectl)
fi

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Proper autocompletions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/share/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL=vim
export EDITOR=${VISUAL}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# If you are running through a proxy service some external programs may need
# to know the proxy setting (e.g. gem). If so, configure and uncomment:
# export http_proxy=http://proxy.vmware.com:3128
# export no_proxy=wallhaven.cc

export GOOGLE_APPLICATION_CREDENTIALS=$HOME/Keys/Text-to-Speech-d00ec3799688.json
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Homebrew coreutils package
[ -d /opt/homebrew/opt/coreutils/libexec/gnubin ] && {
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin${PATH:+:${PATH}}"
}
[ -d /opt/homebrew/opt/findutils/libexec/gnubin ] && {
  export PATH="/opt/homebrew/opt/findutils/libexec/gnubin${PATH:+:${PATH}}"
}

# enable color support of ls and also add handy aliases
have_dircolors=$(type -p dircolors)
if [ "${have_dircolors}" ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  export CLICOLOR=1
  export LSCOLORS=DxFxcxdxCxegedabagacad
# export LSCOLORS=Gxfxcxdxbxegedabagacad
  alias ls='/bin/ls -G'
fi

if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

[ -f ~/.ghcup/env ] && source ~/.ghcup/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.functions ] && source ~/.functions

[ -f ~/.private ] && source ~/.private

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[ -f ~/.aliases ] && source ~/.aliases

# Set the location of the bat config file
export BAT_CONFIG_PATH="/etc/bat.conf"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -d $HOME/.pyenv ] && export PYENV_ROOT="$HOME/.pyenv"
[ -d $HOME/.pyenv/bin ] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv > /dev/null; then
  eval "$(pyenv init --path)"
fi

export PATH="$PATH:/Users/ronald.record/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source the Lazyman shell initialization for aliases and nvims selector
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman shell initialization for nvims key binding
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
# Bob neovim version manager path
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
  export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
}
[ -f ~/src/AppleScripts/zshMusic/zshMusic.zsh ] && {
  source ~/src/AppleScripts/zshMusic/zshMusic.zsh
}
# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}

export TERM=xterm-256color

# Created by `pipx` on 2024-02-21 04:30:43
export PATH="$PATH:/Users/ronald.record/Library/Python/3.11/bin"
# Added by PMD
export PATH="$PATH:$HOME/.local/share/pmd-bin-7.0.0/bin"
if command -v pmd > /dev/null; then
  source <(pmd generate-completion)
fi
# 1Password CLI
if command -v op > /dev/null; then
  eval "$(op completion zsh)"; compdef _op op
fi
