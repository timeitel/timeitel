# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/timeitel/.zfunctions")

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Aliases
alias ls='ls -F --color=auto'
alias ll='ls -lh'
alias lt='ls --human-readable --size -1 -S --classify'
alias l.='ls -d .* --color=auto'
alias left='ls -t -1'
alias zs='source ~/.zshrc'
alias c='code '
alias v='vim '
alias e='explorer.exe .'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias copy='clip.exe'
alias cwd='pwd | clip.exe'

alias g='git'
alias cg='cd `git rev-parse --show-toplevel`'
alias gs='git status -s'
alias gpl='git pull'
alias gps='git push'
alias ga='git add'
alias gaa='git add -A'
alias gu='git reset --mixed'
alias gc='git commit -m'
alias gl='git log --all --decorate --oneline --graph'
alias gr='git remote -v'
alias grb='git rebase -i'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gco='git checkout -b'

# Operate by word in terminal
bindkey -e
# Control + backspace / delete
bindkey '5~' kill-word
bindkey '^H' backward-kill-word
# Control + arrows
bindkey ';5C' forward-word
bindkey ';5D' backward-word
# Delete current line
bindkey '^[w' kill-whole-line
# Accept zsh-suggestion with ctrl+space
bindkey '^ ' autosuggest-accept
# Accept & execute zsh-suggestion with ctrl+enter
bindkey '^J' autosuggest-execute

# Scroll bindings to be set in windows terminal
bindkey -r '^e'
bindkey -r '^y'

# Spaceship prompt
SPACESHIP_GIT_SYMBOL=''
SPACESHIP_GIT_BRANCH_PREFIX=''
SPACESHIP_GIT_PREFIX='['
SPACESHIP_GIT_SUFFIX='] '
SPACESHIP_GIT_BRANCH_SUFFIX=''
SPACESHIP_GIT_STATUS_PREFIX=''
SPACESHIP_GIT_STATUS_SUFFIX=''
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-you-should-use/you-should-use.plugin.zsh
# zsh syntax highlighting to be sourced last
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
