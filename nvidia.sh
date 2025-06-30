#!/bin/bash

#update before starting installation of nvidia drivers
sudo dnf update -y
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia -y

echo wait for a bit then reboot;
