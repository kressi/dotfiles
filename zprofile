#
# ~/.zprofile
#

# start ssh agent
eval $(ssh-agent)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
