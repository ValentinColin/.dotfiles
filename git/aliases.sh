#########################################
### LISTE DE MES ALIAS PERSO POUR GIT ###
#########################################

alias s="git status"
alias c="git checkout"
alias b="git branch"

alias acp=addCommitPush-unsigned
alias acps=addCommitPush-signed

addCommitPush-unsigned ()
{
    git add --all;
    git commit --message "$1";
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

addCommitPush-signed ()
{
    git add --all;
    git commit --gpg-sign --message "$1";
    git push origin $(git rev-parse --abbrev-ref HEAD)
}
