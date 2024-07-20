#!/bin/sh
# Adding a commit
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Global Variables, Edit these.
dot_folders=(
    bat
    ohmyposh
    powershell
    nvim
    tmux
    wezterm
    zsh
)

font_dir="fonts"

echo "[+] - $(date '+%F %T') - Dot File and Configuration Started"
# Install Fonts
echo "[+] - $(date '+%F %T') - Installing Fonts"
for file_name in $script_dir/fonts/*
do
    echo "    [+] - $(date '+%F %T') - $(awk 'END{ var=FILENAME; split (var,a,/\//); print a[length(a)]}' $file_name)"
    cp $file_name $HOME/Library/Fonts/
done

# Install oh-my-zsh
echo "[+] - $(date '+%F %T') - Checking for oh-my-zsh"
if ls $HOME/.oh-my-zsh >/dev/null
then
    echo "    [+] - $(date '+%F %T') - oh-my-zsh found, updating"
    $HOME/.oh-my-zsh/tools/upgrade.sh >/dev/null
else
    echo "    [+] - $(date '+%F %T') - oh-my-zsh not found, installing"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install brew
echo "[+] - $(date '+%F %T') - Checking for brew"
if brew --version >/dev/null; then
    echo "    [+] - $(date '+%F %T') - brew found, updating"
    brew update
else
    echo "[+] - $(date '+%F %T') - brew not found, installing"
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

echo "[+] - $(date '+%F %T') - Updating brew formulae"
for i in $(cat $script_dir/brew/brew_formulae.list)
do
    install_or_upgrade $i
done

echo "[+] - $(date '+%F %T') - Updating brew cask packages"
for i in $(cat $script_dir/brew/brew_cask.list)
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
