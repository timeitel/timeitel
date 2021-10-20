if test -f ~/.config/git/git-prompt.sh
then
    . ~/.config/git/git-prompt.sh
else
    PS1='\[\033]0;${PWD#"${PWD%/*/*}/"}\007\]' # set window title
    PS1="$PS1"'\n'                 # new line
    PS1="$PS1"'\[\033[32m\]'       # change to green
    # PS1="$PS1"'\u@\h '             # user@host<space>
    #PS1="$PS1"'\[\033[35m\]'       # change to purple
    #PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
    # PS1="$PS1"'\w'                 # current working directory
    PS1="$PS1"'${PWD#"${PWD%/*/*}/"} '                 # current working directory
    if test -z "$WINELOADERNOEXEC"
    then
        GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
        COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
        COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
        COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
        if test -f "$COMPLETION_PATH/git-prompt.sh"
        then
            . "$COMPLETION_PATH/git-completion.bash"
            . "$COMPLETION_PATH/git-prompt.sh"
            PS1="$PS1"'\[\033[36m\]'  # change color to cyan
            PS1="$PS1"'`__git_ps1`'   # bash function
        fi
    fi
    # PS1="$PS1"' \[\033[37m\][\A]'  # 24h time, white
    PS1="$PS1"'\[\033[0m\]'        # change color
    PS1="$PS1"'\n'                 # new line
    PS1="$PS1"'> '                 # prompt: 
fi

# Aliases
alias ls='ls -F --color=auto'
alias l.='ls -d .* --color=auto'
alias c='code'
alias v='vim'
alias e='explorer.exe'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias copy='clip.exe'
alias cwd='pwd | clip.exe'

alias g='git'
alias gcd='cd `git rev-parse --show-toplevel`'
alias gs='git status'
alias gpl='git pull'
alias gf='git fetch'
alias gps='git push'
alias ga='git add'
alias gaa='git add -A'
alias gu='git reset --mixed'
alias gc='git commit -m'
alias gl='git log --all --decorate --oneline --graph'
alias grb='git rebase'
alias gb='git branch'
alias gco='git checkout'
