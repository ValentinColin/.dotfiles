#########################################
### LISTE DE MES ALIAS PERSO POUR GIT ###
#########################################

alias gclone="git clone"
alias ginit="git init"

alias gf="git fetch"
alias gpl="git pull"

alias d="git diff"
alias s="git status"
alias c="git checkout"

alias b="git branch"
alias cm="git checkout master"

alias ga="git add"
alias aa="git add --all"

alias com="git commit -m"

alias p="git push"
#alias pp="git push origin $(git rev-parse --abbrev-ref HEAD)"

alias acp=addCommitPush

addCommitPush ()
{
    git add --all;
    git commit -m "$1";
    git push origin $(git rev-parse --abbrev-ref HEAD)
}