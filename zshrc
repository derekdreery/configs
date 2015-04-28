source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle archlinux
antigen bundle command-not-found

antigen theme candy

autoload -U compinit
compinit
