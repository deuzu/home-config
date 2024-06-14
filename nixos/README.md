# NixOS

```console
nix-shell -p git --command "git clone -n --depth=1 --filter=tree:0 https://github.com/deuzu/dotfiles.git $HOME/nixos && cd $HOME/nixos && git sparse-checkout set --no-cone nixos && git checkout"
sudo nixos-rebuild switch --flake ~/nixos/#default
```

## To do

- [ ] i18n keyboard layout
- [ ] vpn
- [ ] kubectl
- [ ] terraform
- [ ] fonts
- [ ] window manager (sway or i3) https://nixos.wiki/wiki/Sway
- [ ] atuin import auto
- [ ] neovim
- [ ] secrets https://github.com/Mic92/sops-nix https://github.com/ryantm/agenix

https://home-manager-options.extranix.com/?query=&release=master
https://search.nixos.org/options?channel=23.11&from=0&size=50&sort=relevance&type=packages&query=
https://search.nixos.org/packages?channel=23.11&from=0&size=50&sort=relevance&type=packages
