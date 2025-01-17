# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# powerlevel10k Theme
# source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Exports
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE=/opt/homebrew/bin/fzf
export PATH="$PATH:/Users/jasoncobb/.dotnet/tools:/Users/jasoncobb/.local/bin"
# export PATh="$PATH:/Applications/DevPod.app/Contents/Mac/devpod-cli"
export PATH="$PATH:/Users/jasoncobb/Library/Python/3.12/bin"
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export AZURE_TENANT_ID=""
export AZURE_CLIENT_ID=""
export AZURE_CLIENT_SECRET=""
export AZURE_SUBSCRIPTION_ID=""
export JFROG_USERNAME=""
export JFROG_SECRET=""
export SSL_CERT_DIR=/Users/jasoncobb/Work/VoltageTesting/TrustStore
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
alias lvim=/Users/jasoncobb/.local/bin/lvim
alias fzfe='nvim $(fzf --preview="bat {}")'

eval "$(fzf --zsh)"
# Sourcing powerlevel10k
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# eval "$(starship init zsh)"
# neofetch "$( fortune | cowsay -f stegosaurus)" | lolcat
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/my_config.toml)"
fi
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
