#!/bin/bash

nv_check="$(rpm -q neovim)"
if [[ -z "$nv_check" ]]; then
	sudo dnf install neovim
	git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
else
	echo "neovim is already installed";
fi
