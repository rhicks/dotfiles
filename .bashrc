## if [ "$TERM" != "screen" ]; then
##    screen -xRR
## fi

# PATH=$PATH:$HOME/.local/bin:$HOME/bin

# export TERM=screen-it
# export TERM=vt100
# export TERM=xterm-256color
export PANEL_HEIGHT=24
#export PANEL_FONT_FAMILY="-xos4-terminus-*-r-*-*-*-*-*-*-*-*-*-1,-misc-dejavu sans mono-medium-r-normal--11-*-*-*-m-*-iso10646-1"
export PANEL_FIFO="/tmp/panel-fifo"
export PATH=$HOME/bin:$PATH
export WORKON_HOME=~/Code/Envs

[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh

case $OSTYPE in
    "darwin"*)
        alias ll='ls -lG'
        alias la='ls -laG'
        alias tracert='traceroute'
        # source /usr/local/bin/activate.sh
        source /usr/local/bin/virtualenvwrapper.sh
    ;;
    "linux-gnu")
        alias ll='ls -lh --color'
        alias la='ls -lah --color'
        alias ls='ls --color'
        alias tracert='traceroute'
        alias lscreen='screen /dev/ttyUSB0 9600'
        alias porthole='/home/rhicks/Repo/systems/scripts/gnt-vnc-connect.py -n porthole.nero.net -c eugn-gnt.nero.net'
        # source /usr/bin/activate.sh
        source /usr/bin/virtualenvwrapper.sh
    ;;
    "cygwin")
        alias ll='ls -l --color'
        alias la='ls -la --color'
    ;;
    *)
esac

alias geeknote='python $HOME/geeknote/geeknote/geeknote.py'
alias todo='geeknote edit --note todo'
alias nn='geeknote edit --note nero-notes'
alias home='geeknote edit --note home'
alias diffw='diff -w -y'
alias whoarin='whois -h whois.arin.net'
alias whogeek='whois -h whois.geektools.com'
alias whonetsol='whois -h whois.networksolutions.com'
alias whoripe='whois -h whois.ripe.net'
alias whoapnic='whois -h whois.apnic.net'
alias whoradb='whois -h whois.radb.net'

        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

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

 # Determine active Python virtualenv details.
 function set_virtualenv () {
   if test -z "$VIRTUAL_ENV" ; then
       PYTHON_VIRTUALENV=""
   else
       PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
   fi
 }

function _prompt_command() {
    set_virtualenv
    # PS1="\n`_git_prompt`"'\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD \n\$ '
    PS1="\n`_git_prompt`"'\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD `parse_git_branch` \n\$ '"${PYTHON_VIRTUALENV}"
}
PROMPT_COMMAND=_prompt_command


# export PS1='\n\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD `parse_git_branch` \n\$ '

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

