#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
LS_COLORS=$LS_COLORS:'tw=01;30;46:ow=01;04;35:' ; export LS_COLORS
PS1='[\u@\h \W]\$ '

PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH; export PATH
MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH; export INFOPATH

setxkbmap -option caps:swapescape

# to print time of command exec after every command
source ~/scripts/bash_command_timer.sh
