[[ -x /usr/bin/keychain ]] && keychain --quiet --stop others id_rsa

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# source ~/.bash_gitprompt
export PATH=/usr/local/sbin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=$HOME/gems/bin:$PATH
eval "$(rbenv init -)"
