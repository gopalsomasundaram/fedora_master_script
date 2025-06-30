#!/bin/bash

font_check="$(fc-list | grep JetBrains)"
if [[ -z "$font_check" ]]; then
	wget $HOME/JetBrainsMono.zip /https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
	sudo mkdir -p /usr/local/share/fonts/jetb/
	sudo mv $HOME/JetBrainsMono.zip /usr/local/share/fonts/jetb/
	sudo unzip /usr/local/share/fonts/jetb/JetBrainsMono.zip
	sudo rm /usr/local/share/fonts/jetb/JetBrainsMono.zip
	sudo fc-cache -v
else
	echo "jetbrains is already installed";
fi
