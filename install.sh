#!/bin/sh

DOTFILES=$HOME/dotfiles
SKIP="\.gitignore|README.MD|install.sh"
# also skip wallpapers folder
# Symlinks
echo -e "Creating Symlinks...\n"
for file in $( find -H "$DOTFILES" -maxdepth 1 -type f \( ! -iname "$SKIP" \) ) ; do
    target="$HOME/.$( basename $file )"
    if [ -e $target ] ; then
        echo "Skipping $target as it already exists..."
    else
	echo "Creating symlink for $file at $target..."
	# ln -s here
    fi
done
