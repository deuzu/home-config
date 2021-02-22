#!/bin/bash

mkdir ~/bin
mkdir -p /tmp/install-home-config
cd /tmp/install-home-config

# Prerequisites
sudo apt update
sudo apt install \
    build-essential \
    pkg-config \
    libssl-dev \
    libxcb-composite0-dev \
    libx11-dev \
    fontconfig \
    vim \
    unzip \
    httpie \ # https://github.com/httpie/httpie
    jq \ # https://github.com/stedolan/jq
    ripgrep # https://github.com/BurntSushi/ripgrep

# Rust
# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# NodeJS + Npm
# https://github.com/tj/n
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
sudo bash n lts
rm n
mkdir ~/.npm
npm config set prefix ~/.npm

# Diff-So-Fancy
# https://github.com/so-fancy/diff-so-fancy
npm install --global diff-so-fancy

# Tokei
# https://github.com/XAMPPRocky/tokei
wget https://github.com/XAMPPRocky/tokei/releases/download/v12.0.4/tokei-x86_64-unknown-linux-gnu.tar.gz
tar -xvf tokei-x86_64-unknown-linux-gnu.tar.gz
rm tokei-x86_64-unknown-linux-gnu.tar.gz
sudo mv tokei /usr/local/bin/

# YTop
# https://github.com/cjbassi/ytop
wget https://github.com/cjbassi/ytop/releases/download/0.6.2/ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz
tar -xvf ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz
rm ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz
sudo mv ytop /usr/local/bin/

# Disk Usage Analyzer
# https://github.com/Byron/dua-cli
curl -LSfs https://raw.githubusercontent.com/byron/dua-cli/master/ci/install.sh | \
    sh -s -- --git byron/dua-cli --target x86_64-unknown-linux-musl --crate dua

# PrettyPing
# https://github.com/denilsonsa/prettyping#installation
wget https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
chmod +x prettyping
sudo mv prettyping /usr/local/bin/

# Bandwhich
# https://github.com/imsnif/bandwhich
wget https://github.com/imsnif/bandwhich/releases/download/0.20.0/bandwhich-v0.20.0-x86_64-unknown-linux-musl.tar.gz
tar -xvf bandwhich-v0.20.0-x86_64-unknown-linux-musl.tar.gz
rm bandwhich-v0.20.0-x86_64-unknown-linux-musl.tar.gz
sudo mv bandwhich /usr/local/bin/

# Bat
# https://github.com/sharkdp/bat
wget https://github.com/sharkdp/bat/releases/download/v0.16.0/bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
tar -xvf bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
rm bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
sudo mv bat-v0.16.0-x86_64-unknown-linux-gnu/bat /usr/local/bin/
rm bat-v0.16.0-x86_64-unknown-linux-gnu -rf

# Starship Fonts
# https://github.com/ryanoasis/nerd-fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
mkdir fonts
unzip FiraMono.zip -d fonts
rm FiraMono.zip
mkdir -p ~/.local/share/
mv fonts ~/.local/share/
fc-cache -f -v

# Starship
# https://github.com/starship/starship
wget https://github.com/starship/starship/releases/download/v0.47.0/starship-x86_64-unknown-linux-gnu.tar.gz
tar -xvf starship-x86_64-unknown-linux-gnu.tar.gz
rm starship-x86_64-unknown-linux-gnu.tar.gz
sudo mv starship /usr/local/bin/starship
mkdir ~/.config
cp /tmp/install-home-config/starship.toml ~/.config/starship.toml

# Nu Shell
# https://github.com/nushell/nushell
wget https://github.com/nushell/nushell/releases/download/0.27.1/nu_0_27_1_linux.tar.gz
tar -xvf nu_0_27_1_linux.tar.gz
rm nu_0_27_1_linux.tar.gz
sudo mkdir /usr/local/bin/nu
sudo mv nu_0_27_1_linux/nushell-0.27.1/nu/* /usr/local/bin/nu/
rm nu_0_27_1_linux -rf
sudo chsh --shel /usr/local/bin/nu/nu $(whoami)
