[[ -x /usr/bin/keychain ]] && keychain --quiet --stop others id_rsa

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
