############
### PATH ###
############
export PATH="$PATH:$HOME/.local/bin"

##############
### .zshrc ###
##############
# -> tuto shell: https://doc.ubuntu-fr.org/tutoriel/script_shell
source ~/git/.dotfiles/zsh/config.sh

###############
### GIT/VCS ###
###############
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[red]%}[%b]%{$reset_color%}"

# run before each prompt
precmd_vcs_info() {
	vcs_info
}
precmd_functions+=( precmd_vcs_info )

#########################################
### Importe tous les fichiers d'alias ###
#########################################

for alias_file in ~/git/.dotfiles/*/aliases.sh; do
  source "$alias_file"
done

### -> Explicit Aliases:
if false; then
   source ~/git/.dotfiles/zsh/explicit_aliases.sh
fi

### -> fonction de troll
if false; then
   source ~/git/.dotfiles/troll/troll.sh
fi
alias troll="source ~/.dotfiles/troll/troll.sh"
