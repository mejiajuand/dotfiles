# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source the cargo environment
if [[ -f $HOME/.cargo/env ]]; then
  . $HOME/.cargo/env
fi

# Environment variables
#export BROWSER='firefox'

# Alias
alias ll='ls -lhA --color=auto'
alias vi='vis'
alias x='exiftool'
alias z='zathura'

PS1='[\u@\h \W]\$ '
