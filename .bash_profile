#!/bin/bash

# Launch startx on bash init (login to bash shell)
# startx looks for .xinitrc (in home, then globally)
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR = 1" ]; then

	# Only launch from tty1 to not lock us out of the system if something goes wrong
	if [[ "$(tty)" == "/dev/ttyv0" ]] then
		exec startx
	fi

fi


