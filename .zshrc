# Initialize Starship prompt
if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
fi

# Load additional profile and aliases
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Plugins
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Redraw the prompt correctly when the keymap changes.
# Fixes prompts disappearing when switching to vi mode.
function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select
