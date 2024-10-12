# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hasan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR="/usr/bin/vi"
export NOTES_DIR="$HOME/Projects/notes/"

alias ll='ls -alF'
alias la='ls -A'

alias dcd="docker compose down -v"
alias dcb="docker compose build"
alias dcu="docker compose up -d"
alias dcuf="docker compose up -d --build --force-recreate"
alias dcl="docker compose logs -f"
alias dnames="docker ps --format \"table {{.Names}}\" | (read -r; printf "%s\n" "$REPLY"; sort -k 3)"
alias asd='cd $(find ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)'
dce() {
    docker compose exec -ti "$1" sh
}
