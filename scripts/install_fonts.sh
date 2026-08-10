#!/bin/fish

# Helper functions
function nerd_font
	command curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$argv.tar.xz
	rm $argv.tar.xz
end

mkdir -p ~/.fonts
nerd_font JetBrainsMono
