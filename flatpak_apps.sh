#!/bin/bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client -y 
flatpak run com.spotify.Client &
flatpak install flathub md.obsidian.Obsidian -y
flatpak run md.obsidian.Obsidian &
