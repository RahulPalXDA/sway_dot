#!/bin/bash
install_fonts() {
	sudo pacman -S ttf-jetbrains-mono
}
copy_configs() {
	cp -r config/* ~/.config/
}
install_fonts
copy_configs
