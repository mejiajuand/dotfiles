# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source the cargo environment
if [[ -f $HOME/.cargo/env ]]; then
  . $HOME/.cargo/env
fi

# Aliases
alias vi='vim'
alias ll='ls -lhAF'
alias exif='exiftool'
alias z='zathura'

# Variables
PS1='[\u@\h \W]\$ '
