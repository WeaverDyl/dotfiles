export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/firefox
export PATH="$PATH:/home/dylanw/.gem/ruby/2.6.0/bin:/opt/java/bin:/opt/java/jre/bin:$(du "$HOME/.local/bin/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export JAVA_HOME=${JAVA_HOME:-/opt/java}
export QT_QPA_PLATFORMTHEME="qt5ct"
export TERMINAL="termite"
