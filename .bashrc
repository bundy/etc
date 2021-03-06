# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -al"
alias ps="ps -aux"
alias ack="ack-grep -i -r -a"
alias rmpyc="find . -name '*.pyc' -delete"
alias src="cd ~/src"
alias pymail="python -m smtpd -n -c DebuggingServer localhost:1025"
alias diffcs="git diff HEAD -- '*.cs'"

# virtualenv
export VIRTUALENV_USE_DISTRIBUTE=1
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# functions
function cdp () {
  cd "$(python -c "import os.path as _, ${1}; \
      print _.dirname(_.realpath(${1}.__file__[:-1]))"
      )"
}

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
        eval `$SSHAGENT $SSHAGENTARGS`
        trap "kill $SSH_AGENT_PID" 0
fi
ssh-add ~/.ssh/id_rsa
