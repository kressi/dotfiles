#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Start gnome-keyring daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Load xterm UI preferences
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

# Load customized keys
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec awesome
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
