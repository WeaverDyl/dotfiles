export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/firefox
export PATH="$PATH:$(du "$HOME/.local/bin/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export TERMINAL=termite
export TERM=termite
export TERMCMD=termite

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"
