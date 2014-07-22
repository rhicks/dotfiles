## if [ "$TERM" != "screen" ]; then
##    screen -xRR
## fi



export PATH=$HOME/bin:$PATH
export WORKON_HOME=~/Code/Envs

[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh

case $OSTYPE in
	"darwin"*)
		alias ll='ls -lG'
		alias la='ls -laG'
    alias tracert='traceroute'
		;;
	"linux-gnu")
		alias ll='ls -l --color'
		alias la='ls -la --color'
    alias tracert='traceroute'
    alias lscreen='screen /dev/ttyUSB0 9600'
    alias porthole='/home/rhicks/Repo/systems/scripts/gnt-vnc-connect.py -n porthole.nero.net -c eugn-gnt.nero.net'
		;;
  "cygwin")
    alias ll='ls -l --color'
    alias la='ls -la --color'
    ;;
	*)
esac

alias geeknote='python $HOME/geeknote/geeknote.py'
alias todo='geeknote edit --note todo'
alias nn='geeknote edit --note nero-notes'
alias home='geeknote edit --note home'
alias hm='hm.py'
alias diffw='diff -w -y'
alias whoarin='whois -h whois.arin.net'
alias whogeek='whois -h whois.geektools.com'
alias whonetsol='whois -h whois.networksolutions.com'
alias whoripe='whois -h whois.ripe.net'
alias whoapnic='whois -h whois.apnic.net'
alias whoradb='whois -h whois.radb.net'

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}
function _prompt_command() {
    PS1="\n`_git_prompt`"'\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD `parse_git_branch` \n\$ '
}
PROMPT_COMMAND=_prompt_command


# export PS1='\n\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD `parse_git_branch` \n\$ '
#source ~/.autoenv/activate.sh
#source /usr/local/bin/virtualenvwrapper.sh
