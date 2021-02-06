#########################################
### Importe tous les fichiers d'alias ###
#########################################

for file in ~/.dotfiles/*/aliases.sh; do
  source "$file"
done