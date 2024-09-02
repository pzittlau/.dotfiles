#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )

INSTALL_DIR=~/Installs/
mkdir -p "$INSTALL_DIR"

echo -e "Installing system utilities through apt."
sudo apt update && sudo apt upgrade -y
sudo apt install -y linux-headers-amd64 build-essential awesome awesome-extra x11-xserver-utils xserver-xorg-input-all xserver-xorg-video-all alacritty tmux vim stow tldr firefox-esr xorg htop vlc brightnessctl network-manager vim wget zip unzip 7zip git tlp ssh openconnect cmake gettext curl fzf ripgrep alsa-utils pipewire pavucontrol acpid blueman pamixer pipewire-alsa playerctl firmware-misc-nonfree htop python3-pip ssh openconnect bluez-firmware bluetooth libspa-0.2-bluetooth sbc-tools libsbc1
sudo apt update && sudo apt upgrade -y

echo -e "\n\nCreating symlinks to configuration files"
rm ~/.bashrc
stow alacritty awesome bash nvim tmux

echo -e "\n\nInstalling tmux plugin manager"
if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
# Install tmux plugins, tmux get's killed at the end of the script, when 
# everything should be installed
tmux new-session -d
tmux send-keys -t 0 C-Space I

echo -e "\n\nInstalling neovim"
cd "$INSTALL_DIR"
if [[ ! -d "$INSTALL_DIR/neovim" ]]; then
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    echo -e "Building stable release"
    make CMAKE_BUILD_TYPE=Release
    echo -e "Installing stable release"
    sudo make install
else
    cd neovim
    echo -e "Switching to new stable release"
    git checkout master >/dev/null 2>&1
    # git reset --hard >/dev/null 2>&1
    git pull >/dev/null 2>&1
    git checkout stable >/dev/null 2>&1
    echo -e "Building new stable release"
    make CMAKE_BUILD_TYPE=Release >/dev/null 2>&1
    echo -e "Installing new stable release"
    sudo make install >/dev/null 2>&1
fi
cd "$SCRIPT_DIR"

echo -e "\n\nInstalling FiraCode Nerd Font"
cd "$INSTALL_DIR"
rm -rf FiraCode
wget --show-progress -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz -P FiraCode
mkdir -p ~/.local/share/fonts
tar xf FiraCode/FiraCode.tar.xz --directory=../.local/share/fonts
fc-cache -fv >/dev/null 2>&1
cd "$SCRIPT_DIR"

echo -e "\n\nInstalling Discord"
cd "$INSTALL_DIR"
rm -rf discord && mkdir discord && cd discord
wget --show-progress -q "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install -y ./discord.deb
cd "$SCRIPT_DIR"

echo -e "\n\nUpdate TLDR references"
tldr -u

echo -e "\n\nInstalling Zig"
cd "$INSTALL_DIR"
if [[ ! -d "~/.zig" ]]; then
    rm -rf zig && mkdir zig && cd zig
    wget "https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz"
    tar xf zig-linux-x86_64-0.13.0.tar.xz
    mv zig-linux-x86_64-0.13.0 ~/.zig
fi
cd "$SCRIPT_DIR"

echo -e "\n\nInstalling Rust"
cd "$INSTALL_DIR"
if [[ ! -d "~/.rustup" ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
    rustup check
    rustup update
fi

echo -e "\n\nInstall z"
cd "$INSTALL_DIR"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# TODO: install vscode

echo -e "\n\nConfiguring Services"
sudo systemctl set-default graphical.target
sudo systemctl enable --now acpid
sudo systemctl enable --now tlp
systemctl enable --now --user pipewire-pulse.service
systemctl enable --now --user pipewire.service

sudo systemctl disable --now networking
sudo systemctl enable --now NetworkManager

sudo service bluetooth restart
sudo service bluealsa restart

sudo apt autoremove -y

# Now the tmux plugins should be installed, so kill it
tmux kill-session -t 0
