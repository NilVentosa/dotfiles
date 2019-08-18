#!/bin/bash

dotfilesFolder=~/repos/dotfiles/

function copyDotfiles() {
	cp ~/.bashrc "$dotfilesFolder"/.bashrc
	echo "Moving .bashrc"
	cp ~/.Xresources "$dotfilesFolder"
	echo "Moving .xintrx"
	cp ~/.xinitrc "$dotfilesFolder"
	echo "Moving i3 config"
	cp ~/.config/i3/config ~/repos/dotfiles/.config/i3
	echo "Moving i3status config"
	cp ~/.config/i3status/config ~/repos/dotfiles/.config/i3status
	echo "Moving scripts folder"
	cp ~/scripts/startup.sh "$dotfilesFolder"/scripts/
	cp ~/scripts/dotfiles.sh "$dotfilesFolder"/scripts/
	echo "Moving compton.conf"
	cp /etc/xdg/compton.conf "$dotfilesFolder"/compton.conf
	echo "Moving .vimrc"
	cp ~/.vimrc "$dotfilesFolder"
}
	copyDotfiles
