if [ -n "$BASH_VERSION" ]; then
	if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
	fi
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
. "$HOME/.cargo/env"
