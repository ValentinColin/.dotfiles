#######################
### GENERAL ALIASES ###
#######################

### Easier navigation: .., ..., ...., .....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

### Raccourci terminal
alias reload="exec $SHELL"
alias quit=exit
alias finder="open ."
alias la="ls -a"
alias ll="ls -al -FG"

### Raccourci d'ouverture de dossier dans le finder
alias isep="open ~/Dossier\ ISEP/A1"
alias app="open /Applications/MAMP/htdocs/APP_Humbie"
alias app-git="open ~/Github/APP_Humbie"
alias thales="cd ~/Dossiers\ PRO/THALES/Algo-Thales"
alias rc="open ~/.zshrc"

### Internet
# $1 doit être un url
alias chrome="open -a 'Google Chrome' $1"
alias safari="open -a safari $1"
alias moodle="open -a safari https://sso-portal.isep.fr"
alias hpp="open -a safari https://planning-2021.isep.fr/etudiant"
alias github="open -a safari https://github.com"

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