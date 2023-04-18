#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
if [ -r ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
PS1='[\u@\h \W]\$ '
if [ -r ~/.asdf/asdf.sh ]; then
  source ~/.asdf/asdf.sh
fi
export LIBVIRT_DEFAULT_URI="qemu:///system"

if [ -r ~/.prompt ]; then
	source ~/.prompt
fi
if [ -r ~/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi
