# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# ** glob support.
shopt -s globstar

# ?*+@!() glob support.
shopt -s extglob

# Make `less` more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of `ls` and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Enable programmable completion features.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi
. <(npm completion)

# Git prompt.
GIT_PS1_SHOWDIRTYSTATE=true     # *, + (unstaged, staged)
GIT_PS1_SHOWSTASHSTATE=true     # $
GIT_PS1_SHOWUNTRACKEDFILES=true # %
GIT_PS1_DESCRIBE_STYLE=contains # v1.6.3.2~35
GIT_PS1_SHOWCOLORHINTS=true
. /usr/lib/git-core/git-sh-prompt
PROMPT_COMMAND='__git_ps1 "\w" "\n\\\$ "'

# Environment variables.
export PATH="$PATH:./node_modules/.bin"
export TWORLDDIR="$HOME/.tworld"
export TWORLDSAVEDIR="$HOME/.tworld/save"
