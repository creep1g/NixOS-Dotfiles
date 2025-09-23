#!/usr/bin/env bash

set -e 

echo "Linking dotfiles into $HOME..." 

DOTFILES="$HOME/Dotfiles"

ln -sfn $DOTFILES/.config/dunst $HOME/.config/dunst
ln -sfn $DOTFILES/.config/fish $HOME/.config/fish
ln -sfn $DOTFILES/.config/hypr $HOME/.config/hypr
ln -sfn $DOTFILES/.config/kitty $HOME/.config/kitty
ln -sfn $DOTFILES/.config/nvim $HOME/.config/nvim
ln -sfn $DOTFILES/.config/qutebrowser $HOME/.config/qutebrowser
ln -sfn $DOTFILES/.config/rofi $HOME/.config/rofi
ln -sfn $DOTFILES/.config/spicetify $HOME/.config/spicetify
ln -sfn $DOTFILES/.config/wal $HOME/.config/wal
ln -sfn $DOTFILES/.config/waybar $HOME/.config/waybar
ln -sfn $DOTFILES/.config/mako $HOME/.config/mako
ln -sfn $DOTFILES/Wallpapers $HOME/Wallpapers

