##############
### .zshrc ###
##############
# -> tuto shell: https://doc.ubuntu-fr.org/tutoriel/script_shell

###########
### GIT ###
###########
# -> Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

##################
### PROMPT ZSH ###
##################

#PS1=$'%{\033[01;38;5;240m%}%{\033[01;34m%}%n %{\033[01;38;5;240m%}- %{\033[01;31m%}[%{$vcs_info_msg_0_%}] %{\033[01;32m%}%~ %{\033[01;38;5;240m%}%(!.#.$) %{\033[00m%}'
zstyle ':vcs_info:git:*' formats '%b'

# -> début de ligne du terminal (+ coloration)
#export PS1="\n${WHITE_BOLD}\u : \w ${YELLOW}**\$(parse_git_branch)**${WHITE_BOLD}\n▸ ${RESET}"
#PROMPT='$rouge %n %(!.#.%%) '
#PS1=$'%{\033[01;38;5;240m%}[%{\033[01;34m%}%n %{\033[01;38;5;240m%}> %{\033[01;32m%}%~ %{\033[01;38;5;240m%}] \%(parse_git_branch) %(!.#.$) %{\033[00m%}'


#########################################
### Importe tous les fichiers d'alias ###
#########################################

for file in ~/git/.dotfiles/*/aliases.sh; do
  source "$file"
done

### -> Explicit Aliases:
if false; then
   source ~/.dotfiles/zsh/explicit_aliases.sh
fi

### -> fonction de troll
if false; then
   source ~/.dotfiles/troll/troll.sh
fi
alias troll="source ~/.dotfiles/troll/troll.sh"
#source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme