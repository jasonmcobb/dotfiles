#!/bin/sh

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Global Variables, Edit these.
dot_folders=(
    nvim
    p10k
    tmux
    wezterm
    zsh
)

font_dir="fonts"

brew_packages=(
    nvim
    stow    
    tmux
)

brew_cask_packages=(
    amethyst
    wezterm
)
echo "[+] - $(date '+%F %T') - Dot File and Configuration Started" 
# Install Fonts
echo "[+] - $(date '+%F %T') - Installing Fonts"
for file_name in $script_dir/fonts/*
do
    cp $file_name $HOME/Library/Fonts/
done

# Install oh-my-zsh
echo "[+] - $(date '+%F %T') - Installing or Updating oh-my-zsh"
if ls $HOME/.oh-my-zsh >/dev/null 
then
    $HOME/.oh-my-zsh/tools/upgrade.sh
else
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install brew
echo "[+] - $(date '+%F %T') - Installing or Updating brew"
if brew --version >/dev/null; then
    brew update
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Brew installer helper functions
function install_or_upgrade {
    if brew ls --versions "$1" >/dev/null 
    then
        HOMEBREW_NO_AUTO_UPDATE=1 
        brew upgrade "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 
        brew install "$1"
    fi

    HOMEBREW_NO_AUTO_UPDATE=0
}

function install_or_upgrade_cask {
    if brew ls --versions --cask "$1" >/dev/null
    then
        HOMEBREW_NO_AUTO_UPDATE=1 
        brew upgrade --cask "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1
        brew install --cask "$1"
    fi

    HOMEBREW_NO_AUTO_UPDATE=0
}

echo "[+] - $(date '+%F %T') - Updating brew packages"
for i in ${brew_packages[@]}
do
    install_or_upgrade $i    
done

echo "[+] - $(date '+%F %T') - Updating brew cask packages"
for i in ${brew_cask_packages[@]}
do
    install_or_upgrade_cask $i
done

echo "[+] - $(date '+%F %T') - Cleaning up brew"
brew cleanup

echo "[+] - $(date '+%F %T') - Symlinking dotfiles"
for folder in ${dot_folders[@]}
do
    echo "    [+] - $(date '+%F %T') -  Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE --ignore=.DS_Store \
        -t $HOME $folder
    # stow -v -t $HiOME $folder
done

echo "[+] - $(date '+%F %T') - Checking for TPM Installed"
if ! ls $HOME/.tmux/plugins/tpm >/dev/null
then
    echo "    [+] - $(date '+%F %T') - TPM not found, installing"
    mkdir -p $HOME/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

echo "[+] - $(date '+%F %T') - Installing TMUX Plugins" 
$HOME/.tmux/plugins/tpm/bin/install_plugins

echo "[+] - $(date '+%F %T') - Checking for Powerlevel10k"
if ! ls $HOME/.powerlevel10k >/dev/null
then
    echo "    [+] - $(date '+%F %T') - Powerlevel10k not found, installing"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
fi

echo "[+] - $(date '+%F %T') - Checking for VS Code installed"
if which code >/dev/null
then
    echo "    [+] - $(date '+%F %T') - Moving settings.json into place"
    cp $script_dir/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    echo "    [+] - $(date '+%F %T') - Installing VS Code Extensions"
    for extension in $(cat $script_dir/vscode/extensions.list)
    do
        echo "        [+] - $(date '+%F %T') - Installing Extension $extension"
        code --install-extension $extension >/dev/null
    done
fi

# Reload shell once installed
echo "[+] - $(date '+%F %T') - Reloading shell..."
exec $SHELL -l
