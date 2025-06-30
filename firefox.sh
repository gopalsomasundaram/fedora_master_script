#!/bin/bash

x="$(rpm -q firefox)"
if [ -z "$x" ]; then
	#this means firefox isn't installed
	sudo dnf install firefox -y
else
	echo "firefox is already installed";
fi
