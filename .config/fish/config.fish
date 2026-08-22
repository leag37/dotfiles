source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

starship init fish | source

# Rust and Cargo
source "$HOME/.cargo/env.fish"

# zoxide for better cd
zoxide init fish | source
alias cd="z"
