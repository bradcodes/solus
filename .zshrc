# .zshrc - github.com/bradcodes
#
# TODO: Clean-up comments / structure
# TODO: Remove distro specific commented aliases. Much better to make different
#       files for different distros.

# for base16-shell off github.
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Set the prompt to something more pleasing.
# This is a common prompt across every OS I use.
PS1='%B%F{yellow}%m %f%b%# '
RPROMPT='%F{pink}%~%f %F{grey}: %F{magenta}%! '

# Boring $PATH business:
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/bin"
# Uncomment this to use dir_colors
# eval `dircolors -b $HOME/.dir_colors`

# nice little (HUGE) weather widget
# alias weather='clear; curl wttr.in/98682; echo'

# Navigation
# Enable support for 'z'
#. `brew --prefix`/etc/profile.d/z.sh
alias h="cd ~"
alias up="cd .."
alias vi="vim"
alias -g gg="| grep"

# for kbdlight
# So far this is only working under Arch
#alias kup='kbdlight up'
#alias kdown='kbdlight down'
#alias kmid="kbdlight up 20"
#alias koff="kbdlight down 50"

# eopkg (solus) related
alias e="sudo eopkg"

# pacman related
alias pacman="sudo pacman"
alias lsorphans='sudo pacman -Qdt'
alias rmorphans='sudo pacman -Rs $(pacman -Qtdq)'

# Docker aliases
# These work best under Arch and Debian
#alias dm='docker-machine'
#alias dps='docker ps'
#alias dpsrun='docker ps -l -q'
#alias dmls='docker-machine ls'
#alias dmimage='docker images'
#alias dmdeb='docker run -i -t debian /bin/bash'

# Docker containers
# These containers exist under MacOS and Debian
#alias dmaui='docker run --rm -h "maui" -t -i maui zsh'
#alias dkauai='docker run --rm -h "kauai" -t -i kauai zsh'
#alias doahu='docker run --rm -h "oahu" -t -i oahu zsh'
#alias dlanai='docker run --rm -h "lanai" -t -i lanai zsh'

# vim-style navigation
bindkey -v
bindkey -M viins ‘jk’ vi-cmd-mode
path+=('/usr/local/bin')
export PATH

# Common across all distros/containers/VMs
alias ls="ls --color=auto -F"
alias cl="clear; ls"
alias psa="ps aux"
alias kk="uname -mrs"
alias clp="clear;ls;pwd"
alias p3="ping -c 3"
alias treed="tree -Cd"
alias tree="tree -C"
alias tweet="rainbowstream"
alias sf="clear; echo; neofetch; echo;"
alias mem='top -l1 | grep PhysMem'

# Editing and sourcing .zshrc
alias zedit="vim ~/.zshrc"
alias zsource="source ~/.zshrc"

# Git aliases
alias g="git"
alias glog="git log"
alias gpretty="git log --pretty=oneline"
alias ggraph="git log --graph --oneline --decorate --all"


# Move and follow file to new dir:
# Example (from ~) mvf test.txt ~/downloads will move the file
# to ~/downloads and cd to that directory.
function mvf {
  if [[ -d $*[-1] ]]; then
    mv $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    mv $* && cd ${*[-1]%/*}
  fi
}
# Copy and follow file:
# Just like the mvf() function but this one only copies.
function cpf {
  if [[ -d $*[-1] ]]; then
    cp $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    cp $* && cd ${*[-1]%/*}
  fi
}

# Change to whatever directory the Finder is in
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# Use alt+s to insert sudo
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# Must be last in .zshrc
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
