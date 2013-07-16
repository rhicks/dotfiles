if [ "$TERM" != "screen" ]; then
    screen -xRR
fi

alias ll='ls -l --color'
alias la='ls -la --color'

#PS1="[\d \t \u@\h:\w ] $ "
PS1="\n[\D{%F} \t \w]\n\u@\h\$ "
