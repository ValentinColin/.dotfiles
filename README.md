# My dotfiles
[![](https://tokei.rs/b1/github/ValentinColin/.dotfiles)](https://github.com/ValentinColin/.dotfiles)


Configuration de mes dotfiles

### Installer ZSH

Installer zsh:
```sh
# Linux
apt-get -y install zsh
# MacOS
brew install zsh
```

Changer de shell pour zsh:
```sh
chsh -s $(which zsh)
```

### Cloner le projet git

Cloner le projet dans **~/git** (si vous en avez envie):
```sh
git clone https://github.com/ValentinColin/.dotfiles.git ~/git/.dotfiles
```

### Appliquer les changements

Ajouter la ligne suivante au fichier **~/.zshrc** pour charger la config à chaque fois que vous utiliserez zsh
```sh
# source ~/git/.dotfiles/main.sh
echo -e "source ~/git/.dotfiles/main.sh\n" >> ~/.zshrc
```

Et enfin relancer votre terminal pour appliquer les changement,  
si vous étiez déjà sur zsh, il est suffisant de sourcer le fichier **.zshrc**
```sh
source ~/.zshrc     # Charger uniquement la config
                    # ou
exec $SHELL         # Recharger le shell entier
```
