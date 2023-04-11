export CLICOLOR=1

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PS1="[\u] \w$ "
[[ -s /home/vagrant/.autojump/etc/profile.d/autojump.sh ]] && source /home/vagrant/.autojump/etc/profile.d/autojump.sh

source ~/.bashrc_local

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /Users/bmego/.antilles/antilles_completion.bash
