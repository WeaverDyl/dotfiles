#!/bin/sh

DOTFILES=$HOME/dotfiles
SKIP="\.git|\.gitignore|README\.md|install\.sh|discord"
echo -e "Creating Symlinks...\n"

# Base Config files
for file in $( find -H "$DOTFILES" -maxdepth 1 -type f | grep -Ev $SKIP ) ; do
    target="$HOME/.$( basename $file )"
    echo "Creating symlink for $file at $target..."
    rm -rf $target
    ln -s $file $target
done

# Symlink vim, config, local folder
for file in $( find -H "$DOTFILES/config" ) ; do
    target="$HOME/.config/$( basename $file )"
    echo "Creating symlink for $file at $target..."
    rm -rf $target
    ln -s $file $target
done

rm -rf $HOME/.vim
rm -rf $HOME/.local/bin
ln -s $DOTFILES/vim $HOME/.vim
ln -s $DOTFILES/local/bin $HOME/.local
