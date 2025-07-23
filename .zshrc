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

# Configure pager behavior (e.g. for git diff, man)
# Default behavior: LESS=FRX
# 'F': Quit if output fits on one screen
# 'R': Enable ANSI color codes
# 'X': Prevent clearing screen after quitting (remove for clean prompt)
export LESS=R

# Conditionally set NODE_PATH to Yarn global modules if Yarn is installed
if command -v yarn >/dev/null; then
  export NODE_PATH=$(yarn global dir)/node_modules
fi

# History config - needed for zsh-autosuggestions
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Redraw the prompt correctly when the keymap changes.
# Fixes prompts disappearing when switching to vi mode.
function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select
