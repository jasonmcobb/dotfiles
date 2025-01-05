dot_folders=(
    aerospace
    bat
    ghostty
    ohmyposh
    powershell
    nvim
    tmux
    wezterm
    zsh
)


echo "[+] - $(date '+%F %T') - Symlinking dotfiles"
for folder in ${dot_folders[@]}
do
    echo "    [+] - $(date '+%F %T') -  Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE --ignore=.DS_Store \
        -t $HOME $folder
    # stow -v -t $HiOME $folder
done
