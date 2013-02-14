# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -al"
alias ps="ps -aux"
alias rmpyc="find . -name '*.pyc' -delete"
alias src="cd ~/src"

# virtualenv
export VIRTUALENV_USE_DISTRIBUTE=1
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
