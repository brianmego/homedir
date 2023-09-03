# # Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# if [ -e /lib/terminfo/x/xterm-256color ]; then
#     export TERM='xterm-256color'
# else
#     export TERM='xterm-color'
# fi

# # Set name of the theme to load.
# # Look in ~/.oh-my-zsh/themes/
# # Optionally, if you set this to "random", it'll load a random theme each
# # time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh/

# User configuration

export PATH=/usr/local/bin:~/.local/bin:$PATH
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

fpath=(~/.zsh/completion $fpath)
fpath=(/usr/share/zsh/vendor-completions $fpath)
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit -i

source $ZSH_CUSTOM/aliases
source $ZSH_CUSTOM/localrc

setopt extendedglob

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="-i --no-mouse --reverse --multi --inline-info --preview='bat --theme=TwoDark --style=numbers --color=always {}' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview' --bind='ctrl-a:select-all'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd $FD_OPTIONS"
export BAT_PAGER="less -R"
export RUSTC_WRAPPER=sccache

disable_gitprompt () {
    export PS1='%{$fg_bold[cyan]%}%n@%m %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[cyan]%}[%~]%{$reset_color%}
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
}

enable_gitprompt () {
    export PS1='%{$fg_bold[cyan]%}%n@%m %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[cyan]%}[%~]%{$reset_color%} $(git_prompt_info)
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source /Users/bmego/.antilles/antilles_completion.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /Users/bmego/.antilles/sdk_env_vars.sh
