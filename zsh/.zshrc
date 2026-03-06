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

#export PATH="$PATH:/Users/jasoncobb/Library/Python/3.12/bin"
PATH=""
PATH="$PATH:/Users/jasoncobb/.rd/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/share/dotnet:~/.dotnet/tools:/Applications/Ghostty.app/Contents/MacOS:/Users/jasoncobb/Library/Application Support/JetBrains/Toolbox/scripts:/Users/jasoncobb/.dotnet/tools:/Users/jasoncobb/.local/bin:/Users/jasoncobb/.rd/bin"
#export PATH="$PATH:/opt/homebrew/bin"
#export PATH="$PATH:$HOME/.rd/bin"
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
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
alias vim=nvim
# alias ls=''
alias python='python3'
alias pubip="curl http://ifconfig.me; echo"
alias wifiip="ipconfig getifaddr en0"
alias localip="ipconfig getifaddr en1"
alias lvim=/Users/jasoncobb/.local/bin/lvim
alias fzfe='nvim $(fzf --preview="bat {}")'
alias bu='brew update && brew upgrade'
alias azs='az account set --subscription '
eval "$(fzf --zsh)"

# Sourcing powerlevel10k
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# eval "$(starship init zsh)"
# neofetch "$( fortune | cowsay -f stegosaurus)" | lolcat
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/my_config.toml)"
    eval "$(zoxide init zsh)"
fi
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jasoncobb/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
