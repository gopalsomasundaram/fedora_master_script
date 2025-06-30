#!/bin/bash

steam_check="$(rpm -q steam)"
if [[ -z "$steam_check" ]]; then
	sudo dnf install steam -y 
	#will work only after the rpm fusion non free repo is added ofc
else
	echo "steam is already installed";
fi
