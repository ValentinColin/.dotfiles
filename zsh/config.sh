##################
### Paramètres ###
##################
OS=$(uname -s)


autoload -U colors select-word-style
colors                  # colours
select-word-style bash 	# ctrl+w on words

##################
### PROMPT ZSH ###
##################

setopt PROMPT_SUBST     # allow funky stuff in prompt and the uses of vcs_info
color="yellow"          # root is red, user is yellow
red="red"
# Apply the color red bold if the previous cmd failed ($? != 0)
local red_when_failed="\$(if [ \$? != 0 ]; then echo %{\$fg_bold[\$red]%}; fi)"
PROMPT="%{$fg[$color]%}%n@%m%{$reset_color%} %B%~%b${red_when_failed} $ %{$reset_color%}"
RPROMPT='${vcs_info_msg_0_}'
if [ "$(whoami)" = "root" ]; then
    #echo "\n!!! WARNING YOU ARE CURRENTLY LOGIN AS THE USER ROOT !!!\n"
    born2BeRoot=$(cat ~/git/.dotfiles/zsh/born2BeRoot.txt)
    born2Root=$(cat ~/git/.dotfiles/zsh/born2Root.txt)
    echo $born2Root
    color="red"         # root is red, user is yellow
    prompt="%{$fg[$color]%}%n@%m%{$reset_color%} %B%~%b${red_when_failed} # %{$reset_color%}"
fi;

####################
### Key bindings ###
####################
# Lookup in /etc/termcap or /etc/terminfo else, you can get the right keycode
# by typing ^v and then type the key or key combination you want to use.
# "man zshzle" for the list of available actions
bindkey -e                                      # emacs keybindings
bindkey '\e[1;5C' forward-word                  # C-Right
bindkey '\e[1;5D' backward-word                 # C-Left
bindkey '\e[2~'   overwrite-mode                # Insert
bindkey '\e[3~'   delete-char                   # Del
bindkey '\e[5~'   history-search-backward       # PgUp
bindkey '\e[6~'   history-search-forward        # PgDn
bindkey '^A'      beginning-of-line             # Home
bindkey '^D'      delete-char                   # Del
bindkey '^E'      end-of-line                   # End
bindkey '^R'      history-incremental-pattern-search-backward

#bindkey '^I'      autosuggest-accept            # Tab

##################
### Completion ###
##################
fpath+=~/.zfunc
autoload -Uz compinit
compinit
zmodload -i zsh/complist
setopt completealiases          # complete alisases
setopt hash_list_all            # hash everything before completion
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt auto_param_slash         # when completing a directory, a slash is added
setopt complete_in_word         # allow completion from within a word/phrase
#setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

zstyle ':completion::complete:*' use-cache on                                 # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache                                # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'                     # ignore case
zstyle ':completion:*' menu select=2                                          # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}                         # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate  # list of completers to use
zstyle ':completion:*' accept-exact '*(N)'

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
users=(jvoisin root)            # because I don't care about others
zstyle ':completion:*' users $users

#generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic r2
compdef _gnu_generic gdb
compdef _gnu_generic openssl

#############
### Pushd ###
#############
#setopt auto_pushd               # make cd push old dir in dir stack
#setopt pushd_ignore_dups        # no duplicates in dir stack
#setopt pushd_silent             # no dir stack after pushd or popd
#setopt pushd_to_home            # `pushd` = `pushd $HOME`

###############
### History ###
###############
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=4096                   # big history
SAVEHIST=4096                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
#unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
#setopt bang_hist                # !keyword

###############
### Various ###
###############
#setopt auto_cd                          # if command is a path, cd into it
#setopt auto_remove_slash                # self explicit
#setopt chase_links                      # resolve symlinks
#setopt correct                          # try to correct spelling of commands
#setopt extended_glob                    # activate complex pattern globbing
#setopt glob_dots                        # include dotfiles in globbing
setopt print_exit_value                 # print return value if non-zero
#unsetopt beep                           # no bell on error
unsetopt hist_beep                      # no bell on error in history
#unsetopt bg_nice                        # no lower prio for background jobs
setopt clobber                          # must use >! or >| to truncate existing files
unsetopt hup                            # no hup signal at shell exit
unsetopt ignore_eof                     # do not exit on end-of-file
unsetopt list_beep                      # no bell on ambiguous completion
unsetopt rm_star_silent                 # ask for confirmation for `rm *` or `rm path/*`
#setxkbmap -option compose:ralt          # compose-key

# TERMINAL TITLE
print -Pn "\e]0; [%{$OS%}] %n@%m \a"            # terminal title

TERM=xterm-256color                             # Colorz!
#export GCC_COLORS=1                             # Colorz in gcc!
#unset LD_PRELOAD                                # Meh.
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export EDITOR=vim                               # Meh.

###############
### Antigen ###
###############
ANTIGEN_CACHE=false
source ${0:a:h}/antigen/antigen.zsh

# Bundle
#antigen bundle zsh-users/zsh-completions        # remove good completions, so no
#antigen bundle zsh-users/zsh-autosuggestions    # not smart

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

