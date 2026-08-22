#!/bin/fish

# Helper functions
function pacman
	command sudo pacman -S --noconfirm --needed $argv
end

function yay
	command yay -S --noconfirm --needed $argv
end

# Initial sync and update
pacman -yu

# Core applications
pacman brave-bin
pacman kitty
pacman nerd-fonts
pacman nvim
pacman stow
pacman wl-clipboard
pacman yay

# Terminal
pacman lazygit
pacman starship

# Apps
pacman anki
pacman celluloid
pacman libreoffice-still
pacman mpv
pacman proton-mail
pacman proton-pass
pacman steam
pacman strawberry
pacman zoxide

# VPN
pacman proton-vpn-cli
pacman proton-vpn-gtk-app
yay -S nordvpn-gui
sudo groupadd nordvpn
sudo usermod -aG nordvpn $USER
sudo systemctl enable --now nordvpn

# Programming
pacman clang
pacman cmake
pacman dotnet-runtime
pacman dotnet-sdk
pacman gcc
pacman github-cli
pacman lldb
pacman lua
pacman luarocks
pacman ninja
pacman tree-sitter
pacman tree-sitter-cli

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Stow
#fish $PWD/scripts/stow.sh

# NPM and NVM
pacman nodejs
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install edc/bass
fisher install jorgebucaran/nvm.fish
nvm install latest
node --version > ~/.nvmrc
nvm use
set --universal nvm_default_version $(node --version)

# Local environment
git config --global user.name "Gael Huber"
git config --global user.email "gael.scott.huber@gmail.com"
