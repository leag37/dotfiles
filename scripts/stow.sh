#!/bin/fish

function stow
	argparse 'd/dir=' 't/target=' -- $argv
	or return

	if set -q _flag_target
		if [ $_flag_target != '~' ]
			command mkdir -p $_flag_target
		end
	end
	command stow -d $_flag_dir -t $_flag_target
end

stow -d .config/nvim -t ~/.config/nvim
