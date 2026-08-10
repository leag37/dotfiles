#!/bin/fish

# Helper functions
function apt
	command sudo apt install -y $argv
end

function nerd_font
	command curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$argv.tar.xz
end

function nerd_fonts
	command mkdir -p ~/.fonts
	nerd_font JetBrainsMono
end

# Core applications
curl -fsS https://dl.brave.com/install.sh | sh
apt git
apt kitty
apt neovim

fish $PWD/scripts/install_fonts.sh

# Nerd fonts
nerd_fonts

# Terminal
apt lazygit
apt starship

# Apps
apt anki
apt libreoffice-still
apt mpv
apt proton-mail
apt proton-pass
apt proton-vpn-cli
apt steam

# Programming
apt gcc
apt github-cli
apt clang

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Stow
fish $PWD/scripts/stow.sh

# Shell
chsh -s $(which fish)
