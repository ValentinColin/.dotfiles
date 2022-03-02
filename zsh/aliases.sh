##################
### Paramètres ###
##################
OS=$(uname -s)

#######################
### GENERAL ALIASES ###
#######################

# Liste des groupes
alias glist="cat /etc/group | awk -F: '{print $ 1}' | sort"

# set the title of the terminal
set_title () {
    echo -en "\e]0;$*\a"
}

### Raccourci terminal
alias reload="exec $SHELL"
alias quit=exit

### Raccourci d'ouverture de dossier dans le finder
if [ "$OS" = "Linux" ]; then
	alias finder=nautilus
	#alias finder="nautilus ."
	alias rc="nautilus ~/git/.dotfiles/"
elif [ "$OS" = "Darwin" ]; then
	alias finder="open $1"
	alias rc="open ~/git/.dotfiles/"
	
	alias isep="open ~/Dossier\ ISEP/A1"
	alias thales="open ~/Dossiers\ PRO/THALES/Algo-Thales"
fi

### Internet
if [ "$OS" = "Linux" ]; then
	alias moodle="firefox https://sso-portal.isep.fr"
	alias hpp="firefox https://planning-2021.isep.fr/etudiant"
	alias github="firefox https://github.com"
elif [ "$OS" = "Darwin" ]; then
	# $1 doit être un url
	alias chrome="open -a 'Google Chrome' $1"
	alias safari="open -a safari $1"
	alias moodle="open -a safari https://sso-portal.isep.fr"
	alias hpp="open -a safari https://planning-2021.isep.fr/etudiant"
	alias github="open -a safari https://github.com"
fi


#################
### Fonctions ###
#################

# Crée un dossier et rentre dedans avec cd
mkdirAndCD ()
{
    mkdir -p -- "$1" && cd -P -- "$1"
}
alias mcd="mkdirAndCD"

cdAndls ()
{
    cd "$1" &&
    ls
}
alias cdl=cdAndls
