# Created by newuser for 5.9

# Created by newuser for 5.9
# Force UTF-8 support
export LC_CTYPE=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Default editor
export EDITOR=nvim
export VISUAL=nvim

#alias
alias dd="dolphin ."
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
alias zed="zeditor ."
alias nn='nvim .'
alias ls="eza --icons"
alias ll="eza -la --icons"
alias brun="bun --bun run dev"

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



# pnpm
export PNPM_HOME="/home/pydi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export LS_COLORS="di=01;33:ex=01;32"
export LS_COLORS="di=01;03;38;5;118:ex=38;5;142:ln=38;5;109"

# ===== EZA COLOR COMBINATIONS =====
# Current active (lime green folders):
export LS_COLORS="di=01;03;38;5;118:ex=38;5;142:ln=38;5;109"

# Bright Cyan variations:
# export LS_COLORS="di=01;03;36:ex=38;5;142:ln=38;5;109"              # Standard bright cyan
# export LS_COLORS="di=01;03;38;5;51:ex=38;5;142:ln=38;5;109"         # Brighter cyan
# export LS_COLORS="di=01;03;38;5;87:ex=38;5;142:ln=38;5;109"         # Electric cyan
# export LS_COLORS="di=01;03;38;5;39:ex=38;5;142:ln=38;5;109"         # Deep cyan

# Magenta variations:
# export LS_COLORS="di=01;03;35:ex=38;5;142:ln=38;5;109"              # Standard bright magenta
# export LS_COLORS="di=01;03;38;5;198:ex=38;5;142:ln=38;5;109"        # Hot pink magenta
# export LS_COLORS="di=01;03;38;5;165:ex=38;5;142:ln=38;5;109"        # Purple-magenta
# export LS_COLORS="di=01;03;38;5;201:ex=38;5;142:ln=38;5;109"        # Electric magenta

# Orange-Red variations:
# export LS_COLORS="di=01;03;38;5;202:ex=38;5;142:ln=38;5;109"        # Bright red-orange
# export LS_COLORS="di=01;03;38;5;196:ex=38;5;142:ln=38;5;109"        # Fire orange
# export LS_COLORS="di=01;03;38;5;208:ex=38;5;142:ln=38;5;109"        # Sunset orange
# export LS_COLORS="di=01;03;38;5;203:ex=38;5;142:ln=38;5;109"        # Coral red

# Original warm orange:
# export LS_COLORS="di=01;03;38;5;214:ex=38;5;142:ln=38;5;109"        # Warm orange (original)

# To switch colors: uncomment your preferred line and comment out the current active one
# Then run: source ~/.zshrc
