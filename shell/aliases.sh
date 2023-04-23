##################
### Paramètres ###
##################
OS=$(uname -s)

#####################
### BASIC ALIASES ###
#####################

### cd / zoxide
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Crée un dossier et rentre dedans avec cd
mcd () {
	mkdir -p -- "$1" && cd -P -- "$1"
}

cdl () {
	cd "$1" && ls
}

enable_zoxide=false
if [ $enable_zoxide = "true" ]; then
	alias cd=zoxide
fi

### ls / exa
enable_exa=true
enable_exa_tree=true
#if [ which exa &>/dev/null ]; then
if [ $enable_exa = "true" ]; then
	# Remplacement de ls par exa
	alias ls="exa --classify --icons --group-directories-first"
	alias la="exa --classify --icons --group-directories-first --all"
	alias ll="exa --classify --icons --group-directories-first --long --header --group --git"
	alias lla="exa --classify --icons --group-directories-first --all --long --header --group --git"

	# remplacement de tree par celui de exa
	if [ $enable_exa_tree = "true" ]; then
		alias tree="exa --tree --classify"
	fi
else
	if [ "$OS" = "Linux" ]; then
		alias ls="ls -F --color=auto"
	elif [ "$OS" = "Darwin" ]; then
		alias ls="ls -F"
	fi
	alias la="ls -a -F"
	alias ll="ls -al -FG"
fi

### cat / bat
enable_bat=true
#if [ which bat &>/dev/null ]; then
if [ $enable_bat = "true" ]; then
	alias bat="bat --pager 'less -RF'"
fi

### grep / ripgrep (rg)
enable_ripgrep=false
if [ $enable_ripgrep = "true" ]; then
	alias grep=rg
else
	alias grep="grep --color=auto"
	alias egrep="egrep --color=auto"
fi

### du / dust
enable_dust=false
if [ $enable_dust = "true" ]; then
	alias du=dust
fi

### df / duf
enable_duf=false
if [ $enable_duf = "true" ]; then
	alias df=duf
fi

### find / fd
enable_find=false
if [ $enable_find = "true" ]; then
	alias find=fd
fi

### ps / procs
# /!\ Voir des exemple de config ici -> https://github.com/dalance/procs/tree/master/config
enable_procs=false
if [ $enable_procs = "true" ]; then
	alias ps=procs
fi

### sed / sd
enable_sd=false
if [ $enable_sd = "true" ]; then
	alias sed=sd
fi

### ping / gping
enable_gping=false
if [ $enable_gping = "true" ]; then
	alias ping=gping
fi

### grex

### bandwhich

### tokei

### hyperfine

### man
man () {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[45;93m' \
    LESS_TERMCAP_se=$'\e[0m' \
    command man "$@"
}

# termcap terminfo
# ks      smkx      make the keypad send commandsg
# ke      rmkx      make the keypad send digits
# vb      flash     emit visual bell
# mb      blink     start blink
# md      bold      start bold
# me      sgr0      turn off bold, blink and underline
# us      smul      start underline
# ue      rmul      stop underline
# so      smso      start standout (reverse video)
# se      rmso      stop standout

source aliases2.sh
