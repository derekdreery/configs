ANTIGEN_PATHS=(/usr/share/zsh/scripts/antigen/antigen.zsh /usr/share/zsh-antigen/antigen.zsh)
for PATH_TEST in $ANTIGEN_PATHS
do
    if [ -f "$PATH_TEST" ]
    then
        ANTIGEN_PATH=$PATH_TEST
        break
    fi
done

if [ ! -z "$ANTIGEN_PATH" ]
then
    source $ANTIGEN_PATH

    antigen use oh-my-zsh
    antigen bundle pip
    antigen bundle vagrant
    antigen bundle wd
    antigen bundle ruby
    antigen bundle rust-lang/zsh-config
    antigen bundle git
    antigen bundle archlinux
    antigen bundle command-not-found

    antigen theme candy
    antigen apply
fi


[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

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

[[ -f '/etc/profile.d/vte.sh' ]] && source /etc/profile.d/vte.sh
