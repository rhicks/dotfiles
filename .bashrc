if [ "$TERM" != "screen" ]; then
    screen -xRR
fi

[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh

alias ll='ls -l --color'
alias la='ls -la --color'
alias geeknote='python $HOME/geeknote/geeknote.py'
alias todo='geeknote edit --note todo'
alias nn='geeknote edit --note nero-notes'
alias tracert='traceroute'

#PS1="[\d \t \u@\h:\w ] $ "
#PS1="[\D{%F} \t]\n\n\u@\h \w\n$ "
PS1='\n\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n\$ '

## export AA_P="export PVE=\"\\033[m\\033[38;5;2m\"\$(( \`sed -n \"s/MemFree:[\\t ]\\+\\([0-9]\\+\\) kB/\\1/p\" /proc/meminfo\` / 1024 ))\"\\033[38;5;22m/\"\$((\`sed -n \"s/MemTotal:[\\t ]\\+\\([0-9]\\+\\) kB/\\1/p\" /proc/meminfo\`/ 1024 ))MB\"\\t\\033[m\\033[38;5;55m\$(< /proc/loadavg)\\033[m\";echo -en \"\"" \
## export PROMPT_COMMAND="history -a;((\$SECONDS % 10==0 ))&&eval \"\$AA_P\";echo -en \"\$PVE\";" \
## export PS1="\\[\\e[m\\n\\e[1;30m\\][\$\$:\$PPID \\j:\\!\\[\\e[1;30m\\]]\\[\\e[0;36m\\] \\T \\d \\[\\e[1;30m\\][\\[\\e[1;34m\\]\\u@\\H\\[\\e[1;30m\\]:\\[\\e[0;37m\\]\${SSH_TTY} \\[\\e[0;32m\\]+\${SHLVL}\\[\\e[1;30m\\]] \\[\\e[1;37m\\]\\w\\[\\e[0;37m\\] \\n(\$SHLVL:\\!)\\\$ " \
## export PVE="\\033[m\\033[38;5;2m813\\033[38;5;22m/1024MB\\t\\033[m\\033[38;5;55m0.25 0.22 0.18 1/66 26820\\033[m" && eval $AA_P
