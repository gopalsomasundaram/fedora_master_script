#!/bin/bash 

fusion_check="$(dnf repolist | grep rpmfusion)"
if [[ -z "$fusion_check" ]]; then
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-42.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-42.noarch.rpm -y
	sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
else
	if [[ "$fusion_check" =~ "rpmfusion-free" ]]; then
		echo fusion-free repository present;
	fi
	if [[ "$fusion_check" =~ "rpmfusion-nonfree" ]]; then
		echo fusion-nonfree repository present;
	fi
fi

mpeg_check="$(rpm -q ffmpeg)"
mpeg_free_check="$(rpm -q ffmpeg-free)"
if [[ "$mpeg_free_check" =~ "installed" ]]; then
	sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
else
	sudo dnf install ffmpeg -y
fi
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
