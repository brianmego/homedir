# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# ZSH editor functions: https://zsh.sourceforge.io/Doc/Release/Editor-Functions-Index.html#Editor-Functions-Index
#
# Search typed command through history with up and down arrows
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Basic ZSH bindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^[[3~" delete-char
bindkey "5~" delete-word
bindkey "^R" history-incremental-search-backward
bindkey "^[[3;5~" delete-word
bindkey "^H" backward-delete-word

# ctrl left and ctrl right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export WORDCHARS='*?[]~=&;!#$%^(){}<>' # This is what counts as a WORD, for forward-word and backward-word functions

# Enable case-insensitive completion, prefer exact matches
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Use menu selection for completion
zstyle ':completion:*' menu select=2
# Case-insensitive globbing (used in pathname expansion)
setopt nocaseglob

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
ZSH_CUSTOM="$HOME/.zsh/"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# User configuration

export PATH=/usr/local/bin:~/.local/bin:$PATH
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
export CARGO_BUILD_BUILD_DIR=~/.cargo/build
# export PAGER="less -FRX"

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
source $HOME/.antilles/antilles_completion.zsh
source <(COMPLETE=zsh jj)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export BACON_CONFIG="$HOME/.config/bacon.toml"
