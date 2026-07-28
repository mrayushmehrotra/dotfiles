

# --- ALIASES ---
alias ls='eza -lh --group-directories-first --icons=auto'
alias ll='eza -lh --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias la='eza -a --icons'
alias lla='eza -lha --icons --group-directories-first'
alias cd='z'

# --- SETTINGS HISTORY ---
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt sharehistory
#setopt CORRECT

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/
typeset -U PATH path

# --- CUSTOM FUNCTIONS ---
# Load Wallpaper Selector
if [ -f ~/.config/zsh/wallpaper.zsh ]; then
    source ~/.config/zsh/wallpaper.zsh
fi

# --- TOOLS & EXPORTS ---
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR="nvim"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# --- PLUGINS ---
source /home/ayush/.zinit/plugins/zsh-users---zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/ayush/.zinit/plugins/zsh-users---zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- CUSTOM PLUGIN STYLES ---
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'

ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='none'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='none'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='none'

ZSH_HIGHLIGHT_STYLES[number]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[bracket]='fg=#f9e2af'

# ==========================================
# ~/.zshrc
# ==========================================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------------
# Environment Variables & PATH
# ------------------------------------------
# Zsh safely appends to PATH without duplicates using typeset
typeset -U path

path=(
    "/home/ayush/.cache/.bun/bin"
    "/home/ayush/.opencode/bin"
    "/home/ayush/.kimi-code/bin"
    "$HOME/.local/bin"
    $path
)
export PATH

# AI / Ollama Configuration
export ANTHROPIC_BASE_URL="http://localhost:11434"
export ANTHROPIC_API_KEY="ollama" 
# export ANTHROPIC_AUTH_TOKEN="freecc"

# ------------------------------------------
# Custom Functions
# ------------------------------------------
# Quick directory navigation using fzf
asd() {
    local selected
    # Use fzf to select a directory
    selected=$(find ~/personal ~/work ~/* ~/.config -mindepth 1 -maxdepth 3 -type d 2>/dev/null | fzf)

    # Check if a directory was selected
    if [ -n "$selected" ]; then
        # Change to the selected directory
        cd "$selected" || { echo "Failed to change directory"; return 1; }
    else
        echo "No directory selected."
    fi
}

# ------------------------------------------
# Aliases
# ------------------------------------------
alias grep='grep --color=auto'
alias vim='nvim'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# ------------------------------------------
# Prompt & Theme Initialization
# ------------------------------------------
# Fallback Zsh prompt (similar to your old bash one)

# Initialize Starship Prompt
#eval "$(starship init zsh)"
