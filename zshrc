HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Allow extended glob patterns (like '**/' is actually '(*/)#')
setopt extended_glob

# Allow comments to be put in the command-line
#
#   $ echo 'Hello World'    # This comment will be valid now
#
# http://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments

# Check history commands before executing
setopt hist_verify

# Track history between shells properly
setopt inc_append_history

# Don't add duplicate history
setopt hist_ignore_dups

# Ignore whitespace a bit
setopt hist_reduce_blanks

# Don't need functions in history
setopt hist_no_functions

# Add to completions
fpath=(~/.zsh/plugins/completions/src ~/.zsh/zfunc $fpath)

# Custom de-duping adder to path
autoload addpath
addpath ~/.cabal/bin # haskell
addpath ~/.bin
addpath ~/.cargo/bin # rust
addpath ~/.gem/ruby/2.4.0/bin # ruby (e.g. sass)

# Vi mode ftw
bindkey -v

# Initialize colors
# Necessary for
#     $ echo "$fg[blue] hello world"
# Like is uesd in zsh-colors
autoload -U colors
colors

# Aliases
source ~/.zsh/zsh_aliases
# Environment vars
source ~/.zsh/zsh_env

# Initialize antigen-hs
source ~/.zsh/antigen-hs/init.zsh

# Python autocompletion (http://stackoverflow.com/a/246779/621449)
export PYTHONSTARTUP=~/.pythonrc

zle-keymap-select () {
    case $KEYMAP in
        vicmd) print -n -- "\033[0 q";; # block cursor
        viins|main) print -n -- "\033[3 q";; # less visible cursor
    esac
}
zle -N zle-keymap-select

# Prompt
PS1='%F{red}%n%f@%F{blue}%m%f %# '
RPS1='%F{green}%~ %f[%F{yellow}%?%f]'
PS2='%F{yellow}%_%f > '

# Racer
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/

# Set cursor style
#print -rn '4 q'

# Php
export PATH=$PATH:$(composer global config bin-dir --absolute 2>/dev/null)

export EDITOR=nvim

# Always make last command successful. Note that all errors (but the very last
# command) is not going to be surfaced anyway.
# https://github.com/Tarrasch/dotfiles/commit/214274da5b8734d9806c7d968d9a217f621a1888
true
