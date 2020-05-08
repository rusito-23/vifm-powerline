#!/bin/zsh

# ----------------------------------------------------------------------------
# ALIAS
# ----------------------------------------------------------------------------

# ------- #
#   MISC  #
# ------- #

setopt noautoremoveslash
alias ls='ls -GFh'
alias l='ls'
alias la='ls -a'
alias ll='ls -FGLAhp'
alias ldir='ls -d'
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias src='source ~/.zshrc'
alias sudoer='export ITERM_PROFILE=rusito23-zshrc ;sudo -s /bin/zsh'

# ------- #
# EDITION #
# ------- #

alias mdedit='open -a MacDown'
alias vi='nvim'
alias vim='nvim'
alias nvim_rmswap='rm ~/.local/share/nvim/swap/*.swp'
alias cat='bat'

# ------------- #
# FILE HANDLING #
# ------------- #

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Create a dir and cd inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        moves dir to trash
cdl () { cd "$1" && ls; }                   # cdl:          cd into dir and ls
extract () {
    # Extract most files with one command
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# ------- #
# SEARCH  #
# ------- #

alias qfind="find . -name "                 # qfind:    Look quickly for a file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file in current dir
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file in current dir that starts with given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file in current dir that ends with given string
((${+aliases[rgrep]})) && unalias rgrep
((${+aliases[fgrep]})) && unalias fgrep
rgrep () { grep --color=auto -rInH --exclude-dir=$2 "$1" *; } 
fgrep () { grep --color=auto -rInHol --exclude-dir=$2 "$1" *; }
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }    # spotlight : search with spotlight

# ------- #
# NETWORK #
# ------- #

alias myip='ifconfig |grep inet'
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}
