#!/bin/bash



# Bash completion
[[ $PS1 && -f /usr/local/share/bash-completion/bash-completion.sh ]] && \
	source /usr/local/share/bash-completion/bash-completion.sh



# Enable colored output on tab completion
bind 'set colored-stats on'

# Aliases
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls -G' # Enables colored output on UNIX systems

alias ff='fastfetch'



# Custom prompt
#if [[ -n $PS1 && -f ~/bash_prompt.sh ]]; then
#	source ~/bash_prompt.sh
#	ps1_dark_theme
#fi

if [[ -n $PS1 && -f ~/nota_prompt.sh ]]; then
	. ~/nota_prompt.sh
	ps1_nota_theme
fi



