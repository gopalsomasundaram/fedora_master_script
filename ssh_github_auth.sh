#!/bin/bash

#assume doing it for arch for now
#first eval if openssh and xclip are present

dependency_check(){
	check_openssh="$(pacman -Qqs openssh)"
	check_xclip="$(pacman -Qqs xclip)"
	if [ -z "$check_openssh" ]; then
		echo -n "openssh is not installed, would you like to install it? [y/n]: "
		read a;
		if [ "$a" == "y" || "$a" == "Y" ]; then
			sudo pacman -S openssh -y
		else
			exit 0;
		fi
	fi
	if [ -z "$check_xclip" ]; then
		echo -n "xclip is not installed, would you like to install it? [y/n]: "
		read a;
		if [ "$a" == "y" || "$a" == "Y" ]; then
			sudo pacman -S xclip -y
		else
			exit 0;
		fi
	fi
}

local_ssh_key_gen() {
	#replace with your mail ofc
	ssh-keygen -t ed25519 -C "gopal10092004@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
	cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
	echo "your key has been copied to the clipboard, log in and visit https://github.com/settings/keys and add the key"
}

set_local_user() {
	#replace with your github username and email
	git config --global user.name "gopalsomasundaram"
	git config --global user.email "gopal10092004@gmail.com"
}
dependency_check
local_ssh_key_gen
set_local_user
