# Created by newuser for 5.9
# Force UTF-8 support
export LC_CTYPE=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Default editor
export EDITOR=nvim
export VISUAL=nvim

#alias
alias e="exit"
alias ez="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias envim='cd && cd ~/.config/nvim/ && nvim'
alias kite=" nvim ~/.config/kitty/kitty.conf"
alias snh="shutdown now -h"
alias pro='cd ~/Projects/ && nvim'
alias cdp="cd ~/Projects"
alias p="pnpm"
alias cc="code ."
alias nn='nvim .'
alias kill5='lsof -ti :5639 | xargs kill -9'

#tmux
alias t="tmux"
alias ta="tmux attach"
alias tls="tmux list-sessions"
alias tkill="tmux kill-server"
alias te="nvim ~/.tmux.conf"
alias tes="tmux source-file ~/.tmux.conf"


#nix
alias nixe="sudo -E nvim /etc/nixos/configuration.nix"
alias nixs="sudo nixos-rebuild switch"
alias nixlist="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
alias nixdelete="sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system"

#starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"



