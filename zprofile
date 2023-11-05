#
# ~/.zprofile
#

eval $(ssh-agent)

if [ -z "${DISPLAY}" ]; then
  if [ "${XDG_VTNR}" -eq 1 ]; then
    XDG_CURRENT_DESKTOP=sway exec sway
  elif [ "${XDG_VTNR}" -eq 2 ]; then
    exec startx
  fi
fi

