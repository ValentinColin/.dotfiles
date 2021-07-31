##################
### Paramètres ###
##################
OS=$(uname -s)

#######################
### GENERAL ALIASES ###
#######################

# Alias for change the path of gcc/g++
if [ $OS = "Darwin" ]; then
	alias gcc="/usr/local/Cellar/gcc/10.2.0_4/bin/gcc-10"
	alias g++="/usr/local/Cellar/gcc/10.2.0_4/bin/g++-10"
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

