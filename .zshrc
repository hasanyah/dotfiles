# NOTE:  Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# NOTE:  Lines configured by compinstall
zstyle :compinstall filename '/home/hasan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# NOTE: Oh-my-zsh
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

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
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# NOTE: User config
#
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export PATH=$HOME/.local/scripts:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export NVM_PATH="/opt/nvim-linux64/bin"
export PATH=$NVM_PATH:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NOTES_DIR="$HOME/Projects/notes/"
export HR_PROJECTS_DIR="$HOME/Projects"
export PATH="/usr/local/opt/php@8.3/bin:$PATH"
export PATH="/usr/local/opt/php@8.3/sbin:$PATH"
export PATH="$HOME/Projects/scripts:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# Enable <C-r>
bindkey '^R' history-incremental-search-backward

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'

alias dcd="docker compose down -v"
alias dcb="docker compose build"
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcuf="docker compose up --build --force-recreate"
alias dcufd="docker compose up -d --build --force-recreate"
alias dcl="docker compose logs -f"
alias dnames="docker ps --format \"table {{.Names}}\" | (read -r; printf "%s\n" "$REPLY"; sort -k 3)"

dce() {
    docker compose exec -ti "$1" sh
}
print_additional_list() {
    additional_dirs=("$HOME/.local/scripts" "$HOME/.config/nvim")
    for dir in "${additional_dirs[@]}"; do
        echo "$dir"
    done
}
asd() {
    cd $((print_additional_list; find ~/Projects -mindepth 1 -maxdepth 1 -type d -o -type l) | fzf)
}


