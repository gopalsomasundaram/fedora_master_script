#!/bin/bash
echo "this is a master script that installs nvidia drivers and multimedia codecs through fedora fusion, also installs firefox, spotify, obsidian, steam, kitty(with conf), JetBrainsMono font and neovim with kickstarter";
echo "run the first part, wait, reboot then run part 2";
echo "make sure you have unzip, wget, git set up already";
read -p "Press enter to continue..."
babs fusion_and_mmcodecs.sh
bash nvidia.sh
echo modinfo -F version nvidia
modinfo -F version nvidia
