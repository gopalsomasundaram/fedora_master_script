#!/bin/bash
#first install kitty if not already installed
k_check="$(rpm -q kitty)";
if [[ "$k_check" == *"not installed" ]]; then
	sudo dnf install kitty -y;
else
	echo "kitty is already installed";
fi

#check if kitty config directory exists
CONFIG_DIR="$HOME/.config/kitty";
if [[ -d "$CONFIG_DIR"  ]]; then
	echo "directory exists";
else
	mkdir --parents $CONFIG_DIR;
fi

#check if kitty.conf file is present
if [[ -f "$CONFIG_DIR/kitty.conf" ]]; then
	echo "conf file is present";
else
	#if not get it from github and put it in config dir
	wget -O $CONFIG_DIR/kitty.conf https://raw.githubusercontent.com/gopalsomasundaram/everything_config/refs/heads/master/kitty.conf
fi

#same thing for current-theme.conf
if [[ -f "$CONFIG_DIR/current-theme.conf" ]]; then
	echo "theme file is present";
else
	#if not get it from github and put it in config dir
	wget -O $CONFIG_DIR/current-theme.conf https://raw.githubusercontent.com/gopalsomasundaram/everything_config/refs/heads/master/current-theme.conf
fi
