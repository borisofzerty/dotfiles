# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u \[$(tput setaf 5)\]\w \[$(tput setaf 4)\][\j] \t\n\[$(tput setaf 1)\]\! \$ \[$(tput sgr0)\]"
	PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\w\[$(tput setaf 1)\] \\$ \[$(tput sgr0)\]"
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u\[\033[00m\] \[\033[01;34m\]\w \[\033[00;37m\]\$\[\033[00m\] '
    PS4='\[\033[00;32m\[==> \[\033[00m\['
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    PS1="\e[31m$PS1\e[0m"
    ;;
*)
    ;;
esac

# some more ls aliases
alias ee='exit'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
# alias ,,='echo -e "### ### ### ### ###\n### ### ### ### ###\n### ### ### ### ###"'
alias hgrep='history | grep'
alias dfc='df -h | cowsay -bn'
alias mm='~/scripts/manmaker.sh'
alias tt='~/scripts/tmux.init.sh'
alias ff='fc 0 -200'
alias pd='pushd'
alias pd2='pushd +2'
alias pd3='pushd +3'
alias pd4='pushd +4'
alias pd5='pushd +5'

# functions: TODO put in different file
function mkcd () { mkdir -p $1 && cd $1 ; }
function ,, () {
    for i in $(seq 1 $(tput cols)) ; do
        echo -n "#"
    done
    echo ""
}
function wc4 () {
    dc -e "4 $(wc -c $1 | cut -d' ' -f1) * p"
}

export MANWIDTH=$(($(tput cols) - 3))

export CLICOLOR=1
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_local ] ; then
    . ~/.bash_local
fi

#rvm

# default editor: vim
export SUDO_EDITOR=vim
export EDITOR=vim

# display
#DISPLAY=:10.0

# tmux autostart/autoattach if needed
#[ $TERM == 'screen-256color' ] || tmux -2 attach -t wrk
#[ $? -ne 0 ] && [ -f ~/scripts/tmux.init.sh ] && . ~/scripts/tmux.init.sh

#if [ ! -z $TMUX ]
#then
#    pane=$(tmux list-panes | grep '(active)' | cut -c 1)
#    PS1="\[$(tput setaf 5)\]<\[$(tmux list-panes | grep '(active)' | cut -c 1)\]> "$PS1
#fi


export make='eval make 2>&1 | tee .log'
export run='./a.out'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [ $(uname -s) = 'Darwin' ]; then
    source /Users/boris/.rvm/scripts/rvm
    PATH=/usr/local/bin:$PATH # required by brew
fi
