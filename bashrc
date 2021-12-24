#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always'
LS_COLORS=$LS_COLORS:'tw=01;30;46:ow=01;04;35:' ; export LS_COLORS
PS1='[\u@\h \W]\$ '

PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH; export PATH
MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH; export INFOPATH

# set up beep sound
export BEEP1=/usr/share/sounds/freedesktop/stereo/suspend-error.oga
alias attn='paplay $BEEP1'

export BEEP2=/usr/share/sounds/freedesktop/stereo/complete.oga
alias full='paplay $BEEP2'
