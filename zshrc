source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle archlinux
antigen bundle command-not-found

antigen theme candy

autoload -U compinit
compinit

typeset -U path
path=(~/bin $path)

setopt completealiases
setopt HIST_IGNORE_DUPS

if (( $+commands[thefuck] )) then
    alias fuck='eval $(thefuck $(fc -ln -1))'
    alias f='fuck'
    alias FUCK='fuck'
fi
