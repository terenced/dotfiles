# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export ZSH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='terenced'

# Example aliases
alias zshconfig="st ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="st ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm ruby python battery colored-man copyfile cp vagrant knife z colorize npm docker mix zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=/usr/local/bin:$PATH # Homebrew
# . `brew --prefix`/etc/profile.d/z.sh

export DEFAULT_USER=terry.dellino
export rvmsudo_secure_path=1

export NOKOGIRI_USE_SYSTEM_LIBRARIES=1
# export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future
export BERKSHELF_PATH=~/.berkshelf
export JAVA_HOME=$(/usr/libexec/java_home)
export NODE_PATH=/usr/local/lib/node_modules


# go
# export GOROOT=/usr/local/opt/go/libexec/bin
export GOROOT=/usr/local/Cellar/go/1.6/libexec
export PATH=$PATH:$GOROOT
export GOPATH="$HOME/Projects/gowork"

# General Alias
alias slime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias ls='ls -GF'
alias ls1='ls -1'
alias cdp='cd ~/Projects'
alias pspy='ps aux | grep python'
alias psfind='ps aux | grep '
alias cd..='cd ..'
alias rmrf='rm -rf'
alias lse='exa -hlUm --git'
alias lse1='exa -1'

# Emacs
alias ecl="/usr/local/Cellar/emacs-plus/24.5/bin/emacsclient -n"

alias bx='bundle exec'

# Git Alias
alias gti='git'
alias gs='git status'
alias gss='git status -s'
alias gb='git branch'
alias gko='git checkout'
alias gc='git commit'
alias gcam='git commit -a -m'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gl='git lg'
alias gl1='git log --oneline'
alias gbclean='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias cls='colorize'

# Work
export POLAR_TESTING_USING_SQLITE=True

# Python + Buildout
alias resetbuildout='rm -rf eggs/* git-eggs/* develop-eggs/* && python bootstrap.py && ./bin/buildout -c devel.cfg'
alias bdev='./bin/buildout -c devel.cfg'
alias btest='./bin/test --noinput --failfast'
alias btestd='./bin/django --noinput -s'

# PUB Alias **********************
alias pubu='pub update'
# ticket
alias pubt='pub ticket'
alias pubte='pub ticket expedite'
alias pubtf='pub ticket finish'
alias pubth='pub ticket halt'
alias pubtl='pub ticket list'
alias pubtp='pub ticket print'
alias pubtrs='pub ticket resume'
alias pubtr='pub ticket review'
alias pubts='pub ticket start'
alias pubtv='pub ticket view'
alias pubtm='pub ticket merge'
alias pubtml='pub ticket merge -l'

# node
alias pubn='pub node'
alias pubnc='pub node create'
alias pubnd='pub node destroy'
alias pubndb='pub node destroydb'
alias pubnl='pub node list'

# PUB Alias (End) **********************

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"
alias drmi="docker rmi"

# Stop all containers
dstopall() { docker stop $(docker ps -a -q); }

# Remove all containers
drmall() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmfall='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
driall() { docker rmi $(docker images -q); }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }


# Gulp max file hack
ulimit -S -n 2048

export NVM_DIR="/Users/terry.dellino/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Colored man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.rvm/bin:/opt/chefdk/bin:$PATH" # Add RVM to PATH for scripting
