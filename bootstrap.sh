#!/bin/sh
# bootstrap.sh — symlink this repo's shell files into $HOME.
#
# Run once per machine after cloning. Safe to re-run.
# Finds the repo automatically, so it works no matter where you cloned it.

set -eu

# Absolute path to the directory this script lives in (the repo root).
REPO_DIR=$(cd "$(dirname "$0")" && pwd)

link() {
    src="$REPO_DIR/$1"
    dest="$HOME/$2"

    # Back up a real file (not an existing symlink) before replacing it.
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  backing up $dest -> $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    ln -sfn "$src" "$dest"
    echo "  linked $dest -> $src"
}

echo "Linking shell files from $REPO_DIR:"
link zprofile        .zprofile
link zshrc           .zshrc
link zshrc_alias     .zshrc_alias
link zshrc_functions .zshrc_functions

echo "Done. Open a new terminal, or run: exec zsh -l"
