source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle archlinux
antigen bundle command-not-found
antigen bundle rust-lang/zsh-config

antigen theme candy

antigen apply

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

autoload -U compinit
compinit

typeset -U path
path=(~/bin $path)

setopt completealiases
setopt HIST_IGNORE_DUPS

