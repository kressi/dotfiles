# https://github.com/seebi/zshrc
# The following lines were added by compinstall {{{

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/michael/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall }}}

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# VCS Info {{{
# http://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# http://briancarper.net/blog/570.html
# https://opensource.apple.com/source/zsh/zsh-60/zsh/Misc/vcs_info-examples

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
    if [[ -n ${vcs_info_msg_0_} ]]; then
        PS1="${vcs_info_msg_0_}%# "
    else
        PS1="%m%# "
    fi
}
# }}}

# Vim keybindings {{{
# https://dougblack.io/words/zsh-vi-mode.html
bindkey -v
# }}}

# Aliases {{{
alias ls='ls -alh --color=auto'
alias dup='(xterm &)'
alias scansystem="clamscan --recursive=yes --infected --exclude-dir='^/sys|^/proc|^/dev|^/lib|^/bin|^/sbin' /"

# ssh-agent, do not prompt for ssh-add until needed and delete alias afterwards
# https://superuser.com/a/471640
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
# }}}

# Key bindings {{{
# https://wiki.archlinux.org/index.php/Zsh#Key_bindings
# https://github.com/gregf/dotfiles/blob/master/zsh/zkbd.zsh

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-beginning-search
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
# }}}

# Environment {{{
# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Golang
export GOPATH=/home/michael/go
export PATH=$PATH:$GOPATH/bin

# Ruby
export PATH="/home/michael/.gem/ruby/2.4.0/bin:$PATH"

# Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Scala
export SCALA_HOME=/usr/share/scala
# subuser
#export PATH="/home/michael/.subuser/bin:$PATH"

#Jenkins X
export PATH="/home/michael/.jx/bin:$PATH"
# }}}
