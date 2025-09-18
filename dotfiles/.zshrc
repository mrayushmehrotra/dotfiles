# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ayush/.zshrc'

eval "$(starship init zsh)"

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.zinit/bin/zinit.zsh



# install zinit first 
zinit light zsh-users/zsh-autosuggestions &&
zinit light zsh-users/zsh-syntax-highlighting

# for ZSH
# lightning fast navigator (cd ing into your fav folder)

    asd() {
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



alias rustdesk='flatpak run com.rustdesk.RustDesk'
alias ls='ls --color=auto'
    alias grep='grep --color=auto'

