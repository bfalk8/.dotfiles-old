# Created by newuser for 5.1.1

export ZSH="$HOME/.oh-my-zsh";
ZSH_THEME="clean"
plugins=(git)

# set caps lock to escape key
setxkbmap -option caps:escape

# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

# make sure that if a program wants you to edit
# text, that Vim is going to be there for you
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

#start oh-my-zsh
source $ZSH/oh-my-zsh.sh
# ooh, what is this? Aliases?
source ~/.oh-my-zsh/lib/alias.zsh
# disable shared history
unsetopt share_history

# zplug settings here
source ~/.zplug/init.zsh
# plugins
# zplug "lukechilds/zsh-nvm"

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

export NVM_DIR="/home/brandon/.nvm"
alias nvmload='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'  # This loads nvm

# haskell stack
export PATH=/home/brandon/.local/bin:$PATH
