# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PS1="[\u] \w$ "
[[ -s /home/vagrant/.autojump/etc/profile.d/autojump.sh ]] && source /home/vagrant/.autojump/etc/profile.d/autojump.sh

alias dev-util="ssh -i ~/QA.pem root@54.84.208.176"
alias dev-api="ssh -i ~/QA.pem root@52.3.67.82"
alias qa-api03="ssh -i ~/QA.pem root@54.86.178.176"
alias qa-api04="ssh -i ~/QA.pem root@54.175.170.47"
alias qa-util03="ssh -i ~/QA.pem root@52.20.133.28"
alias qa-util01="ssh -i ~/QA.pem root@54.85.184.228"
alias qa-col02="ssh -i ~/QA.pem root@54.164.88.230"

