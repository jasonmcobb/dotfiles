if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# powerlevel10k Theme
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Exports
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE=/opt/homebrew/bin/fzf

# This is the default theme
# ZSH_THEME="robbyrussell"
ZSH_THEME="avit"

# Plugins
plugins=(
    aliases
    fzf
    git
    kubectl
    last-working-dir
    macos
    ripgrep
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

# Plugin Configuration
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# Required for OMZ to work
source $ZSH/oh-my-zsh.sh
# Aliases
alias docker=podman
alias vim=nvim
alias ls='ls -laG'
alias pubip="curl http://ifconfig.me; echo"
alias wifiip="ipconfig getifaddr en0"
alias localip="ipconfig getifaddr en1"

# Sourcing powerlevel10k 
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# neofetch "$( fortune | cowsay -f stegosaurus)" | lolcat
