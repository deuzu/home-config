#!/bin/bash

mkdir ~/bin
mkdir -p /tmp/install-home-config
cd /tmp/install-home-config

# Prerequisites
sudo apt update
sudo apt install \
    build-essential \
    pkg-config \
    ca-certificates \
    curl \
    # libssl-dev \
    # libxcb-composite0-dev \
    # libx11-dev \
    fontconfig \
    vim \
    unzip \
    # https://github.com/httpie/httpie
    httpie \
    # https://github.com/stedolan/jq
    jq

# Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ## UBUNTU_CODENAME for mint
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world

# fnm - https://github.com/Schniz/fnm
curl -fsSL https://fnm.vercel.app/install | bash
# Rust - https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Difftastic - https://difftastic.wilfred.me.uk/installation.html
cargo install difftastic
# Tokei - https://github.com/XAMPPRocky/tokei
cargo install tokei
# YTop - https://github.com/cjbassi/ytop
cargo install ytop
# Disk Usage Analyzer - https://github.com/Byron/dua-cli
cargo install dua-cli
# PrettyPing - https://github.com/k4yt3x/rustyping
cargo install rustyping
sudo setcap cap_net_raw=+eip $(which rp)
# Bandwhich - https://github.com/imsnif/bandwhich
cargo install bandwhich
sudo setcap cap_sys_ptrace,cap_dac_read_search,cap_net_raw,cap_net_admin+ep $(command -v bandwhich)
# Bat - https://github.com/sharkdp/bat
cargo install bat
# fd - https://github.com/sharkdp/fd
cargo install fd-find
# ripgrep - https://github.com/BurntSushi/ripgrep
cargo install ripgrep
# Helix - https://docs.helix-editor.com/install.html
cargo install helix
# tealdeer - https://github.com/dbrgn/tealdeer
cargo install tealdeer
tldr --update

# Starship
## Fonts - https://github.com/ryanoasis/nerd-fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
mkdir fonts
unzip FiraMono.zip -d fonts
rm FiraMono.zip
mkdir -p ~/.local/share/
mv fonts ~/.local/share/
fc-cache -f -v

## Core - https://github.com/starship/starship
wget https://github.com/starship/starship/releases/download/v0.47.0/starship-x86_64-unknown-linux-gnu.tar.gz
tar -xvf starship-x86_64-unknown-linux-gnu.tar.gz
rm starship-x86_64-unknown-linux-gnu.tar.gz
sudo mv starship /usr/local/bin/starship
mkdir ~/.config
cp /tmp/install-home-config/starship.toml ~/.config/starship.toml

#
rm /tmp/install-home-config -rf
