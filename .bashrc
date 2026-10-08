# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias vi='vim'
alias ll='ls -lhAF'
alias exif='exiftool'
alias z='zathura'

if [[ -e $HOME/.cargo/env ]]; then
  . $HOME/.cargo/env
fi
