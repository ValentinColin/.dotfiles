OS=$(uname -s)

##################
### CONFIG MAN ###
##################

# "bat" as manpager
if [ "$OS" = "Linux" ]; then
	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif [ "$OS" = "Darwin" ]; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
