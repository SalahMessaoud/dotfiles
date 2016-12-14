# Path to your oh-my-zsh installation.
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"
export EDITOR="vim"
export VISUAL=$EDITOR
export ZSH=/home/drupalizer/.oh-my-zsh
# Check if zplug is installed
 if [[ ! -d ~/.zplug  ]]; then
   git clone https://github.com/zplug/zplug ~/.zplug
     source ~/.zplug/init.zsh && zplug update --self
     fi

# Essential
source ~/.zplug/init.zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git rsync)
# Git
zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "plugins/gitfast", from:oh-my-zsh, if:"which git"
zplug "plugins/git-extras", from:oh-my-zsh, if:"which git"
zplug "plugins/gitignore", from:oh-my-zsh, if:"which git"
zplug "Seinh/git-prune", if:"which git"
zplug "plugins/rsync", from:oh-my-zsh, if:"which rsync"
zplug "zsh-users/zsh-syntax-highlighting"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
     printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load
# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/usr/local/.rvm/bin"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$HOME/.composer/vendor/bin:$PATH"
autoload bashcompinit
bashcompinit
source /home/drupalizer/.composer/vendor/drush/drush/drush.complete.sh
. /etc/profile.d/vte.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export AHOY_CMD_PROXY="DOCKER"
source /home/drupalizer/.default.docker-machine
complete -F "ahoy --generate-bash-completion" ahoy

export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
