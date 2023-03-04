#!/bin/bash
install_fonts() {
	sudo pacman -S ttf-jetbrains-mono
}
copy_configs() {
	cp -r config/* ~/.config/
}
copy_sound() {
	cp -r local/share/sounds/Bixby.ogg ~/.local/share/sounds/Bixby.ogg
}
install_fonts
copy_configs
copy_sound
