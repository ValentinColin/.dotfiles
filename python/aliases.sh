##########################
### ALIASES FOR PYTHON ###
##########################

### pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### Raccourci python
alias py=python3
alias pip=pip3
alias pipup="pip3 install --upgrade pip"