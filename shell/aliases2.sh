######################
### ALIASES DIVERS ###
######################

alias root="sudo su"

alias pts="ls /dev/pts"
alias mypt="readlink /proc/self/fd/0"

alias password="head -c 32 /dev/urandom | sha256sum | base64 | head -c 32"
