# Initialize Starship prompt
eval "$(starship init zsh)"

# Load additional profile and aliases
source ~/.profile
source ~/.zsh_aliases

# Redraw the prompt correctly when the keymap changes.
# Fixes prompts disappearing when switching to vi mode.
function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select
