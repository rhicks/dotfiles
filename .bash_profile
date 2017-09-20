[[ -x /usr/bin/keychain ]] && keychain --quiet --stop others id_rsa

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# source ~/.bash_gitprompt
export PATH=/usr/local/sbin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
